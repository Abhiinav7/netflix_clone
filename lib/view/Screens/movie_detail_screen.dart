import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
Stack(children: Image.asset("assets/logo/netflixname.png"))
],),
    );
  }
}
