import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatelessWidget {
  final String imgUrl;
  final String overView;
  final String month;
  final String day;

  const FeedWidget(
      {super.key,
      required this.imgUrl,

      required this.overView,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(month),
                SizedBox(
                  height: 10,
                ),
                Text(
                  day,
                  style: TextStyle(fontSize: 40, letterSpacing: 5),
                )
              ],
            ),
            SizedBox(width: 14,),
            Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
               CachedNetworkImage(imageUrl: imgUrl),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Coming on $month $day",style: TextStyle(
                          fontSize: 17,fontWeight: FontWeight.bold
                      ),),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.notifications_active_outlined,color: Colors.white,),
                          SizedBox(height: 5,),
                          Text("Remind Me!",style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      SizedBox(width: 22,),
                      Column(
                        children: [
                          Icon(Icons.info_outline_rounded,color: Colors.white,),
                          SizedBox(height: 5,),
                          Text("Info",style: TextStyle(fontSize: 10),)
                        ],
                      ),
                      SizedBox(width: 12,)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(overView,style: TextStyle(
                        fontWeight: FontWeight.bold,

                        fontSize: 14,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),maxLines: 5,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
