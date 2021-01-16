import 'package:clean_architecture_flutter/modules/search/domain/entity/result_search.dart';
import 'package:clean_architecture_flutter/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture_flutter/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  //Either retorna uma erro ou a resposta esperada
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
