import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:provider/provider.dart';

import '../../services/api_services.dart';
import '../../widgets/bot_nav_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
     // Provider.of<ApiController>(context,listen: false).nowPlaying = apiServices.nowPlayingMovies();
     // Provider.of<ApiController>(context,listen: false).upcoming = apiServices.getUpcomingMovies();
     // Provider.of<ApiController>(context,listen: false).tvSeries = apiServices.topRatedSeries();
    // Provider.of<ApiController>(context,listen: false).getTvSeries();
    // Provider.of<ApiController>(context,listen: false).getPopularMovie();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/logo/netflix.json"),
    );
  }
}
