import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../common/utils.dart';
import '../model/tv_series_model.dart';
class CustomCarousal extends StatelessWidget {
  const CustomCarousal({super.key,required this.seriesModel});
final TvSeriesModel seriesModel;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SizedBox (
      width: size.width,
      height:(size.height * 0.26) <200 ?220:(size.height * 0.26),
      child: CarouselSlider.builder(

        options: CarouselOptions(
       height: (size.height * 0.33) <300 ?250:(size.height * 0.33),
          autoPlay: true,
          initialPage: 0,
          aspectRatio: 16/9,
          reverse:  false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeCenterPage: true
        ),
        itemCount: seriesModel.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url=seriesModel.results[index].backdropPath.toString();
          return GestureDetector(
            child: Column(
              children: [
                CachedNetworkImage(
                  // fit: BoxFit.fill,
                    imageUrl:"$imageUrl$url"
                ),
                SizedBox(height: 10,),
                Text(seriesModel.results[index].name,style: TextStyle(fontSize: 14),)
              ],
            ),
          );
        },)

    );
  }
}
