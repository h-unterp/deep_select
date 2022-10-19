import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AsyncValue<String>> {
  AuthNotifier() : super(const AsyncValue.data("START"));

  void init() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = const AsyncData("INIT DONE");
  }

  void toggle() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = const AsyncData("DONE DONE");
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<String>>((ref) {
  return AuthNotifier();
});
