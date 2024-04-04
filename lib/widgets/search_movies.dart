import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/view/Screens/movie_detail_screen.dart';
import 'package:provider/provider.dart';

import '../common/utils.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ApiController>(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.searchMovieModel?.results.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.53,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movieid: controller.searchMovieModel!.results[index].id),));},
          child: Column(
            children: [
              controller.searchMovieModel!.results[index].backdropPath == null
                  ? Image.asset(
                      "assets/logo/netflixlogo.png",
                      fit: BoxFit.fill,
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          "${imageUrl}${controller.searchMovieModel!.results[index].posterPath}",
                      height: 180,
                filterQuality: FilterQuality.high,
                    ),
              SizedBox(height: 5,),
              controller.searchMovieModel!.results[index].title == null
                  ? Text("")
                  : Text(
                      controller.searchMovieModel!.results[index].title,
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
            ],
          ),
        );
      },
    );
  }
}
