import 'package:flutter/material.dart';
import 'package:news_app/Screens/Article_viewScreen.dart';

class BlogTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String url;

  BlogTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(
                blogUrl: url,
              ),
            ),
          );
        },
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgUrl,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(desc, style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
