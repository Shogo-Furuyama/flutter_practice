import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project/api/dto/check_auth_response.dart';
import 'package:retrofit/retrofit.dart';

part 'misskey_api.g.dart';

@RestApi()
abstract class MisskeyApi {
  factory MisskeyApi(Dio dio, {String baseUrl}) = _MisskeyApi;
  @POST("/api/miauth/{session}/check")
  Future<CheckAuthResponse> checkAuth(@Path() String session);
}

class MisskeyApiFactory {
  MisskeyApi create(String baseUrl) {
    return MisskeyApi(Dio(), baseUrl: baseUrl);
  }
}

final misskeyApiFactoryProvider = Provider((ref) {
  return MisskeyApiFactory();
});
