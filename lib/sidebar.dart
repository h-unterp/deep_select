import 'package:deep_select/editUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Side extends ConsumerStatefulWidget {
  const Side({super.key, required this.title});

  final String title;

  @override
  ConsumerState<Side> createState() => _SideState();
}

class _SideState extends ConsumerState<Side> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
      child: TextButton(
        onPressed: () {
          pushNewScreen(context, screen: const EditUser(title: "s"));
        },
        child: const Text("Edit User"),
      ),
    ));
  }
}
