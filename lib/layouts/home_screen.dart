import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'categoried_form.dart';
import 'search_page.dart';
import 'package:anime_app/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(pages: [Container(child: SearchForm(),color: Colors.lightBlueAccent,),Container(child: CategoredForm())
    ],
    
    initialPage: 0,
    waveType: WaveType.liquidReveal,
    enableLoop: true,
    enableSideReveal: false,
    );
  }
}