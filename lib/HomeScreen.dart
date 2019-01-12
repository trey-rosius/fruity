import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/ImageDetail.dart';
import 'package:fruity/fuits_category.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(

            activeColor: const Color(0xFFFA6E46),

            inactiveColor: CupertinoColors.black,

            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), title: Text('Home')),
              BottomNavigationBarItem(

                  icon: Icon(CupertinoIcons.conversation_bubble),
                  title: Text('chats')),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.shopping_cart),
                  title: Text('Cart')),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.check_mark_circled),
                  title: Text('Home')),
            ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return HomePageScreen(fruitsCategoryList);
                  break;
                default:
                  return Container();
              }
            },
          );
        });
  }
}

class HomePageScreen extends StatefulWidget {
  HomePageScreen(this.fruitsCategoryList);
  final FruitsCategoryList fruitsCategoryList;
  @override
  HomePageScreenState createState() {
    return new HomePageScreenState();
  }
}

class HomePageScreenState extends State<HomePageScreen> {


  Widget _buildFruitCategory(context,index, List<FruitsCategory>listFruits) {


    return
     Card(
       color: listFruits[index].color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(


              padding: const EdgeInsets.all(5.0),

              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(listFruits[index].name,style: TextStyle(fontSize: 20.0,color: Colors.white,fontFamily: 'Montserrat-Regular'),),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(Icons.cancel,color: Colors.white,),
                  )
                ],
              )
            ),
          ),
    shape:
    new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)




    ),
      );
  }

  Widget _buildImageCategory(context,index, List<String>listImages) {


    return

          Hero(

           tag:listImages[index],
             child: Padding(
                padding: const EdgeInsets.all(5.0),
                child:  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => ImageDetailScreen(image:listImages[index])),
                        );
                      },
                        child: Image.asset(listImages[index],fit: BoxFit.cover,))),








         ),
       );
  }

  Widget _buildImageCategoryList(context,index, List<String>listImages) {


    return
      Padding(
        padding: const EdgeInsets.all(5.0),
        child:  ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(

              listImages[index],
              width: 200.0,
              height: 300.0,
              fit: BoxFit.cover,)),






      );
  }

  @override

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(

            largeTitle: Text('fruity',style: TextStyle(fontFamily: 'Montserrat-Regular',fontWeight: FontWeight.w600),),
            leading: Icon(CupertinoIcons.home),
            trailing: Icon(CupertinoIcons.search),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 60.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                   return _buildFruitCategory(context,index,fruitsCategoryList.fruitsCategory);
                  }),
            ),
          ),

         SliverToBoxAdapter(
           child:  Padding(
             padding: const EdgeInsets.all(10.0),
             child: Text("Fruits, Cocktails And Smoothies",style:TextStyle(fontFamily: 'Montserrat-Regular',fontWeight: FontWeight.bold,fontSize: 20.0)),
           ),
         ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 300.0,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:10,
                  itemBuilder:(context, index){
                return _buildImageCategoryList(context, index, fruitsCategoryList.images);
              }),
            ),
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
                childCount: 11,
              ))),

        ],
      ),
    );
  }
}
