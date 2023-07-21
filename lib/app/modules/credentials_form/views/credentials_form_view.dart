import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/widgets/credentials_bottom_sheet.dart';

import '../controllers/credentials_form_controller.dart';

class CredentialsFormView extends GetView<CredentialsFormController> {
  const CredentialsFormView({Key? key}) : super(key: key);

  Widget _buildGroupNameTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Enter Group Name",
        ),
        style: context.textTheme.displayMedium,
        textAlign: TextAlign.center,
        controller: controller.groupNameInput,
      ),
    );
  }

  Widget _buildCredentialsList() {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.credentialsInput.length,
        itemBuilder: (context, index) {
          CredentialsInput ci = controller.credentialsInput[index];
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
                  style: context.textTheme.displayMedium,
                  controller: ci.usernameController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: ci.hidePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(
                          Icons.visibility_rounded,
                          size: 16,
                        ),
                        onPressed: () {
                          controller.obscurePassword(ci);
                        },
                      ),
                    ),
                  ),
                  style: context.textTheme.displayMedium,
                  controller: ci.passwordController,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Get.theme.colorScheme.error,
                      ),
                      onPressed: () {
                        controller.removeCredentials(index);
                      },
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.autorenew_rounded),
                      label: const Text('Generate Password'),
                      onPressed: () {
                        controller.refreshPassword(ci);
                      },
                    ),
                  ],
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

  Widget _buildBottomSheet() {
    return Obx(() {
      return CredentialsBottomSheet(
        credentialsInput: controller.newCredentials.value,
        onConfirm: controller.onBottomSheetConfirm,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: controller.submitCredentials,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(result: false);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGroupNameTextField(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
              children: [
                _buildCredentialsList(),
                const SizedBox(height: 8),
                TextButton.icon(
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add Password'),
                  onPressed: () {
                    Get.bottomSheet(_buildBottomSheet());
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
