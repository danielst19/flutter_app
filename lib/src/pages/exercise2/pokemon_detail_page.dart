import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/services/pokemon_service.dart';

class PokemonDetailPage extends StatefulWidget {
  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Detail Page'),
      ),
      body: _renderPokemonData(args),
    );
  }

  Widget _renderPokemonData(dynamic args){
    return FutureBuilder(
      future: pokemonService.getPokemonDetail(args['url']),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        final Map<String, dynamic> _data = snapshot.data;

        if(!snapshot.hasData){
          return _createIndicator();
        }

        return Card(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      FadeInImage(
                        placeholder: AssetImage('assets/img/loading.gif'),
                        image: NetworkImage(_data['sprites']['front_default']),
                        fadeInDuration: Duration(milliseconds: 200),
                        fadeInCurve: Curves.fastOutSlowIn,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          _data['name'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }

  Widget _createIndicator(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
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
}