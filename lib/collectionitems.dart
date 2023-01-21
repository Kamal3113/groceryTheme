import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khanaapp/data/cartlist.dart';
import 'package:khanaapp/data/datalist.dart';
import 'package:khanaapp/forgetpassword.dart';
import 'package:khanaapp/item.dart';
import 'package:khanaapp/login.dart';
import 'package:khanaapp/otp.dart';
import 'package:khanaapp/signup.dart';

class Collectionitems extends StatefulWidget {


  @override
  State<Collectionitems> createState() => _CollectionitemsState();
}

class _CollectionitemsState extends State<Collectionitems> {
  var itemList = data;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;
List<cartitems> listProduct =[];
  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }
  @override
    int currentPage = 0;
   
TextEditingController search = new TextEditingController();
  GlobalKey bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
       bottomNavigationBar: FancyBottomNavigation(
        circleColor: Color(0xff08C25D),
        barBackgroundColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.article,
              title: "Category",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.favorite,
              title: "Favourite",
              onclick: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => Forgetpassword()));
              }),
          TabData(iconData: Icons.person, title: "Profile"),
       
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Title(color: Colors.black, child: Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
      ),
    );
  }
   _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(flex: 37,
              child:
            Container(
 child: Column(
   children: [
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        IconButton(icon: Icon(Icons.menu), onPressed: (){}),
       Container(width: 200,
       height: 40,
      //  color: Colors.red,
         child: 
        Padding(padding: EdgeInsets.only(left: 2,right: 2),child :  TextField(
  controller: search,
  decoration: InputDecoration(
      labelText: "Search",
      hintText: "Search",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
))),
                      IconButton(icon: Icon(Icons.shopping_cart,color: Color(0xff08C25D),), onPressed: (){}),
       ],
     ),
     Container(
        child: Center(
          child: Container(
            height:168,
            padding: EdgeInsets.symmetric(vertical: 13),
            child: NotificationListener<ScrollNotification>(
              onNotification: _scrollNotification,
              child: ListView(
                controller: listScrollController,
                scrollDirection: Axis.horizontal,
                children: data.map((item) {
                  return Container(
 width: 200,
 margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
    // gradient: LinearGradient(colors: [item["color"], item["color2"]],
    //         begin: Alignment.centerLeft,
    //         end: Alignment.centerRight,
    //       ),
 color: Color(item["color"]),
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(item["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["title"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                       Container(
                          height: 70,
                          width: 70,
                         child:  Image.asset(
                          item["image"],
                         fit:BoxFit.fill,
                        ),
                       )  
                      ],
                    )
                  );
                  
                  //  AnimatedContainer(
                  //   duration: Duration(milliseconds: 100),
                  //   transform: Matrix4.rotationZ(
                  //       scrollDirection == ScrollDirection.forward
                  //           ? 0.07
                  //           : scrollDirection == ScrollDirection.reverse
                  //               ? -0.07
                  //               : 0),
                  //   width: 200,
                  //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   decoration: BoxDecoration(
                  //       color: Color(item["color"]),
                  //       borderRadius: BorderRadius.circular(16),
                  //       boxShadow: [
                  //         BoxShadow(
                  //             color: Color(item["color"]).withOpacity(0.6),
                  //             offset: Offset(-6, 4),
                  //             blurRadius: 10)
                  //       ]),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Image.asset(
                  //         item["image"],
                  //         height: 30,
                  //       ),
                  //       Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                  //       Text(
                  //         item["title"],
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
   ],
 ),
              // color: Colors.amber,
             ) ),
           Expanded(flex: 36,
              child:
            Container(
 child: Column(
   children: [
     Padding(padding: EdgeInsets.only(left: 10,right: 10),
     child:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
      Text("Sale Discount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
                  FlatButton(onPressed: (){}, child: Text("See all +",style: TextStyle( color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),))
       ],
     )),
     Container(
        child: Center(
          child: Container(
            height:168,
            // padding: EdgeInsets.symmetric(vertical: 13),
            child: NotificationListener<ScrollNotification>(
              onNotification: _scrollNotification,
              child: ListView(
                controller: listScrollController,
                scrollDirection: Axis.horizontal,
                children: items.map((item) {
                  return Container(
 width: 150,
 margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
     color: Color(item["color"]),
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(item["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                         child:  Image.asset(
                          item["image"],
                         fit:BoxFit.fill,
                        ),
                       ) ,
                     Container(
   height: 28,
  //  width: 20,
   decoration: BoxDecoration(
     color:Color(0xff08C25D),
     shape: BoxShape.circle,
   ),
   child: IconButton(icon: Icon(Icons.favorite,color: Colors.red,size: 15,), onPressed: (){}),

                       ),
                       Center(
                         child: Text( item["title"],style: TextStyle(color: Colors.black),)
                       ),
                     Text(item["price"],style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                      
                        // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                       
                      ],
                    )
                  );
                 
                }).toList(),
              ),
            ),
          ),
        ),
      ),
   ],
 ),
              
             ) ),
              Expanded(flex: 24,
              child:
            Container(
 child: Column(
   children: [
     Padding(padding: EdgeInsets.only(left: 10,right: 10),
     child:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Text("Popular sale",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
                  FlatButton(onPressed: (){}, child: Text("   See all +",style: TextStyle( color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),))
      
       ],
     )),
     Container(
        child: Center(
          child: Container(
            height:80,
            // padding: EdgeInsets.symmetric(vertical: 13),
            child: NotificationListener<ScrollNotification>(
              onNotification: _scrollNotification,
              child: ListView(
                controller: listScrollController,
                scrollDirection: Axis.horizontal,
                children: popular.map((item) {
                  return Container(
 width: 200,
 margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
     color: Color(item["color"]),
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(item["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                          height: 70,
                          width: 70,
                         child:  Image.asset(
                          item["image"],
                         fit:BoxFit.fill,
                        ),
                       )    
                       ,Padding(padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),child:
                       Column(
                         children: [
                     
                        Text(
                          item["title"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                         Text(
                         "             450g",
                         textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                         Text(
                          "\$ 20.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),      
                         ],
                       )
                        // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                       ) 
                      ],
                    )
                  );
                  
                }).toList(),
              ),
            ),
          ),
        ),
      ),
   ],
 ),
             ) ),
          // final FancyBottomNavigationState fState =
          //           bottomNavigationKey.currentState;
          //       fState.setPage(2);
          ],
        );
      case 1:
        return Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(flex: 34,
              child:
            Container(
 child: Column(
   children: [
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        IconButton(icon: Icon(Icons.menu), onPressed: (){}),
       Container(width: 200,
       height: 40,
      //  color: Colors.red,
         child: 
        Padding(padding: EdgeInsets.only(left: 2,right: 2),child :  TextField(
  controller: search,
  decoration: InputDecoration(
      labelText: "Search",
      hintText: "Search",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
))),
                      IconButton(icon: Icon(Icons.shopping_cart,color: Color(0xff08C25D),), onPressed: (){}),
       ],
     ),
     Container(
        child: Center(
          child: Container(
          
            height:160,
            // padding: EdgeInsets.symmetric(vertical: 13),
            child: NotificationListener<ScrollNotification>(
              onNotification: _scrollNotification,
              child: ListView(
                controller: listScrollController,
                scrollDirection: Axis.horizontal,
                children: category.map((item) {
                  return Column(
                    children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Item()));
                    },
                child:
                  Container(
 width: 120,
 margin: EdgeInsets.symmetric(horizontal: 1, vertical: 12),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
   shape: BoxShape.circle,
    // gradient: LinearGradient(colors: [item["color"], item["color2"]],
    //         begin: Alignment.centerLeft,
    //         end: Alignment.centerRight,
    //       ),
 color: Color(item["color"]),
     //borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(item["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:Row(
    
    children: [
   Container(
                          height: 87,
                          width: 87,
                         child:  Image.asset(
                          item["image"],
                        //  fit:BoxFit.fill,
                        ),
                       ) 
    ],
  )
                     
                    
                  )),
 Text(
   item["title"],
   style: TextStyle(
       color: Colors.black,
       fontSize: 13,
       fontWeight: FontWeight.bold),
 )
                   ],
                  );
                  
                }).toList(),
              ),
            ),
          ),
        ),
      ),
   ],
 ),
              // color: Colors.amber,
             ) ),
           Expanded(flex: 40,
              child:
            Container(
             
 child: Column(
   children: [
     Padding(padding: EdgeInsets.only(left: 10,right: 10),
     child:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
      Text("Recommended",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
                  FlatButton(onPressed: (){}, child: Text("See all +",style: TextStyle( color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),))
       ],
     )),
     Container(
        child: Center(
          child: Container(
           
            height:201,
            // padding: EdgeInsets.symmetric(vertical: 13),
            child: NotificationListener<ScrollNotification>(
              onNotification: _scrollNotification,
              child: ListView(
                controller: listScrollController,
                scrollDirection: Axis.horizontal,
                children: items.map((item) {
                  return Column(
                    children: [

                 
                  Container(
 width: 150,
 margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
     color: Color(item["color"]),
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(item["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                         child:  Image.asset(
                          item["image"],
                         fit:BoxFit.fill,
                        ),
                       ) ,
                     Container(
   height: 28,
  //  width: 20,
   decoration: BoxDecoration(
     color:Color(0xff08C25D),
     shape: BoxShape.circle,
   ),
   child: IconButton(icon: Icon(Icons.favorite,color: Colors.red,size: 15,), onPressed: (){}),

                       ),
                       Center(
                         child: Text( item["title"],style: TextStyle(color: Colors.black),)
                       ),
                     Text(item["price"],style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                      
                        // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                       
                      ],
                    )
                  )  ,
        SizedBox(height: 5,),      Container(
                height: 24,
                child:    ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Color(0xff092C08),
        elevation: 5,
        // padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
        ),
    ),
    onPressed: () {},
    child: Text(
        "Add to cart",
        style: TextStyle(color: Colors.white),
    ),
),   ) ],
                  );
                 
                }).toList(),
              ),
            ),
          ),
        ),
      ),
   ],
 ),
              
             ) ),
          
              Expanded(flex: 17,
              child:
            Container(
           width: 280,
            // height: 150,
            decoration: BoxDecoration(
              color: Color(0xffF8B435),
              
               borderRadius: BorderRadius.vertical(top: Radius.circular(50),bottom: Radius.circular(0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20),child:
Text('Special offer')),
Padding(padding: EdgeInsets.only(left: 20),child:
Text('20% OFF',style: TextStyle(color: Colors.white
,fontWeight: FontWeight.bold,fontSize: 16),))
                  ],
                ),
                Image.asset("asset/login.png")
              ],
            ),
          ), ),
          
          ],
        );
         case 2:
        return Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(flex: 15,
              child:
            Container(
 child: Column(
   children: [
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        IconButton(icon: Icon(Icons.menu), onPressed: (){}),
       Container(width: 200,
       height: 40,
      //  color: Colors.red,
         child: 
        Padding(padding: EdgeInsets.only(left: 2,right: 2),child :  TextField(
  controller: search,
  decoration: InputDecoration(
      labelText: "Search",
      hintText: "Search",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
))),
                      IconButton(icon: Icon(Icons.shopping_cart,color: Color(0xff08C25D),), onPressed: (){}),
       ],
     ),
       Padding(padding: EdgeInsets.only(left: 10,right: 10),
     child:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
      Text("Favourites",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
                  FlatButton(onPressed: (){}, child: Text("See all +",style: TextStyle( color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),))
       ],
     )),
     
   ],
 ),
              // color: Colors.amber,
             ) ),
           Expanded(flex: 73,
              child:
            Container(
        child: ListView.builder(
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index){
      return new  GestureDetector(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => Chat()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffACE5AC),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 120,
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Container(
                                            height: 80,
                                            width: 80.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(items[index]['image']),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          )),
                                    ),
                           Padding(
  padding:
      EdgeInsets.only(top: 10, left: 30),child:       Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     Text(
 items[index]['title'],
  style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17),
),
  Text(
 items[index]['price'],
  style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 14),
),
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
     Container(
   height: 28,
  //  width: 20,
   decoration: BoxDecoration(
     color:Colors.white,
     shape: BoxShape.circle,
   ),
   child: IconButton(icon: Icon(Icons.favorite,color: Colors.red,size: 15,), onPressed: (){}),

                       ),
    IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){}),
  ],
)
  ],
),
)
                                    // Padding(
                                    //   padding:
                                    //       EdgeInsets.only(top: 10, left: 20),
                                    //   child: Column(
                                    //     children: [
                                    //        Text(
                                    //    items[index]['title'],
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    //     Text(
                                    //    items[index]['price'],
                                    //     style: TextStyle(
                                    //         color: Colors.red,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 14),
                                    //   ),
                                    //     ],
                                    //   )
                                    
                                    // )
                                  ],
                                ),
                              ));
            
  
    },
    padding: EdgeInsets.all(0.0),
  )

              
             ) ),
          
             
          
          ],
        );
          case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    // crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        child:Column(
          children: [

      
      SizedBox(
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12.0,
                child: Icon(
                  Icons.camera_alt,
                  size: 15.0,
                  color: Color(0xFF404040),
                ),
              ),
            ),
            radius: 60.0,
            backgroundImage: AssetImage(
              'asset/a.png'),
          ),
        ),
      ),
      Center(
        child: Container(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Hi Sir David',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Wildlife Advocate',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 12.0,
            ),
          ),
        ),
      ),    ],
        )
      ),
      Container(
        child: 
        Column(
      
          children: [
             Container(height: 50,
          child:    Padding(padding: EdgeInsets.only(left: 20,right: 20),child :  TextField(
  controller: search,
  decoration: InputDecoration(
    fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Name",
      hintText: "Name",
      prefixIcon: Icon(Icons.person),
      
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide.none)),
)),
      ),
      SizedBox(height: 5,),
       Container(height: 50,
          child:    Padding(padding: EdgeInsets.only(left: 20,right: 20),child :  TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "MobileNo.",
      hintText: "MobileNo",
      prefixIcon: Icon(Icons.phone),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
)),
      ),
      SizedBox(height: 5,),  Container(height: 50,
          child:    Padding(padding: EdgeInsets.only(left: 20,right: 20),child :  TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Email",
      hintText: "Email",
      prefixIcon: Icon(Icons.email),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
)),
      ),
      SizedBox(height: 5,),  Container(height: 50,
          child:    Padding(padding: EdgeInsets.only(left: 20,right: 20),child :  TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Address",
      hintText: "Address",
      prefixIcon: Icon(Icons.location_city),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
)),
      )
          ],
        )
       )
       ,Container(child: Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Save      "),
    onPressed: () {
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),)
    
    ],
  );
 
          case 5:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}