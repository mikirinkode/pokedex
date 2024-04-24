import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon/pokemon_detail_cubit.dart';
import 'package:pokedex/core/theme/app_theme.dart';
import 'package:pokedex/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonDetailCubit())
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
