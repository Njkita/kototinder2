part of 'cat_bloc.dart';

@immutable
abstract class CatEvent {}

class LoadRandomCatEvent extends CatEvent {}