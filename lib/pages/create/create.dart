import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database_exmp/pages/create/controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9792AE),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                  labelText: "title",
                  filled: true,
                  fillColor: const Color(0xFFEBE5F4),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                  labelText: "content",
                  filled: true,
                  fillColor: const Color(0xFFEBE5F4),
                  border: OutlineInputBorder()),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: controller.onSubmit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('submit'),
            )
          ],
        ),
      ),
    );
  }
}
