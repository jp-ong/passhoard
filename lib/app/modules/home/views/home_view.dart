import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passhoard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.lock_rounded),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 40,
              child: TextField(
                style: context.textTheme.displayMedium,
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search_rounded, size: 16),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text("Group Name"),
                    subtitle: Text(DateTime.now().toIso8601String()),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () => Get.toNamed(Routes.CREDENTIALS),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CREDENTIALS_FORM);
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
