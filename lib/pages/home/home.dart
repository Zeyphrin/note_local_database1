import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database_exmp/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF9792AE),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.createNote,
          backgroundColor: const Color(0xFFEBE5F4),
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBE5F4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          controller.notes[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        subtitle: Text(controller.notes[index].content),
                        trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              child: const Text("edit"),
                              onTap: () => controller.editNote(index),
                            ),
                            PopupMenuItem(
                              child: const Text("delete"),
                              onTap: () => controller
                                  .deleteNote(controller.notes[index].id!),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ));
  }
}
