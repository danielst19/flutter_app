import 'package:flutter/material.dart';

class InfiniteScrollPage extends StatefulWidget {
  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  ScrollController _scrollController = ScrollController();
  int _last = 0;
  bool _loading = false;
  List<int> _indexList = [];

  @override
  void initState() { 
    super.initState();
    _generateNumbers();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _generateNumbers();
        _scrollController.animateTo(
          _scrollController.position.pixels + 20,
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll'),
      ),
      body: Stack(
        children: [
          _imagesUrl(),
          _createIndicator()
        ],
      )
    );
  }

  Widget _imagesUrl(){
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) => _createCard(index),
        itemCount: _indexList.length
      ),
    );
  }

  Widget _createCard(int index){
    return Card(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=${_indexList[index]}'),
            fadeInDuration: Duration(milliseconds: 200),
            fadeInCurve: Curves.fastOutSlowIn,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              '${_indexList[index]}',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  void _generateNumbers(){
    _loading = true;
    final duration = Duration(seconds: 3);

    Future.delayed(duration, (){
      _loading = false;
      setState(() {});
    });

    for (int i = 0; i < 5; i++) {
      _last++;
      _indexList.add(_last);
    }

    setState(() {});
  }

  Widget _createIndicator(){
    if(_loading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15)
        ],
      );
    }

    return Container();
  }

  void hideIndicator(){
    _loading = false;
  }

  Future<Null> _onRefresh() async {
    _indexList.clear();
    _generateNumbers();
    return Future.delayed(Duration(milliseconds: 3));
  }
}