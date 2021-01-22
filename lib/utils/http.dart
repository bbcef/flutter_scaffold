import 'package:dio/dio.dart';
import 'package:flutter_scaffold/config.dart';
import 'package:flutter_scaffold/utils/toast.dart';
class Http{
  
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout
  );

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,{String method = 'get',Map<String, dynamic> params, Interceptor inter}) async {

    // 创建单独配置
    final options = Options(method:method);

    // 全局拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options){
        return options;
      },
      onResponse: (response){
        return response;
      },
      onError: (err){
        // print(err);
      } 
    );

    List<Interceptor> inters = [dInter];

    if(inter != null){
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);
    // 发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      formatError(e);
      return Future.error(e);
    }
  }
}


void formatError(DioError e) {
  cancel();
  if (e.type == DioErrorType.CONNECT_TIMEOUT) {
    showToast("网络好像出问题了");
  } else if (e.type == DioErrorType.SEND_TIMEOUT) {
    showToast("请求超时");
  } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
    showToast("响应超时");
  } else if (e.type == DioErrorType.RESPONSE) {
    showToast("出现异常");
  } else if (e.type == DioErrorType.CANCEL) {
    showToast("请求取消");
  } else {
    showToast("网络好像出问题了");
  }
}