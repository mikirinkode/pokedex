

import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: AppColor.grayscaleWhite,
                    borderRadius: BorderRadius.circular(8)),
                child:
                GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 1),
                  itemBuilder: (_, index) => PokemonCard(),
                  itemCount: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}