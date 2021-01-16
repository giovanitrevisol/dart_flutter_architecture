import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter/modules/presenter/seaarch/states/state.dart';
import 'package:clean_architecture_flutter/modules/search/domain/usercases/search_by_text.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await usecase(searchText);
    yield result.fold((l) => SearchError(), (r) => SearchSuccess(r));
  }
}
