import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_input_model.dart';
import 'package:passhoard/app/utils/password_generator.dart';

class CredentialsBottomSheet extends StatelessWidget {
  final CredentialsInput ci;
  final VoidCallback onConfirm;

  const CredentialsBottomSheet({
    Key? key,
    required CredentialsInput credentialsInput,
    required this.onConfirm,
  })  : ci = credentialsInput,
        super(key: key);

  void _refreshPassword() {
    ci.passwordController.text = generatePassword();
  }

  void _obscurePassword() {
    ci.hidePassword = !ci.hidePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Get.theme.colorScheme.surface,
        ),
        color: Get.theme.colorScheme.background,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Username",
            ),
            style: Get.textTheme.displayMedium,
            controller: ci.usernameController,
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: Ink(
                child: IconButton(
                  icon: const Icon(
                    Icons.visibility_rounded,
                    size: 16,
                  ),
                  onPressed: _obscurePassword,
                ),
              ),
            ),
            style: Get.textTheme.displayMedium,
            controller: ci.passwordController,
          ),
          const SizedBox(height: 8),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.autorenew_rounded),
                    onPressed: _refreshPassword,
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
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: onConfirm,
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
