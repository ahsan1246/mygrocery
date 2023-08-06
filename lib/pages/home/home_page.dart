import 'package:flutter/material.dart';

import 'home_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          HomeCategories(),
        ],
      ),
    );
  }
}
