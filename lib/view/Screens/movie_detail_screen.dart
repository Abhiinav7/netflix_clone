import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/services/api_services.dart';

import '../../model/movie_detail_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final movieid;

  const MovieDetailScreen({super.key, required this.movieid});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieDetails();
  }

  late Future<MovieDetailModel> movieDetails;
  ApiServices apiServices = ApiServices();

  void getMovieDetails() {
    movieDetails = apiServices.getMovieDetails(widget.movieid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ApiServices apiServices = ApiServices();
    print(widget.movieid);
    return Scaffold(
        body: FutureBuilder(
      future: movieDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final movieDetail = snapshot.data;
          String movieGenres =
              movieDetail!.genres.map((e) => e.name).join(" , ");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${imageUrl}${movieDetail!.posterPath}"))),
                ),
                Positioned(
                    child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              movieDetail.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Text(
                  movieDetail.releaseDate.year.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    movieGenres,
                    style: TextStyle(color: Colors.grey,fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,

                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              movieDetail.overview,
              style: TextStyle(color: Colors.white,fontSize: 18),
            )
          ]);
        } else {
          return SizedBox();
        }
      },
    ));
  }
}
