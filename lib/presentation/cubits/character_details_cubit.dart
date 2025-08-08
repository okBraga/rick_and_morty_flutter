import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_flutter_test/domain/entitiy/character.dart';
import 'package:rick_and_morty_flutter_test/domain/repository/character_repository.dart';

abstract class CharacterDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterDetailsInitial extends CharacterDetailsState {}

class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsLoaded extends CharacterDetailsState {
  final Character character;

  CharacterDetailsLoaded(this.character);

  @override
  List<Object?> get props => [character];
}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;

  CharacterDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

@injectable
class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  final CharacterRepository _repository;

  CharacterDetailsCubit(this._repository) : super(CharacterDetailsInitial());

  Future<void> loadCharacter(int id) async {
    emit(CharacterDetailsLoading());
    try {
      final character = await _repository.getCharacterById(id);
      emit(CharacterDetailsLoaded(character));
    } catch (e) {
      emit(CharacterDetailsError(e.toString()));
    }
  }
}
