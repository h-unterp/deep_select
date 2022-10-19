import 'package:deep_select/sidebar.dart';
import 'package:deep_select/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class First extends ConsumerStatefulWidget {
  const First({super.key, required this.title});

  final String title;

  @override
  ConsumerState<First> createState() => _FirstState();
}

class _FirstState extends ConsumerState<First> {
  @override
  Widget build(BuildContext context) {
    String? description = ref.watch(todosProvider).value ?? "INIT";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              Text(description, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
