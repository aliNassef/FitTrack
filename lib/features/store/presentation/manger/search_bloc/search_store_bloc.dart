import 'package:bloc/bloc.dart';
import 'package:fit_track_app/features/store/data/model/product_model.dart';
import 'package:fit_track_app/features/store/data/repo/store_repo.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'search_store_event.dart';
part 'search_store_state.dart';

class SearchStoreBloc extends Bloc<SearchStoreEvent, SearchStoreState> {
  final StoreRepo repo;
  SearchStoreBloc(this.repo) : super(SearchStoreInitial()) {
    on<SearchStoreEvent>(
      (event, emit) async {
        if (event is OnSearchStoreEvent) {
          if(event.searchQuery.isEmpty){
            emit(SearchStoreInitial());
            return;
          }
          emit(SearchStoreLoading());
          final result = await repo.searchOnProducts(event.searchQuery);
          result.fold(
            (failure) => emit(SearchStoreError(errMessage: failure.errMessage)),
            (products) => emit(SearchStoreLoaded(products: products)),
          );
        }
      },
      transformer: (events, mapper) {
        return events
            .where((event) => event is OnSearchStoreEvent)
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
    );
  }
}
