import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredentialsBottomSheet extends StatelessWidget {
  const CredentialsBottomSheet({
    Key? key,
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
            style: context.textTheme.displayMedium,
            decoration: const InputDecoration(
              hintText: "Username",
            ),
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
                    onPressed: () {},
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
