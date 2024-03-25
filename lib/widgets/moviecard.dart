import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/upcoming_movie.dart';
import 'package:netflix/widgets/shimmerEffect.dart';

import '../common/utils.dart';
class MovieCardView extends StatelessWidget {
  MovieCardView({super.key,required this.future,  this.height=200,required this.headlineText,});
  final Future<MovieModel> future;
  final String headlineText;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FutureBuilder<MovieModel>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.results;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      height: 5,
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
                              Image.network(
                                fit: BoxFit.fitHeight,
                                  "$imageUrl${data[index].posterPath}"
                              ),

                              // CachedNetworkImage(
                              //   errorWidget: (context, url, error) => const CircularProgressIndicator(),
                              //   placeholder: (context, url) => const MyShimmer(
                              //       color: Colors.white,
                              //       width: 120,
                              //       height: 200),
                              //   fit: BoxFit.fill,
                              //   width: 120,
                              //   imageUrl: '$imageUrl${data[index]!.posterPath}',)
                          );
                        },
                      ),
                    ),
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
