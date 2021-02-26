import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/services/pokemon_service.dart';
import 'package:flutter_application_2/src/shared/icons.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  ScrollController _scrollController = ScrollController();
  int _page = 0;
  bool _loading = false;
  List _listPokemons = [];

  @override
  void initState() { 
    super.initState();
    _getPokemons();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getPokemons();

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
        title: Text('Pokemon list'),
      ),
      body: Stack(
        children: [
          _renderPokemons(),
          _createIndicator()
        ],
      )
    );
  }

  Widget _renderPokemons(){
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) => _createCard(index),
        itemCount: _listPokemons.length
      ),
    );
  }

  Widget _createCard(int index){
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Text(
            _listPokemons[index]['name'],
            style: TextStyle(fontSize: 18),
          ),
          trailing: getIcon(iconName: 'keyboard_arrow_right'),
          onTap: () {
            Navigator.pushNamed(context, 'pokemon-detail', arguments: _listPokemons[index]);
          },
        )
      ),
    );
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
  
  void _getPokemons() async {
    Map map = await pokemonService.getPokemons(_page);
    _listPokemons.addAll(map['results']);
    _page ++;
    setState(() {});
  }

  Future<Null> _onRefresh() async {
    _listPokemons.clear();
    _getPokemons();
    return Future.delayed(Duration(milliseconds: 3));
  }

}