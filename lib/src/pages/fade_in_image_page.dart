import 'package:flutter/material.dart';

class FadeInImagePage extends StatelessWidget {
  final listImageUrls = [
    'https://cumbrepuebloscop20.org/wp-content/uploads/2018/06/polynesia-3021072_6401.jpg',
    'https://www.muypymes.com/wp-content/uploads/2016/04/paraiso-660x316.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeIn Image'),
      ),
      body: _imagesUrl()
    );
  }

  Widget _imagesUrl(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        //return Image.network(listImageUrls[index]);
        return FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(listImageUrls[index]),
          fadeInDuration: Duration(milliseconds: 200),
          fadeInCurve: Curves.fastOutSlowIn,
        );
      },
      itemCount: listImageUrls.length
    );
  }
}