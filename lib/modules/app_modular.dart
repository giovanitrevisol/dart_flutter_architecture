import 'package:clean_architecture_flutter/modules/app_widget.dart';
import 'package:clean_architecture_flutter/modules/presenter/seaarch/search_bloc.dart';
import 'package:clean_architecture_flutter/modules/search/domain/usercases/search_by_text.dart';
import 'package:clean_architecture_flutter/modules/search/external/datasource/github_datasource.dart';
import 'package:clean_architecture_flutter/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => GithubDtasource(i())),
        Bind((i) => SearchBloc(i()))
      ];

  @override
  List<ModularRouter> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();
}
