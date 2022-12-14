import 'package:deep_select/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditUser extends ConsumerStatefulWidget {
  const EditUser({super.key});

  @override
  ConsumerState<EditUser> createState() => _EditUserState();
}

class _EditUserState extends ConsumerState<EditUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("edit"),
      ),
      body: const Center(
        child: Text(
          "EditUser Page?",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(authProvider.notifier).toggle();
        },
        child: const Text("update"),
      ),
    );
  }
}
