import 'package:deep_select/second.dart';
import 'package:deep_select/sidebar.dart';
import 'package:deep_select/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class First extends ConsumerStatefulWidget {
  const First({super.key, required this.title});

  final String title;

  @override
  ConsumerState<First> createState() => _FirstState();
}

class _FirstState extends ConsumerState<First> {
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Todo> x = ref.watch(todosProvider);
    if (x.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    String? description = ref.watch(todosProvider).data!.description;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const Side(title: "s"),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              Text(description!, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
