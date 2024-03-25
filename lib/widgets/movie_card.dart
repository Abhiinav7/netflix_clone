import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_controller.dart';
import 'package:netflix/widgets/shimmerEffect.dart';
import 'package:provider/provider.dart';

import '../common/utils.dart';
class MovieCard extends StatelessWidget {
   MovieCard({super.key,required this.future,  this.height=200,required this.heading});
   Future<Object?>? future;
    double? height;
   String heading;
  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<ApiController>(context);
    return SizedBox(
      height: height,
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return controller.upcomingMovies != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                       heading ,
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
                        itemCount: controller
                            .upcomingMovies!.results.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child:
                              // Image.network(
                              //   fit: BoxFit.fitHeight,
                              //     "$imageUrl${controller.upcomingMovies?.results[index].posterPath}"
                              // ),

                              CachedNetworkImage(
                                errorWidget: (context, url, error) => const CircularProgressIndicator(),
                                placeholder: (context, url) => const MyShimmer(
                                    color: Colors.white,
                                    width: 120,
                                    height: 200),
                                fit: BoxFit.fill,
                                width: 120,
                                imageUrl: '$imageUrl${controller.upcomingMovies?.results[index].posterPath}',)
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
                  :
              SizedBox();
              // ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: 5,
              //         itemBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: MyShimmer(
              //               color: Colors.white,
              //               width: 120,
              //               height: 200,
              //
              //             ),
              //           );
              //         },
              //       );
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
