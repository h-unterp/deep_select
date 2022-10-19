import 'package:badges/badges.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:deep_select/editUser.dart';
import 'package:deep_select/first.dart';
import 'package:deep_select/auth_provider.dart';
import 'package:deep_select/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navbar_router/navbar_router.dart';
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

  List<NavbarItem> items = [
    NavbarItem(Icons.home, 'Home', backgroundColor: colors[0]),
    NavbarItem(Icons.home, 'Home2', backgroundColor: colors[0]),
  ];

  final Map<int, Map<String, Widget>> _routes = {
    0: {'/': const First(), '/second': const EditUser()},
    1: {'/': const First()},
  };
  @override
  Widget build(BuildContext context) {
    return ref.watch(authProvider).when(
      data: (data) {
        return NavbarRouter(
          errorBuilder: (context) {
            return const Center(child: Text('Error 404'));
          },
          onBackButtonPressed: (isExiting) {
            return isExiting;
          },
          destinationAnimationCurve: Curves.fastOutSlowIn,
          destinationAnimationDuration: 600,
          decoration:
              NavbarDecoration(navbarType: BottomNavigationBarType.shifting),
          destinations: [
            for (int i = 0; i < items.length; i++)
              DestinationRouter(
                navbarItem: items[i],
                destinations: [
                  for (int j = 0; j < _routes[i]!.keys.length; j++)
                    Destination(
                      route: _routes[i]!.keys.elementAt(j),
                      widget: _routes[i]!.values.elementAt(j),
                    ),
                ],
                initialRoute: _routes[i]!.keys.first,
              ),
          ],
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
