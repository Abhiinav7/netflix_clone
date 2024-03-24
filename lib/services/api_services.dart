import 'dart:convert';
import '../common/utils.dart';
import '../model/upcoming_movie.dart';
import 'package:http/http.dart' as http;
const baseurl = "https://api.themoviedb.org/3/";
late String endpoint;
const key = "?api_key=$apikey";

class ApiServices {
  static Future<UpcomingMovieModel> getUpcomingMovies()async {
    endpoint="movie/upcoming";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      // print(response.body);
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("failed to load upcoming movies");

  }
}