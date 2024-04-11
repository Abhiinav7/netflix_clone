import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/model/trendingModel.dart';
import 'package:netflix/view/Screens/movie_detail_screen.dart';
import 'package:netflix/widgets/shimmerEffect.dart';
import '../common/utils.dart';
class MovieCard extends StatelessWidget {
  MovieCard({super.key,required this.future,  this.height=215,required this.headlineText,});
  Future<TrendingModel> future;
  String headlineText;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FutureBuilder<TrendingModel>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.results;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        headlineText ,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child:
                            InkWell(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(movieid: data[index].id),));},
                              child: Image.network(
                                  fit: BoxFit.fitHeight,
                                  "$imageUrl${data[index].posterPath}"
                              ),
                            ),

                            // CachedNetworkImage(
                            //   errorWidget: (context, url, error) => const CircularProgressIndicator(),
                            //   placeholder: (context, url) => const MyShimmer(
                            //       color: Colors.white,
                            //       width: 120,
                            //       height: 200),
                            //   fit: BoxFit.fill,
                            //   width: 120,
                            //   imageUrl: '$imageUrl${data[index].posterPath}',)
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              );

            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
