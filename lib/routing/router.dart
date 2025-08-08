import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_flutter_test/domain/entitiy/character.dart';
import 'package:rick_and_morty_flutter_test/routing/app_routes.dart';
import 'package:rick_and_morty_flutter_test/presentation/pages/character_details.dart';
import 'package:rick_and_morty_flutter_test/presentation/pages/character_list.dart';

RouterConfig<Object> buildRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(path: AppRoutes.home, builder: (context, state) => const CharacterList()),
      GoRoute(
        path: AppRoutes.characterDetails,
        builder: (context, state) {
          final character = state.extra as Character;
          return CharacterDetails(character: character);
        },
      ),
    ],
  );
}
