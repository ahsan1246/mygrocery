import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'configs/config.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyGrocery()));
}

class MyGrocery extends StatelessWidget {
  const MyGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
