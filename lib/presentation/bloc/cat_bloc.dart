import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../data/models/cat_model.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository catRepository;

  CatBloc(this.catRepository) : super(CatInitial()) {
    on<LoadRandomCatEvent>(_onLoadRandomCat);
  }

  Future<void> _onLoadRandomCat(
    LoadRandomCatEvent event,
    Emitter<CatState> emit,
  ) async {
    emit(CatLoading());
    try {
      final cat = await catRepository.fetchRandomCat();
      emit(CatLoaded(cat));
    } catch (e) {
      emit(CatError(e.toString()));
    }
  }
}