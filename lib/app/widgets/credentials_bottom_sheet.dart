import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passhoard/app/models/credentials_model.dart';

class CredentialsBottomSheet extends StatelessWidget {
  final CredentialsModel credentials;
  final VoidCallback? onConfirm;

  const CredentialsBottomSheet({
    Key? key,
    required this.credentials,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            controller: credentials.usernameController,
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
            controller: credentials.passwordController,
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
