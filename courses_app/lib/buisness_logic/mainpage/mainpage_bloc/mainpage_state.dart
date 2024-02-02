part of 'mainpage_bloc.dart';

class MainpageState extends Equatable {
  final int index;
  const MainpageState({required this.index});

  @override
  List<Object> get props => [index];
}
