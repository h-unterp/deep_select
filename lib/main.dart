import 'package:badges/badges.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deep_select/first.dart';
import 'package:deep_select/auth_provider.dart';
import 'package:deep_select/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).init();
    });
  }

  int selectedpage = 0;
  final _pageNo = [
    const First(
      title: 'asd',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ref.watch(authProvider).when(
      data: (data) {
        return Scaffold(
          body: _pageNo[selectedpage],
          bottomNavigationBar: ConvexAppBar(
            items: const [
              TabItem(icon: Icons.home, title: 'First'),
            ],
            initialActiveIndex: selectedpage,
            onTap: (int index) {
              setState(() {
                selectedpage = index;
              });
            },
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("error"),
        );
      },
    );
  }
}
