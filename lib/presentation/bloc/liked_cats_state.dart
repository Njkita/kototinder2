part of 'liked_cats_bloc.dart';

@immutable
abstract class LikedCatsState {}

class LikedCatsInitial extends LikedCatsState {}

class LikedCatsUpdated extends LikedCatsState {
  final List<Cat> cats;
  final String? filterBreed;
  
  LikedCatsUpdated(this.cats, this.filterBreed);
  
  List<Cat> get filteredCats {
    if (filterBreed == null) return cats;
    return cats.where((cat) => cat.breedName == filterBreed).toList();
  }
}