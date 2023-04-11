// import 'package:dartz/dartz.dart';
// import 'package:the_scene/app/error/exceptions.dart';
// import 'package:the_scene/app/error/failure.dart';
// import 'package:the_scene/data/datasource/remote_datasource.dart';
// import 'package:the_scene/domain/entities/movie.dart';
// import 'package:the_scene/domain/entities/movie_details.dart';
// import 'package:the_scene/domain/entities/recommendation.dart';
// import 'package:the_scene/domain/repository/base_movie_repo.dart';
// import 'package:the_scene/domain/usecases/get_movie_details.dart';
// import 'package:the_scene/domain/usecases/get_recommendation.dart';

// class MovieRepositoryImpl extends BaseMovieRepository {
//   final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

//   MovieRepositoryImpl(this.baseMovieRemoteDataSource);
//   @override
//   Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
//     final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

//     try {
//       return Right(result);
//     } on ServerExceptions catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, List<Movie>>> getPopularMovies() async {
//     final result = await baseMovieRemoteDataSource.getPopularMovies();
//     try {
//       return Right(result);
//     } on ServerExceptions catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
//     final result = await baseMovieRemoteDataSource.getTopRatedMovies();
//     try {
//       return Right(result);
//     } on ServerExceptions catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, MovieDetails>> getMovieDetails(
//     MovieDetailsParameters parameters,
//   ) async {
//     final result = await baseMovieRemoteDataSource.getMovieDetails(
//       parameters,
//     );
//     try {
//       return Right(result);
//     } on ServerExceptions catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     }
//   }

//   @override
//   Future<Either<Failure, List<Recommendation>>> getRecommendation(
//     RecommendationParameters parameters,
//   ) async {
//     final result = await baseMovieRemoteDataSource.getRecommendation(
//       parameters,
//     );
//     try {
//       return Right(result);
//     } on ServerExceptions catch (failure) {
//       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//     }
//   }
// }
