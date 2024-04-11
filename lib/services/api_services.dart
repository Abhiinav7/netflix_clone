 import 'package:netflix/model/movie_detail_model.dart';
import 'package:netflix/model/movie_recomendationModel.dart';
import 'package:netflix/model/recpomended_movie_model.dart';
import 'package:netflix/model/review_movie_model.dart';
import 'package:netflix/model/searchMovieModel.dart';
import 'package:netflix/model/trendingModel.dart';

import '../common/utils.dart';
import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

import '../model/tv_series_model.dart';
const baseurl = "https://api.themoviedb.org/3/";
late String endpoint;
const key = "?api_key=$apikey";

class ApiServices {
   Future<MovieModel> getUpcomingMovies()async {
    endpoint="movie/upcoming";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print("loaded upcoming movies");
      return movieModelFromJson(response.body);
    }
    throw Exception("failed to load upcoming movies");

  }
   Future<MovieModel> nowPlayingMovies()async {
    endpoint="movie/now_playing";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print("now playing works ");
      return movieModelFromJson(response.body);
    }
    throw Exception("failed to load now playing movies");
  }
  Future<TrendingModel> trendingIn()async {
    endpoint="trending/all/day";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print("trending works ");
      return trendingModelFromJson(response.body);
    }
    throw Exception("failed to load trending");
  }
  Future<ReviewMovieModel> reviewMovies()async {
    endpoint="trending/all/day";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print("review of movie works ");
      return reviewMovieModelFromJson(response.body);
    }
    throw Exception("failed to load review");
  }
  Future<TvSeriesModel> topRatedSeries()async {
    endpoint="tv/top_rated";
    final url="$baseurl$endpoint$key";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print("succes loaded tv series");
      return tvSeriesModelFromJson(response.body);
    }
    throw Exception("failed to load top rated tv series ");
  }
  Future<SearchMovieModel> searchMovie(String movieName)async {
    endpoint="search/movie?query=$movieName";
    final url="$baseurl$endpoint";
    print("url :$url");
    final response=await http.get(Uri.parse(url),headers: {
      "Authorization":apitoken
    });
    if(response.statusCode==200){
      print("movie found");
      return searchMovieModelFromJson(response.body);
    }
    throw Exception("failed to load  searched movie ");
  }

   Future<RecomendedMovieModel> getpopularMovies()async {
     endpoint="movie/popular";
     final url="$baseurl$endpoint$key";
     final response=await http.get(Uri.parse(url));
     if(response.statusCode==200){
       print("succes popular movies");
       return recomendedMovieModelFromJson(response.body);
     }
     throw Exception("failed to load popular movies ");
   }
   Future<MovieDetailModel> getMovieDetails(int id)async {
     endpoint="movie/$id";
     final url="$baseurl$endpoint$key";
     print(url);
     final response=await http.get(Uri.parse(url));
     if(response.statusCode==200){
       print(url);
       print("successfully loaded movie details");
       return movieDetailModelFromJson(response.body);
     }
     throw Exception("failed to movie details  ");
   }
   Future<MovieRecommendationModel> getMovieRecommendations(int id)async {
     endpoint="movie/$id/recommendations";
     final url="$baseurl$endpoint$key";
     print("more like this url:$url");
     final response=await http.get(Uri.parse(url));
     if(response.statusCode==200){
       print(url);
       print("successfully loaded more like this ");
       return movieRecommendationModelFromJson(response.body);
     }
     throw Exception("failed to more like this movies");
   }
}