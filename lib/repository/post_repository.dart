import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pro_23/constant/api_constant.dart';
import 'package:pro_23/core/util/api_client.dart';
import 'package:pro_23/model/post_daa_model.dart';
import 'package:pro_23/service/storage_service.dart';

class PostRepository {
  PostRepository(this._api);
  final Dio dio = Dio();
  final StorageService storage = Get.find<StorageService>();

  final ApiClient _api;

  Future<(PostDataModel?, String?)> getPageTest({
    int page = 0,
    int size = 10,
    String? title,
    bool? published,
  }) async {
    try {
      final response = await _api.get(
        ApiConstant.baseUrl + ApiConstant.posts,
        query: {
          'page': page,
          'size': size,
          'sortBy': 'createdAt',
          'direction': 'desc',
          if (title != null && title.isNotEmpty) 'title': title,
          if (published != null) 'published': published,
        },
      );

      print('Repository');
      print(response);

      return (PostDataModel.fromJson(response), null);
    } catch (e) {
      return (null, e.toString());
    }
  }

  Future<(Data?, String?)> createPost({
    required String title,
    required String content,
    required bool published,
  }) async {
    try {
      final String? token = await storage.getString('token');

      if (token == null || token.isEmpty) {
        return (null, 'Token not found');
      }
      final Response<dynamic> response = await dio.post(
        'https://flutter-api.janrent.com/api/posts',
        data: <String, dynamic>{
          'title': title,
          'content': content,
          'published': published,
        },
        // Request Header
        options: Options(
          headers: <String, dynamic>{
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      print('========== REQUEST ==========');
      print('URL: ${response.requestOptions.uri}');
      print('METHOD: ${response.requestOptions.method}');
      print('HEADERS: ${response.requestOptions.headers}');
      print('BODY: ${response.requestOptions.data}');
      print('==============================');

      print('STATUS: ${response.statusCode}');
      print('RESPONSE: ${response.data}');
      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      final Map<String, dynamic> json = Map<String, dynamic>.from(
        response.data as Map,
      );

      return (Data.fromJson(json), null);
    } on DioException catch (e) {
      print('========== DIO ERROR ==========');
      print('TYPE: ${e.type}');
      print('MESSAGE: ${e.message}');
      print('STATUS: ${e.response?.statusCode}');
      print('RESPONSE: ${e.response?.data}');
      print('REQUEST: ${e.requestOptions.uri}');
      print('================================');
      // THIS WILL RUN FOR 400
      print('========== REQUEST ==========');
      print('URL: ${e.requestOptions.uri}');
      print('METHOD: ${e.requestOptions.method}');
      print('HEADERS: ${e.requestOptions.headers}');
      print('BODY: ${e.requestOptions.data}');
      print('==============================');

      print('========== RESPONSE ==========');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('==============================');

      return (
        null,
        e.response?.data?['message']?.toString() ??
            e.message ??
            'Request failed',
      );
    } catch (e) {
      print('========== ERROR ==========');
      print(e);
      print('============================');

      return (null, e.toString());
    }
  }
}
