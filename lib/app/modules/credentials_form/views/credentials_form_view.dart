import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:passhoard/app/modules/credentials_form/models/credential_model.dart';

import '../controllers/credentials_form_controller.dart';

class CredentialsFormView extends GetView<CredentialsFormController> {
  const CredentialsFormView({Key? key}) : super(key: key);

  Widget _buildGroupNameTextField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Group Name",
        ),
      ),
    );
  }

  Widget _buildPasswordList() {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.credentials.length,
        itemBuilder: (context, index) {
          CredentialModel credential = controller.credentials[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: context.theme.colorScheme.surface,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  controller: credential.usernameController,
                ),
                const SizedBox(height: 8),
                TextFormField(
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
                  controller: credential.passwordController,
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: context.theme.colorScheme.error,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      );
    });
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Obx(() {
      CredentialModel newCredential = controller.newCredential.value;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.theme.colorScheme.surface,
          ),
          color: context.theme.colorScheme.background,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Username",
              ),
              controller: newCredential.usernameController,
            ),
            const SizedBox(height: 8),
            TextFormField(
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
              controller: newCredential.passwordController,
            ),
            const SizedBox(height: 8),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.autorenew_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      child: const Text('Confirm'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
        actions: [TextButton(onPressed: () {}, child: const Text('Save'))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGroupNameTextField(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildPasswordList(),
                const SizedBox(height: 8),
                TextButton.icon(
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add Password'),
                  onPressed: () {
                    Get.bottomSheet(
                      _buildBottomSheet(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
