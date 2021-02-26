import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/pages/animation_page.dart';
import 'package:flutter_application_2/src/pages/card_page.dart';
import 'package:flutter_application_2/src/pages/exercise1/contact_detail_page.dart';
import 'package:flutter_application_2/src/pages/exercise1/contacts_page.dart';
import 'package:flutter_application_2/src/pages/exercise3/dynamic_switch_page.dart';
import 'package:flutter_application_2/src/pages/exercise3/exercise_slider_page.dart';
import 'package:flutter_application_2/src/pages/fade_in_image_page.dart';
import 'package:flutter_application_2/src/pages/image_page.dart';
import 'package:flutter_application_2/src/pages/infinite_scroll_page.dart';
import 'package:flutter_application_2/src/pages/input_page.dart';
import 'package:flutter_application_2/src/pages/list_page.dart';
import 'package:flutter_application_2/src/pages/exercise2/pokemon_detail_page.dart';
import 'package:flutter_application_2/src/pages/exercise2/pokemon_list_page.dart';
import 'package:flutter_application_2/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder> {
    '/': (BuildContext context) => ContactsPage(),
    'contact-detail': (BuildContext context) => ContactDetailPage(),
    'animation': (BuildContext context) => AnimationPage(),
    'list': (BuildContext context) => ListPage(),
    'card': (BuildContext context) => CardPage(),
    'images': (BuildContext context) => ImagePage(),
    'input': (BuildContext context) => InputPage(),
    'fade-in': (BuildContext context) => FadeInImagePage(),
    'infinite-scroll': (BuildContext context) => InfiniteScrollPage(),
    'pokemon-list': (BuildContext context) => PokemonListPage(),
    'pokemon-detail': (BuildContext context) => PokemonDetailPage(),
    'slider': (BuildContext context) => SliderPage(),
    'slider-exercise': (BuildContext context) => ExerciseSliderPage(),
    'dynamic-switch': (BuildContext context) => DynamicSwitchPage(),
  };
}