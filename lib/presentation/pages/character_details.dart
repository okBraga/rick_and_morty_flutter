import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter_test/core/components/tokens/tokens.dart';
import 'package:rick_and_morty_flutter_test/domain/entitiy/character.dart';
import 'package:rick_and_morty_flutter_test/domain/enum/character_status.dart';
import 'package:rick_and_morty_flutter_test/presentation/cubits/character_details_cubit.dart';
import 'package:rick_and_morty_flutter_test/core/di/injection.dart';
import 'package:rick_and_morty_flutter_test/presentation/widgets/error_message_widget.dart';

class CharacterDetails extends StatefulWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  late final CharacterDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getDependency<CharacterDetailsCubit>();
    load();
  }

  void load() {
    _cubit.loadCharacter(widget.character.id);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  String statusLabelFor(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.alive:
        return 'Vivo';
      case CharacterStatus.dead:
        return 'Morto';
      case CharacterStatus.unknown:
        return 'Desconhecido';
    }
  }

  Color statusColorFor(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.alive:
        return Colors.green;
      case CharacterStatus.dead:
        return Colors.red;
      case CharacterStatus.unknown:
        return Colors.grey;
    }
  }

  String speciesLabelFor(String species) {
    switch (species.toLowerCase()) {
      case 'human':
        return 'Humano';
      case 'alien':
        return 'Alienígena';
      default:
        return species;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.character.name, style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: switch (state) {
            CharacterDetailsLoading() => const Center(child: CircularProgressIndicator()),
            CharacterDetailsLoaded() => () {
              final character = state.character;
              final size = MediaQuery.of(context).size;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: Image.network(character.image, fit: BoxFit.cover),
                  ),
                  SizedBox(height: Spacements.xxs),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacements.md),
                    child: Text(
                      'Status: ${statusLabelFor(character.status)}',
                      style: TextStyle(fontSize: FontSizes.bodyLarge, fontWeight: FontWeight.w700, color: statusColorFor(character.status)),
                    ),
                  ),
                  SizedBox(height: Spacements.xxs),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacements.md),
                    child: Text(
                      'Espécie: ${speciesLabelFor(character.species)}',
                      style: TextStyle(fontSize: FontSizes.bodyLarge, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              );
            }(),
            CharacterDetailsError() => ErrorMessageWidget(onTap: load),
            _ => const SizedBox.shrink(),
          },
        );
      },
    );
  }
}
