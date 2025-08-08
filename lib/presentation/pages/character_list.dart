import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_flutter_test/core/components/tokens/tokens.dart';
import 'package:rick_and_morty_flutter_test/presentation/cubits/character_list_cubit.dart';
import 'package:rick_and_morty_flutter_test/presentation/widgets/character_card.dart';
import 'package:rick_and_morty_flutter_test/presentation/widgets/error_message_widget.dart';
import 'package:rick_and_morty_flutter_test/routing/app_routes.dart';
import 'package:rick_and_morty_flutter_test/core/di/injection.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late final CharacterListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getDependency<CharacterListCubit>();
    load();
  }

  void load() {
    _cubit.loadCharacters();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListCubit, CharacterListState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Rick and Morty', style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: switch (state) {
            CharacterListLoading() => const Center(child: CircularProgressIndicator()),
            CharacterListLoaded() => GridView.builder(
              padding: EdgeInsets.all(Spacements.md),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, crossAxisSpacing: Spacements.xxs, mainAxisSpacing: Spacements.xxs),
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return CharacterCard(
                  onTap: () => GoRouter.of(context).push(AppRoutes.characterDetails, extra: character),
                  characterName: character.name,
                  imageUrl: character.image,
                );
              },
            ),
            CharacterListError() => ErrorMessageWidget(onTap: load),
            _ => const SizedBox.shrink(),
          },
        );
      },
    );
  }
}
