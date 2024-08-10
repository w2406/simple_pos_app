import 'package:flutter/material.dart';

import '../../category_addition/view/category_addition_screen.dart';
import '../../product_list/view/product_list_screen.dart';
import '../../settings/view/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '一覧',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '部門追加',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '設定',
            ),
          ],
          onTap: (value) => setState(() => currentIndex = value),
        ),
        body: switch (currentIndex) {
          0 => const ProductListScreen(),
          1 => const CategoryAdditionScreen(),
          2 => const SettingsScreen(),
          _ => const Center(
              child: Text('エラーです'),
            )
        });
  }
}
