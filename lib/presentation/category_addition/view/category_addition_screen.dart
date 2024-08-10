import 'package:flutter/material.dart';

class CategoryAdditionScreen extends StatefulWidget {
  const CategoryAdditionScreen({super.key});

  @override
  createState() => _CategoryAdditionScreenState();
}

class _CategoryAdditionScreenState extends State<CategoryAdditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('部門追加'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('シンプルPOS'),
          ],
        ),
      ),
    );
  }
}
