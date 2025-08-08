import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_flutter_test/domain/entitiy/character.dart';
import 'package:rick_and_morty_flutter_test/domain/repository/character_repository.dart';

abstract class CharacterListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterListInitial extends CharacterListState {}

class CharacterListLoading extends CharacterListState {}

class CharacterListLoaded extends CharacterListState {
  final List<Character> characters;

  CharacterListLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharacterListError extends CharacterListState {
  final String message;

  CharacterListError(this.message);

  @override
  List<Object?> get props => [message];
}

@injectable
class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterRepository _repository;

  CharacterListCubit(this._repository) : super(CharacterListInitial());

  Future<void> loadCharacters() async {
    emit(CharacterListLoading());
    try {
      final characters = await _repository.getCharacters();
      emit(CharacterListLoaded(characters));
    } catch (e) {
      emit(CharacterListError(e.toString()));
    }
  }
}
