import 'package:flutter/material.dart';
import 'package:pokedex/presentation/pages/home_page/widgets/sort_button.dart';
import 'package:pokedex/presentation/theme/app_elevation.dart';


import '../../../theme/app_color.dart';

class PokemonSearchBar extends StatelessWidget {
  final Function() onSortTapped;

  const PokemonSearchBar({required this.onSortTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.primary),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 16.0, left: 16, top: 0, bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    // color: AppColor.grayscaleWhite,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: AppElevation.innerShadow),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16,
                      child: Image.asset(
                        "assets/icons/search.png",
                        color: AppColor.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            // isDense: true,
                            isCollapsed: true,
                            hintText: "Search",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: AppColor.grayscaleMedium,
                                fontSize: 14)),
                        onChanged: (String value) {
                          // TODO: HANDLE ACTION
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SortButton(onSortTapped: onSortTapped)
          ],
        ),
      ),
    );
  }
}
