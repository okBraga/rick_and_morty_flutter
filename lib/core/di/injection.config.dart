// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty_flutter_test/core/di/injection.dart' as _i246;
import 'package:rick_and_morty_flutter_test/core/network/http_client.dart'
    as _i45;
import 'package:rick_and_morty_flutter_test/domain/repository/character_repository.dart'
    as _i562;
import 'package:rick_and_morty_flutter_test/presentation/cubits/character_details_cubit.dart'
    as _i378;
import 'package:rick_and_morty_flutter_test/presentation/cubits/character_list_cubit.dart'
    as _i868;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i45.HttpClient>(() => _i45.DioAdapter(gh<_i361.Dio>()));
    gh.singleton<_i562.CharacterRepository>(
      () => _i562.CharacterRepositoryImpl(gh<_i45.HttpClient>()),
    );
    gh.factory<_i378.CharacterDetailsCubit>(
      () => _i378.CharacterDetailsCubit(gh<_i562.CharacterRepository>()),
    );
    gh.factory<_i868.CharacterListCubit>(
      () => _i868.CharacterListCubit(gh<_i562.CharacterRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i246.RegisterModule {}
