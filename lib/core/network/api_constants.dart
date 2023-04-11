class ApiConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "e23db7cdbb07aa3583489a895da9ef54";
  static const nowPlayingMoviesPath = "$baseUrl/movie/now_playing";
  static const popularMoviesPath = "$baseUrl/movie/popular";
  static const topRatedMoviesPath = "$baseUrl/movie/top_rated";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetailsPathWithId(int movieId) =>
      '$baseUrl/movie/$movieId';

  static String recommendationWithId(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations';
}
