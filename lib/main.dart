import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'di.dart';
import 'presentation/bloc/cat_bloc.dart';
import 'presentation/bloc/liked_cats_bloc.dart';
import 'domain/repositories/cat_repository.dart';

void main() {
  setupDependencies();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatBloc(CatRepository())..add(LoadRandomCatEvent()),
        ),
        BlocProvider(
          create: (context) => LikedCatsBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}