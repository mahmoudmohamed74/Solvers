// import 'package:get_it/get_it.dart';
// import 'package:the_scene/data/datasource/remote_datasource.dart';
// import 'package:the_scene/data/repository/movie_repo_impl.dart';
// import 'package:the_scene/domain/repository/base_movie_repo.dart';
// import 'package:the_scene/domain/usecases/get_movie_details.dart';
// import 'package:the_scene/domain/usecases/get_now_playing_movies.dart';
// import 'package:the_scene/domain/usecases/get_popular_movies.dart';
// import 'package:the_scene/domain/usecases/get_recommendation.dart';
// import 'package:the_scene/domain/usecases/get_top_rated_movies.dart';
// import 'package:the_scene/presentation/controller/movie_bloc/movies_bloc.dart';
// import 'package:the_scene/presentation/controller/movie_details_bloc/movie_details_bloc.dart';

// final sl = GetIt.instance;

// class ServicesLocator {
//   void init() {
//     // 1 Data Sources (route)
//     sl.registerLazySingleton<BaseMovieRemoteDataSource>(
//       () => MovieRemoteDataSourceImpl(),
//     );

//     // 2 Repository

//     sl.registerLazySingleton<BaseMovieRepository>(
//       () => MovieRepositoryImpl(sl()),
//     );

//     // 3 Use cases
//     // 2 Use cases
//     sl.registerLazySingleton(
//       () => GetNowPlayingMoviesUseCase(sl()),
//     );

//     sl.registerLazySingleton(
//       () => GetPopularMoviesUseCase(sl()),
//     );

//     sl.registerLazySingleton(
//       () => GetTopRatedMoviesUseCase(sl()),
//     );

//     sl.registerLazySingleton(
//       () => GetMovieDetailsUseCase(sl()),
//     );

//     sl.registerLazySingleton(
//       () => GetRecommendationUseCase(sl()),
//     );

//     sl.registerFactory(() => MoviesBloc(
//           sl(),
//           sl(),
//           sl(),
//         ));
//     sl.registerFactory(() => MovieDetailsBloc(
//           sl(),
//           sl(),
//         ));
//   }
// }
