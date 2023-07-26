import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passhoard/app/models/credential_model.dart';
// import 'package:passhoard/app/widgets/credentials_bottom_sheet.dart';

import '../controllers/credentials_controller.dart';

class CredentialsView extends GetView<CredentialsController> {
  const CredentialsView({Key? key}) : super(key: key);

  Widget _buildGroupNameTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          style: context.textTheme.displayMedium,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: "Group Name"),
          controller: controller.credentialGroupNameInput,
        ),
      ),
    );
  }

  Widget _buildCredentialsList() {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.credentials.length,
        itemBuilder: (context, index) {
          return _buildCredentials(
            controller.credentials[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      );
    });
  }

  Widget _buildCredentials(Credential credentials) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Get.theme.colorScheme.surface,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            credentials.updatedAt.toIso8601String(),
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    style: Get.textTheme.displayMedium,
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                    controller: credentials.identifierController(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.copy_all_rounded,
                  color: Get.theme.colorScheme.primary,
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
                  child: TextFormField(
                    style: Get.textTheme.displayMedium,
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
                    controller: credentials.passwordController(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.copy_all_rounded,
                  color: Get.theme.colorScheme.primary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_rounded,
                  color: Get.theme.colorScheme.error,
                ),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.qr_code_rounded),
                label: const Text('Generate QR'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddPasswordButton(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.add_rounded),
      label: const Text('Add Password'),
      onPressed: () {
        // Get.bottomSheet(
        //   _buildBottomSheet(),
        // );
      },
    );
  }

  // Widget _buildBottomSheet() {
  //   return CredentialsBottomSheet(
  //     credentialsInput: controller.newCredentials.value,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Name'),
        actions: [TextButton(onPressed: () {}, child: const Text('Save'))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildGroupNameTextField(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildCredentialsList(),
                const SizedBox(height: 8),
                _buildAddPasswordButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
