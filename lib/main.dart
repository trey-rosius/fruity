import 'package:flutter/cupertino.dart';
import 'package:fruity/HomeScreen.dart';

void main() {

  runApp(

      FruityApp(),

    //#F1A8B9
    //  #BD4982
    //#E1603A
      //#F1AF27
    //#EF5964
    //#DCB4E7
    //	#8943A1
    //#FF7350
    //#1478B2

  );
}

class FruityApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruity',
      home:  HomeScreen(),
    );
  }
}
