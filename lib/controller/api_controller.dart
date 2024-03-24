import 'package:flutter/cupertino.dart';
import 'package:netflix/model/upcoming_movie.dart';

import '../services/api_services.dart';

class ApiController extends ChangeNotifier{
  // final apiServices=ApiServices();
  UpcomingMovieModel? upcomingMovies;
  getUpcomingMovies()async{
    upcomingMovies=await ApiServices.getUpcomingMovies();
    notifyListeners();
  }
}