import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:anime_app/providers.dart';
//import 'package:anime_app/widgets.dart';
import 'package:anime_app/layouts/home_screen.dart';
import 'package:anime_app/layouts/categoried_form.dart';
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
  ChangeNotifierProvider(create: (_)=>ControllSearchContent()),
  ChangeNotifierProvider(create: (_)=>ControllCategoredContent(),)]
  ,
  child: LayoutBuilder(                           //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(                  //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return MaterialApp(
      title: 'Anime Fan',debugShowCheckedModeBanner: false,
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
  Provider.of<ControllSearchContent>(context,listen:false).begin();
  Provider.of<ControllCategoredContent>(context,listen:false).begin();
  

}  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Anime'),
      ),
      body:Container(
        child: 
     //     CategoredForm(),  
      MainScreen()
      )
    );
  }
}
