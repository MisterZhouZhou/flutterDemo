/**
 *  网络请求工具类
 */
import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  Options options;

  /**
   *  创建单利
   */
  static HttpUtil getInstance() {
    if(instance == null){
      instance = new HttpUtil();
    }
    return instance;
  }

  HttpUtil(){
    options = Options(
        // 请求基地址
        baseUrl: "https://www.xx.com/api",
        //连接服务器超时时间，单位是毫秒.
        connectTimeout: 10000,
        ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
        ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
        ///  注意: 这并不是接收数据的总时限.
        receiveTimeout: 3000,
        headers: {},
    );
    dio = new Dio(options);
  }

  /**
   *  get
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try{
      response = await dio.get(
        url, 
        data: data,
        cancelToken: cancelToken
      );
    } on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }
    }
    return response.data;
  }

  /**
   *  post
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try{
      response = await dio.post(
          url,
          data: data,
          cancelToken: cancelToken
      );
    } on DioError catch(e){
      if(CancelToken.isCancel(e)){
        print('get请求取消! ' + e.message);
      }
    }
    return response.data;
  }

}


/**
 * 调用方式
 *  HttpUtil.getInstance().get
 *  HttpUtil().get
 */