import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  String title;
  String desc;
  String ImageUrl;
  String date;
  String author;

  NewsDetails(this.title, this.desc, this.ImageUrl, this.date, this.author);

  @override
  _NewsDetailsState createState() =>
      _NewsDetailsState(title, desc, ImageUrl, date, author);
}

class _NewsDetailsState extends State<NewsDetails> {
  String title;
  String desc;
  String ImageUrl;
  String date;
  String author;

  _NewsDetailsState(
      this.title, this.desc, this.ImageUrl, this.date, this.author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsKitchen : By Sangam',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  title!=null?title:'NA',
                  style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  ImageUrl!=null?ImageUrl:'https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          date,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  desc,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
