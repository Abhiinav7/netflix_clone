import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/recpomended_movie_model.dart';
import '../common/utils.dart';
class Popularmovie extends StatelessWidget {
  Popularmovie({super.key,required this.future,required this.headlineText,});
  Future<RecomendedMovieModel> future;
  String headlineText;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecomendedMovieModel>(
        future: future,
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.results;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        "Top Searches" ,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
                          child:
                          Container(
                            height: 120,
                            child: Row(
                              children: [
                                Image.network(

                                    fit: BoxFit.fitHeight,
                                    "$imageUrl${data[index].posterPath}"
                                ),
                                SizedBox(width: 25,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width-150,
                                    child: Text(data[index].title,maxLines: 2,
                                      overflow: TextOverflow.ellipsis,))
                              ],
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
                  ],
                ),
              );

            } else {
              return const SizedBox.shrink();
            }
          });
  }
}
