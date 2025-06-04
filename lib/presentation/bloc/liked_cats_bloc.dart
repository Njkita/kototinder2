import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/cat_model.dart';

part 'liked_cats_event.dart';
part 'liked_cats_state.dart';

class LikedCatsBloc extends Bloc<LikedCatsEvent, LikedCatsState> {
  final List<Cat> _likedCats = [];
  String? _filterBreed;

  LikedCatsBloc() : super(LikedCatsInitial()) {
    on<AddLikedCatEvent>(_onAddLikedCat);
    on<RemoveLikedCatEvent>(_onRemoveLikedCat);
    on<FilterLikedCatsEvent>(_onFilterLikedCats);
  }

  void _onAddLikedCat(AddLikedCatEvent event, Emitter<LikedCatsState> emit) {
    final DateTime likedTime = DateTime.now().toUtc().add(const Duration(hours: 3));
    final updatedCat = event.cat.copyWith(likedAt: likedTime);

    _likedCats.removeWhere((cat) => cat.id == updatedCat.id);
    _likedCats.insert(0, updatedCat);

    emit(LikedCatsUpdated(List.from(_likedCats), _filterBreed));
  }

  void _onRemoveLikedCat(RemoveLikedCatEvent event, Emitter<LikedCatsState> emit) {
    _likedCats.removeWhere((cat) => cat.id == event.catId);
    emit(LikedCatsUpdated(List.from(_likedCats), _filterBreed));
  }

  void _onFilterLikedCats(FilterLikedCatsEvent event, Emitter<LikedCatsState> emit) {
    _filterBreed = event.breed;
    emit(LikedCatsUpdated(List.from(_likedCats), _filterBreed));
  }
}