import 'dart:io';
import 'package:string_scanner/string_scanner.dart';
import 'package:path/path.dart' as path;

/// 说明: iconfont 解析构造器

bool deleteCss = true; // 是否删除 css
bool mergeClass = true; // 多个字体文件时是否融合成一个类
String className = 'NhtcIcons'; // 融合成一个类时类名
String resDir = 'assets/fonts/nhtc_iconfont'; //资源文件地址
String dist = 'utils/nhtc_icon'; //输出文件地址

main() async {
  File target = File(path.join(Directory.current.path, 'lib', dist, '$className.dart'));
  if(mergeClass&&target.existsSync()) {
    await target.writeAsString('');
  }

  await parserResDir(resDir, dist);

  if (mergeClass) {
    String content = await target.readAsString();
    String result = """import 'package:flutter/widgets.dart';
//Power By 张风捷特烈 --- Generated file. Do not edit.

class $className {
    $className._();
""";
    result += content;
    result += "}";
    await target.writeAsString(result);
  }
}

Future<void> parserResDir(String resDir, String dist) async {
  Directory dir = Directory(path.join(Directory.current.path, resDir));
  List<FileSystemEntity> files = dir.listSync();

  for (int i = 0; i < files.length; i++) {
    File file = files[i];
    if (file is File && file.path.endsWith('.css')) {
      String fontName = path.basenameWithoutExtension(file.path);
      await buildAnIconFont(resDir, fontName, dist);
    }
  }
}

Future<void> buildAnIconFont(
    String resDir, String fontName, String dist) async {
  String fontPath = '$resDir/$fontName.ttf';
  String cssPath = '$resDir/$fontName.css';
  File target = File(path.join(Directory.current.path, cssPath));
  if (!target.existsSync()) return;

  String str = await target.readAsString();

  List<String> names = [];
  List<String> unicodes = [];
  StringScanner _scanner = StringScanner(str);

  while (!_scanner.isDone) {
    if (_scanner.scan(RegExp(r'\.icon-(.*?):'))) {
      String word = _scanner.lastMatch[1];
      names.add(word);
    }

    if (_scanner.scan(RegExp(r'"\\(.*?)"'))) {
      String word = _scanner.lastMatch[1];
      unicodes.add(word);
    }

    if (!_scanner.isDone) {
      _scanner.position++;
    }
  }
  assert(names.length == unicodes.length);

  Map<String, String> iconMap = Map.fromIterables(names, unicodes);
  String code = getCode(iconMap, fontName: fontName);
  await save2File(code, filePath: dist, fontName: fontName);
  await handleYaml(family: fontName, asset: fontPath);
  if (deleteCss) await target.delete();
  // 删除样式文件
  print('创建 $fontName 完毕!');
}

Future<void> handleYaml({String family = 'TolyIcon',
    String asset = 'assets/iconfont/iconfont.ttf'}) async {
  File yamlFile = File(path.join(Directory.current.path, 'pubspec.yaml'));
  List<String> yamlLines = await yamlFile.readAsLines();
  RegExp fontsReg = RegExp(r'^  fonts\:');
  RegExp familyReg = RegExp(r'\- family:.*' + family);
  RegExp commentReg = RegExp(r'#.*');

  int fontLine = -1;
  int familyLine = -1;
  for (int i = 0; i < yamlLines.length; i++) {
    // 去除注释
    String pureLine = yamlLines[i].replaceAll(commentReg, '');
    if (fontsReg.hasMatch(pureLine)) {
      fontLine = i;
    }
    if (familyReg.hasMatch(pureLine)) {
      familyLine = i;
    }
  }

  String config = """
    - family: $family
      fonts:
        - asset: $asset""";

  if (fontLine == -1) {
    // fontLine 不存在，则添加 fonts: 节点和配置
    yamlLines.add('  fonts: ');
    yamlLines.add(config);
  } else {
    if (familyLine == -1) {
      // familyLine 不存在，则添加节点和配置
      yamlLines.insert(fontLine + 1, config);
    } else {
      // 否则说明该图标字体已配置，无须处理
      return;
    }
  }
  await yamlFile.writeAsString(yamlLines.join('\n'));
}

Future<void> save2File(String content,
    {String filePath: 'generate/icon', String fontName: 'TolyIcon'}) async {

  if(mergeClass){
    File target = File(
        path.join(Directory.current.path, 'lib', filePath, '$className.dart'));
    if (!target.existsSync()) {
      await target.create(recursive: true);
    }
    await target.writeAsString(content,mode: FileMode.append);
  }else{
    File target = File(
        path.join(Directory.current.path, 'lib', filePath, '$fontName.dart'));
    if (!target.existsSync()) {
      await target.create(recursive: true);
    }
    await target.writeAsString(content);
  }
}

String getCode(Map<String, String> iconMap, {String fontName: 'TolyIcon'}) {
  String content = '';
  iconMap.forEach((key, value) {
    content +=
        """static const IconData $key = IconData( 0x$value, fontFamily: "$fontName");\n""";
  });

  if (mergeClass) {
    return content;
  }
  String result = """import 'package:flutter/widgets.dart';
//Power By 张风捷特烈 --- Generated file. Do not edit.

class $fontName {
    $fontName._(); 
""";
  result += content;
  result += "}";
  return result;
}
