import 'package:deep_select/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Second extends ConsumerStatefulWidget {
  const Second({super.key, required this.title});

  final String title;

  @override
  ConsumerState<Second> createState() => _SecondState();
}

class _SecondState extends ConsumerState<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          "Second Page?",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todosProvider.notifier).toggle();
        },
        child: const Text("update"),
      ),
    );
  }
}
