import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/fuits_category.dart';

class ImageDetailScreen extends StatefulWidget {
  ImageDetailScreen({this.image});
  final String image;


  @override
  ImageDetailScreenState createState() {
    return new ImageDetailScreenState();
  }
}

class ImageDetailScreenState extends State<ImageDetailScreen> {




  Widget _buildImageCategory(context,index, List<String>listImages) {


    return
      Hero(
        tag:listImages[index],
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:  ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(listImages[index],fit: BoxFit.cover,)),






        ),
      );
  }


  @override

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      child: CustomScrollView(
        slivers: <Widget>[


            SliverAppBar(
                 leading: GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Icon(CupertinoIcons.back)),


                  flexibleSpace:
                      FlexibleSpaceBar(

                        background:

                                 Image.asset(widget.image, fit: BoxFit.cover)

                       ),


              // Extruding edge from the sliver appbar, may need to fix expanded height
              expandedHeight: MediaQuery.of(context).size.height / 2.5,
              backgroundColor: Colors.transparent,




          ),

          SliverPadding(

              padding: EdgeInsets.only(left: 10.0),
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return _buildImageCategory(context, index, fruitsCategoryList.images);
                    },
                    childCount: 12,
                  ))),


        ],
      ),
    );
  }
}
