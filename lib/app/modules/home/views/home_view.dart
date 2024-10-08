import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:passhoard/app/routes/app_pages.dart';
import 'package:passhoard/app/models/credential_group_model.dart';
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
              child: Obx(() {
                return Visibility(
                  visible: controller.credentialGroups.isNotEmpty,
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(const Duration(seconds: 1), () {
                        controller.getCredentialGroups();
                      });
                    },
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                      itemCount: controller.credentialGroups.length,
                      itemBuilder: (context, index) {
                        CredentialGroup cg = controller.credentialGroups[index];
                        return ListTile(
                          title: Text(cg.name),
                          subtitle: Text(cg.updatedAt.toIso8601String()),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {
                            Get.toNamed(
                              Routes.CREDENTIALS,
                              arguments: {'credentialGroup': cg},
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(Routes.CREDENTIALS_FORM);
          if (result) {
            controller.getCredentialGroups();
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
