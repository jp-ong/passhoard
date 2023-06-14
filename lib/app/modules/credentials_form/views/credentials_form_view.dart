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
        style: context.textTheme.displayMedium,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: "Group Name",
        ),
        controller: controller.credentialsGroupName,
        onChanged: (value) => controller.validateCredentials(),
      ),
    );
  }

  Widget _buildCredentialsList() {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.credentialsInputList.length,
        itemBuilder: (context, index) {
          CredentialsInputModel credential =
              controller.credentialsInputList[index];
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
                  style: context.textTheme.displayMedium,
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  controller: credential.usernameController,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  style: context.textTheme.displayMedium,
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
                  onChanged: (value) => controller.validateCredentials(),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: context.theme.colorScheme.error,
                    ),
                  ),
                  onPressed: () {
                    controller.removeCredentialsItem(index);
                  },
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
      CredentialsInputModel newCredentials =
          controller.newCredentialsInput.value;
      return CredentialsBottomSheet(
        credentials: newCredentials,
        onConfirm: controller.onAddPasswordConfirm,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Password'),
        actions: [
          Obx(() {
            bool isCredentialsValid = controller.isCredentialsValid.isTrue;
            return IconButton(
              onPressed:
                  isCredentialsValid ? controller.onCredentialsConfirm : null,
              icon: const Icon(Icons.check_rounded),
            );
          })
        ],
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
