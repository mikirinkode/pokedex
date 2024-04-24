import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/network/api.dart';
import 'package:pokedex/data/pokemon_repository_impl.dart';
import 'package:pokedex/domain/usecase/pokemon_usecase.dart';
import 'package:pokedex/presentation/pages/detail_page/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/presentation/theme/app_theme.dart';

import 'presentation/pages/home_page/view/home_page.dart';

void main() {
  final api = ApiImpl();
  final repository = PokemonRepositoryImpl(api: api);
  final useCase = PokemonUseCase(repository: repository);

  runApp(PokemonApp(
    useCase: useCase,
  ));
}

class PokemonApp extends StatelessWidget {
  final PokemonUseCase useCase;

  const PokemonApp({required this.useCase, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: useCase,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                PokemonDetailCubit(useCase: context.read<PokemonUseCase>()))
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
