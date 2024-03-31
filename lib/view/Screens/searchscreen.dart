import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/services/api_services.dart';
import 'package:provider/provider.dart';

import '../../widgets/popular_movie.dart';
import '../../widgets/search_movies.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      searchController.dispose();
      super.dispose();
    }

    return Consumer<ApiController>(
      builder: (context, controller, child) => Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CupertinoSearchTextField(
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: Colors.grey,
                ),
                style: TextStyle(color: Colors.white),
                controller: searchController,
                padding: EdgeInsets.all(15),
                suffixIcon: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    controller.search(searchController.text);
                  }
                },
              ),
              searchController.text.isEmpty?
              Popularmovie(future: apiServices.getpopularMovies(),headlineText: "Top Searches",)
                  :
              controller.searchMovieModel != null
                  ? SearchMovies()  : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
