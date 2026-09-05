import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/post_controller.dart';

class PostFormScreen extends StatelessWidget {
  const PostFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                // Title
                TextFormField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter post title',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                // Content
                TextFormField(
                  controller: controller.contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    hintText: 'Enter post content',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                // Published
                Obx(
                  () => SwitchListTile(
                    title: const Text('Published'),
                    value: controller.published.value,
                    onChanged: controller.published.call,
                  ),
                ),

                const SizedBox(height: 24),

                // Create Button
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.isCreating.value
                          ? null
                          : controller.createPost,
                      child: controller.isCreating.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Create Post'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
