import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/ui/pages/home_page.dart';
import 'package:pokedex/ui/widgets/pokemon_card.dart';

import 'core/theme/app_color.dart';
import 'ui/widgets/pokemon_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
