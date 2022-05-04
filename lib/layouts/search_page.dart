import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:anime_app/providers.dart';
import 'package:anime_app/widgets.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}
class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(alignment: Alignment.bottomCenter ,
          children: [ListView(//shrinkWrap:true,
              children: [SearchBar(),
              Column(
                children:
            Provider.of<ControllSearchContent>(context,listen: true).cards.map((card)=>AnimeCard(data:card)).toList())
            ,SizedBox(height: 15.0.w,)
            ],
          ),

           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[FloatingActionButton(child: Icon(Icons.navigate_before),
                  onPressed: ()async {await Provider.of<ControllSearchContent>(context,listen:false).goPrev();}),
                  FloatingActionButton(child: Icon(Icons.navigate_next),
                  onPressed: ()async {await Provider.of<ControllSearchContent>(context,listen:false).goNext();}),

                ],
              ),
          
          ]
        ),
      );
  }
}