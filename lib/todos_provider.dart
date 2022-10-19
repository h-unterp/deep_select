import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosNotifier extends StateNotifier<AsyncValue<String>> {
  TodosNotifier() : super(const AsyncLoading());

  void toggle() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = const AsyncData("DONE");
  }
}

final todosProvider =
    StateNotifierProvider<TodosNotifier, AsyncValue<String>>((ref) {
  return TodosNotifier();
});
