class UrlConstants {
  //* Movie
  static const popularMovies = '/movie/popular';
  static const topRatedMovies = '/movie/top_rated';
  static const movieCredits = '/movie/{movie_id}/credits';

  //* Actor
  static const actorDetail = '/person/{person_id}';
  static const actorSocialMedia = '/person/{person_id}/external_ids';
  static const news = 'api/v1/riders/news/?limit=18&skip=0';
  static const newsDetail = 'api/v1/riders/news/{news_id}/';
  static const loginSendCode = 'api/v1/auth/send_code/';
  static const verifyCode = 'api/v1/auth/riders/verify-code/';
}
