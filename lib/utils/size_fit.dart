import 'dart:ui';

class CsSizeFit{
  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;
  static void initialize(){
    // 手机物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    
    // 手机屏幕分辨率
    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 状态栏高度
    statusHeight = window.padding.top / dpr;

    
    // print('手机屏幕分辨率 $screenWidth * $screenHeight 状态栏高度 $statusHeight ');
  }
}