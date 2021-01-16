import 'package:clean_architecture_flutter/modules/search/domain/entity/result_search.dart';
import 'package:clean_architecture_flutter/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_flutter/modules/search/infra/datasources/search_datasource.dart';
import 'package:clean_architecture_flutter/modules/search/infra/models/result_search_model.dart';
import 'package:clean_architecture_flutter/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final respository = SearchRepositoryImpl(datasource);

  test('Deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await respository.search('Giovani');

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve retornar um erro se o datasouce falhar ', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await respository.search('Giovani');

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
