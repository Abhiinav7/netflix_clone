
import 'package:flutter/material.dart';
import '../../common/utils.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blk,
        title: Image.asset("assets/logo/netflixname.png",
        height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              iconSize: 30,
              color: wht,
                onPressed: (){},
                icon: Icon(Icons.search_sharp)
            ),
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
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
