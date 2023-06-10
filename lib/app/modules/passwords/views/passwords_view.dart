import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/passwords_controller.dart';

class PasswordsView extends GetView<PasswordsController> {
  const PasswordsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Name'),
        actions: [TextButton(onPressed: () {}, child: const Text('Save'))],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 40,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Group Name",
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: context.theme.colorScheme.surface,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateTime.now().toIso8601String(),
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Username",
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.copy_all_rounded,
                              color: context.theme.colorScheme.primary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.visibility_rounded,
                                      size: 16,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.copy_all_rounded,
                              color: context.theme.colorScheme.primary,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: Icon(
                                Icons.delete_rounded,
                                color: context.theme.colorScheme.error,
                              ),
                              label: Text(
                                'Delete',
                                style: TextStyle(
                                  color: context.theme.colorScheme.error,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.qr_code_rounded),
                              label: const Text('Generate QR'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_rounded),
              label: const Text('Add Password'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
