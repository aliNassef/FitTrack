part of 'search_store_bloc.dart';

@immutable
sealed class SearchStoreEvent {}

final class OnSearchStoreEvent extends SearchStoreEvent {
  final String searchQuery;
  OnSearchStoreEvent({required this.searchQuery});
}
