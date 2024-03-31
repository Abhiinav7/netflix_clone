import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/carousal_slider.dart';
import 'package:provider/provider.dart';
import '../../common/utils.dart';
import '../../controller/api_controller.dart';
import '../../model/movie_model.dart';
import '../../model/tv_series_model.dart';

import '../../widgets/moviecard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Consumer<ApiController>(
      builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: blk,
            title: Image.asset(
              "assets/logo/netflixname.png",
              height: 35,
              width: 120,
              fit: BoxFit.contain,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                    iconSize: 30,
                    color: wht,
                    onPressed: () {},
                    icon: Icon(Icons.search_sharp)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    color: Colors.blue,
                    height: 27,
                    width: 27,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: apiServices.topRatedSeries(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomCarousal(seriesModel: snapshot.data!);
                    } else {
                      return SizedBox();
                    }
                  },
                ),

                MovieCardView(
                  future: apiServices.nowPlayingMovies(),
                  headlineText: 'Now Playing',
                ),
                SizedBox(
                  height: 7,
                ),
                MovieCardView(
                  future: apiServices.getUpcomingMovies(),
                  headlineText: 'Upcoming Movies',
                ),


              ],
            ),
          )),
    );
  }
}

