import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Todo {
  const Todo(
      {required this.id, required this.description, required this.completed});

  final String? id;
  final String? description;
  final bool completed;

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

class TodosNotifier extends StateNotifier<AsyncSnapshot<Todo>> {
  TodosNotifier()
      : super(const AsyncSnapshot.withData(ConnectionState.done,
            Todo(id: "1", description: "initial", completed: false)));

  void toggle() async {
    state = AsyncSnapshot.withData(ConnectionState.waiting, state.data!);
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncSnapshot.withData(
        ConnectionState.done, state.data!.copyWith(description: "changed"));
  }
}

final todosProvider =
    StateNotifierProvider<TodosNotifier, AsyncSnapshot<Todo>>((ref) {
  return TodosNotifier();
});
