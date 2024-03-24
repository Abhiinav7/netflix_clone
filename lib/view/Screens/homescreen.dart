import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/services/api_services.dart';
import 'package:provider/provider.dart';
import '../../common/utils.dart';
import '../../controller/api_controller.dart';
import '../../model/upcoming_movie.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/shimmerEffect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                MovieCard(future: controller.getUpcomingMovies(), heading: 'Upcoming Movies',)
              ],
            ),
          )),
    );
  }
}
