import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/token_manager.dart';

class AppConstants {
  // static final baseUrl = '${dotenv.env['BASE_URL']}'; //* https://api.themoviedb.org/3
  // static final apiToken = '${dotenv.env['API_TOKEN']}'; //* your TMDB token

  static const baseUrl = 'https://union.staging.navi.kg/';
  // static const apiToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzUyOTk5MjUsInN1YiI6IjEzIiwiZGV2IjoiQTQ3OTcyRDEtMzZCMi00RTJELTg2N0YtMENDMTE5NjhCNzc5In0.nlOYPlSRQqTeYEn2xgqq7U3jgZkXqGAVdhvxtIGAOSM';
  // static const apiToken = SharedPreferencesManager().getToken();

}
