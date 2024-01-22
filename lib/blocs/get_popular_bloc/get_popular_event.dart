part of 'get_popular_bloc.dart';

abstract class GetPopularEvent extends Equatable {
  const GetPopularEvent();

  @override
  List<Object> get props => [];
}

class GetPopular extends GetPopularEvent {}

class SearchPopular extends GetPopularEvent {
  final String query;

  const SearchPopular({required this.query});
}
