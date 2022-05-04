import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:anime_app/providers.dart';
import 'package:anime_app/widgets.dart';

class CategoredForm extends StatefulWidget {
  @override
  _CategoredFormState createState() => _CategoredFormState();
}
class _CategoredFormState extends State<CategoredForm> {
    bool expandedCategories = false;

  @override
  Widget build(BuildContext context) {
        bool expandedMode = false;

    return  Center(
        child: Container(color: Colors.amber,
          child: Stack(alignment: Alignment.bottomCenter ,
            children: [ListView(shrinkWrap:true,addSemanticIndexes: true,
                children: [Center(child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[ExpandedModeChoices(),ExpandedCategoriesChoices()])),
                Column(
                  children:
              Provider.of<ControllCategoredContent>(context,listen: true).cards.map((card)=>AnimeCard(data:card)).toList())
              ,SizedBox(height: 15.0.w,)
              ],
            ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[FloatingActionButton(child: Icon(Icons.navigate_before),
                    onPressed: ()async {await Provider.of<ControllCategoredContent>(context,listen:false).goPrev();
                    }),
                    FloatingActionButton(child: Icon(Icons.navigate_next),
                    onPressed: ()async {await Provider.of<ControllCategoredContent>(context,listen:false).goNext();
                    setState(() {
                      expandedMode=!expandedMode;
                    });}),

                  ],
                ),
            
            ]
          ),
        ),
      );
  
  }
  
}