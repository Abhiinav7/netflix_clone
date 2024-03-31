import 'package:flutter/cupertino.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/model/recpomended_movie_model.dart';
import 'package:netflix/model/searchMovieModel.dart';

import '../model/tv_series_model.dart';
import '../services/api_services.dart';

class ApiController extends ChangeNotifier{
  final apiServices=ApiServices();
   MovieModel? upcomingMovies;
  getUpcomingMovies()async{
    upcomingMovies=await apiServices.getUpcomingMovies();
    notifyListeners();
  }

   TvSeriesModel? tvSeriesModel;
  getTvSeries()async{
    tvSeriesModel=await apiServices.topRatedSeries();
    print("provider calles tv series");
    notifyListeners();
  }
  SearchMovieModel? searchMovieModel;
void search(String query){
    apiServices.searchMovie(query).then((result){

      searchMovieModel=result;
      notifyListeners();
    });
}

  late Future<MovieModel> nowPlaying;
   late Future<MovieModel> upcoming;
  late Future<TvSeriesModel> tvSeries;
  late Future<RecomendedMovieModel> popularMovie;
  getPopularMovie(){
    popularMovie= apiServices.getpopularMovies();
    print("provider calles tv series");
    notifyListeners();
  }
}