import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../widgets/feedWidget.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  iconSize: 30,
                  color: wht,
                  onPressed: () {},
                  icon: Icon(Icons.search_sharp)),
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
          backgroundColor: Colors.black,
          title: Text(
            "New & Hot",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FeedWidget(
                  imgUrl:
                      'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                  overView:
                      'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                  month: "Jun",
                  day: "19",
                ),
                SizedBox(
                  height: 20,
                ),
                FeedWidget(
                  imgUrl:
                      "https://pbs.twimg.com/media/F-u4A1OaEAAVx6T?format=jpg&name=4096x4096",
                  overView:
                      "The film is produced by Jun Abraham, Siddharth Anand Kumar, Dolwin Kuriakose, and Vikram Mehra under the banner of Theatre of Dreams and Yoodlee Films. Apart from Mammootty, Bazooka features  Tamil filmmaker Gautham Vasudev Menon, Siddharth Bharathan, Shine Tom Chacko, VK Prakash, Vasisht Umesh, and Bhama Arun. Nimish Ravi handled the cinematography while Nishadh Yusuf did the editing. The music for the movie was composed by Midhun Mukundan",
                  month: "May",
                  day: "24",
                ),
                SizedBox(
                  height: 20,
                ),
                FeedWidget(
                  imgUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUyp6zqziN4ndTwLF2gEbJG__uEbV2E3tHjHX-A3KIXg&s",
                  overView:
                      "The dragon riders are coming back with a fire in their bellies. Following the success of the first season, both ratings-wise and Emmy nominations-wise, the Game of Thrones prequel series House of the Dragon was renewed for a second season, which, it was revealed on November 2, is set to debut on June 16",
                  month: "Jun",
                  day: "16",
                ),
                SizedBox(
                  height: 20,
                ),
                FeedWidget(
                    imgUrl:
                        "https://m.media-amazon.com/images/M/MV5BOWMyNTA2M2UtMmZkNC00ZWE5LThjZGItODcxNGU2MDBhYTk1XkEyXkFqcGdeQXVyOTU0NjY5MzM@._V1_.jpg",
                    overView: "Aavesham is an upcoming Indian Malayalam-language action comedy film directed by Jithu Madhavan. The film is jointly produced by Nazriya Nazim, Fahad Faasil and Anwar Rasheed. It stars Fahadh Faasil in the title role with a supporting cast of Ashish Vidyarthi, Sajin Gopu and Mansoor Ali Khan. Sameer Thahir is the film's cinematographer, and has music composed by Sushin Shyam.",
                    month: "Apr",
                    day: "11"),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ));
  }
}
