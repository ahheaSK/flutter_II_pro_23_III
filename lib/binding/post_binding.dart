import 'package:get/get.dart';
import 'package:pro_23/controller/post_controller.dart';
import 'package:pro_23/core/util/api_client.dart';
import 'package:pro_23/repository/post_repository.dart';
import 'package:pro_23/service/storage_service.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageService>(() => StorageService());

    Get.lazyPut<ApiClient>(() => ApiClient(Get.find<StorageService>()));

    Get.lazyPut<PostRepository>(() => PostRepository(Get.find<ApiClient>()));

    Get.lazyPut<PostController>(
      () => PostController(Get.find<PostRepository>()),
    );
  }
}
