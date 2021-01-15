import 'package:clean_architecture_flutter/modules/search/domain/entity/result_search.dart';
import 'package:clean_architecture_flutter/modules/search/domain/usercases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final usecase = SearchByTextImpl();
  test('Deve returnar uma lista de ResultSearch', () async {
    final result = await usecase('Giovani');
    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });
}
