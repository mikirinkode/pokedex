import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/core/theme/app_typography.dart';
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 16,
          height: 16,
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            width: 16,
            height: 16,
            "assets/icons/pokeball.png",
            color: AppColor.grayscaleWhite,
          ),
        ),
        title: Text(
          "Pokédex",
        ),
      ),
      body: Column(
        children: [
          PokemonSearchBar(
            onSortTapped: () {},
          ),
          PokemonCard()
        ],
      ),
    );
  }
}
