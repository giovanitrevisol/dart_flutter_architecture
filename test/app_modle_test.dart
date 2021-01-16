import 'dart:convert';

import 'package:clean_architecture_flutter/modules/app_modular.dart';
import 'package:clean_architecture_flutter/modules/search/domain/entity/result_search.dart';
import 'package:clean_architecture_flutter/modules/search/domain/usercases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'modules/search/utils/github_response.dart';

class DioMoc extends Mock implements Dio {}

main() {
  final dio = DioMoc();
  initModule(
    AppModule(),
    changeBinds: [
      Bind<Dio>((i) => dio),
    ],
  );

  test('Deve recuperar o usecase em error', () {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve trazer uma lista de resultSearch', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));
    final usecase = Modular.get<SearchByText>();
    final result = await usecase('giovani');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
