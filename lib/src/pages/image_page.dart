import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final listImageUrls = [
    'https://cumbrepuebloscop20.org/wp-content/uploads/2018/06/polynesia-3021072_6401.jpg',
    'https://www.muypymes.com/wp-content/uploads/2016/04/paraiso-660x316.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagenes Page')),
      body: _externalImages()
    );
  }

  Widget _localImages(){
    return ListView(
      children: [
        Image.asset(
          'assets/img/avatar.png',
          width: 200,
          height: 100,
          fit: BoxFit.cover
        )
      ],
    );
  }

  Widget _externalImages(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return Image.network(listImageUrls[index]);
      },
      itemCount: listImageUrls.length,
    );
  }
}