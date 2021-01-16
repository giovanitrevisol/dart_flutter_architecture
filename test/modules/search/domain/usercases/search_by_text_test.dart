import 'package:clean_architecture_flutter/modules/search/domain/entity/result_search.dart';
import 'package:clean_architecture_flutter/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_flutter/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture_flutter/modules/search/domain/usercases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);
  test('Deve returnar uma lista de ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase('Giovani');
    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Deve returnar uma exception cso o texto seja inválido', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
