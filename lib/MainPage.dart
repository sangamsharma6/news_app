import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/NewsDetails.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List news;
  static String URL =
      'http://newsapi.org/v2/everything?q=bitcoin&from=2020-08-06&sortBy=publishedAt&apiKey=ENTERYOURAPIKEY';

  Future<void> getNews() async {
    var response = await http.get(URL);
    setState(() {
      try {
        var convertJsonData = json.decode(response.body);
        if (convertJsonData['status'] == "ok") {
          news = convertJsonData['articles'];
          print(news);
        } else {
          Fluttertoast.showToast(
            msg: 'Some Error Occurred',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
        }
      } catch (e) {
        Fluttertoast.showToast(
          msg: e.toString() + ' Error Occured',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: news != null
            ? ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                                news[index]['title'],
                                news[index]['description'],
                                news[index]['urlToImage'],
                                news[index]['publishedAt'],
                                news[index]['author']))),
                    child: ListTile(
                      leading: news[index]['urlToImage'] != null
                          ? Image.network(
                              news[index]['urlToImage'],
                              height: 80,
                              width: 70,
                            )
                          : Image.network(
                              'https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg'),
                      subtitle: Text(
                        news[index]['description'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                      title: Text(
                        news[index]['title'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: 14.0),
                      ),
                      trailing: Text(
                        news[index]['publishedAt'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10.0, color: Colors.black),
                      ),
                    ),
                  );
                })
            : Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: const ModalBarrier(
                        dismissible: false, color: Colors.grey),
                  ),
                  Center(
                    child: new CircularProgressIndicator(),
                  ),
                ],
              ),
      ),
    );
  }
}
