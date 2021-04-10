import 'package:flutter/material.dart';
import 'package:news_app/models/newsinfo.dart';
import 'package:news_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Article> _articleModel;

  @override
  void initState() {
    _articleModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Now - Apple'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _articleModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: Colors.red,
                );
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
