import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_23/model/post_daa_model.dart';

import '../../controller/post_controller.dart';

class PostListScreenScreen extends StatelessWidget {
  const PostListScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),

      body: Obx(() {
        // Loading
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Error
        if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // Empty
        if (controller.posts.isEmpty) {
          return const Center(child: Text('No posts found'));
        }

        // List
        // return ListView.builder(
        //   itemCount: controller.posts.length,
        //   itemBuilder: (context, index) {
        //     final Data post = controller.posts[index];
        //
        //     return ListTile(
        //       title: Text(post.title ?? ''),
        //       subtitle: Text(post.content ?? ''),
        //       leading: CircleAvatar(
        //         child: Text(
        //           '${post.id ?? ''}',
        //         ),
        //       ),
        //     );
        //   },
        // );
        print('Building ListView');
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount:
              controller.posts.length +
              (controller.isLoadingMore.value ? 1 : 0),
          itemBuilder: (context, index) {
            print('BUILD ITEM: $index');

            if (index == controller.posts.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final Data post = controller.posts[index];

            return ListTile(
              leading: CircleAvatar(child: Text('${post.id ?? ''}')),
              title: Text(post.title ?? ''),
              subtitle: Text(post.content ?? ''),
            );
          },
        );
        return ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Test Item $index'));
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/posts-create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
