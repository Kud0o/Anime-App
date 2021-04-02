import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:anime_app/providers.dart';
import 'package:anime_app/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
  providers: [
  ChangeNotifierProvider(create: (_)=>ControllContent()),]
  ,
  child: LayoutBuilder(                           //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(                  //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return MaterialApp(
      title: 'Anime Fan',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
          },
        );
      },
    )
    
    );
    
     
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


@override
 void initState(){
  super.initState();
  Provider.of<ControllContent>(context,listen:false).begin();
  

}

void inti(BuildContext context)
{ Provider.of<ControllContent>(context,listen:false).begin();
}
  
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Anime'),
      ),
      body: Center(
        child: Stack(alignment: Alignment.bottomCenter ,
          children: [ListView(//shrinkWrap:true,
              children: [SearchBar(),
              Column(
                children:
            Provider.of<ControllContent>(context,listen: true).animes.map((anime)=>AnimeCard(data:anime)).toList()),
              SizedBox(height: 15.0.w,)
            ],
          ),

           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[FloatingActionButton(child: Icon(Icons.navigate_before),
                  onPressed: ()async {await Provider.of<ControllContent>(context,listen:false).goPrev();}),
                  FloatingActionButton(child: Icon(Icons.navigate_next),
                  onPressed: ()async {await Provider.of<ControllContent>(context,listen:false).goNext();}),
                
                ],
              ),
          
          ]
        ),
      ),
     
    );
  }
}
