import 'package:flutter/material.dart';
import 'package:khanaapp/cart.dart';
import 'package:khanaapp/data/cartlist.dart';
import 'package:khanaapp/data/datalist.dart';

class Item extends StatefulWidget {
  

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  List<cartitems> listProduct =[];
  var adddata =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
Stack(
  children: [
    IconButton(icon: Icon(Icons.shopping_cart,size:30,color: Colors.black,),onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(cargetdata:adddata)));},),
    Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 8.0,
                child: Text(adddata.length.toString(),style: TextStyle(fontSize: 14,color: Colors.white),)
              ),
            ),
  ],
)
  ],
        title:Title(color: Colors.black, child: Text("Items",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
      ),
      body:  Column(
        children: [
          Expanded(flex:10,child: Container(child:    Padding(padding: EdgeInsets.only(left: 10,right: 10),
     child:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
      Text("Fruit items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      
                  FlatButton(onPressed: (){}, child: Text("See all +",style: TextStyle( color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),))
       ],
     )),)
          ),
           Expanded(flex:90,child: Container(child:       Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,  
                  crossAxisSpacing: 20.0,  
                  mainAxisSpacing: 20.0  
                // maxCrossAxisExtent: 200,
                // childAspectRatio: 3 / 2,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 60
                ),
            itemCount: items.length==null?0:items.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                               adddata.add(cartitems(name:items[index]["title"],
                  price:double.parse(items[index]["price"]) ,
                  quantity: int.parse(items[index]["qty"]),
                  image: items[index]["image"],
                  amount: double.parse(items[index]["price"])
                  ));            
                                    });
             
                  print(adddata);
                },child: 
           
               Container(
               
 width: 150,
//  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
 decoration: BoxDecoration(
     color: Color(items[index]["color"]),
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
       BoxShadow(
           color: Color(items[index]["color"]).withOpacity(0.6),
           offset: Offset(-6, 4),
           blurRadius: 10)
     ]),
  child:    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                         child:  Image.asset(
                          items[index]["image"],
                        //  fit:BoxFit.fill,
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
                         child: Text( items[index]["title"],style: TextStyle(color: Colors.black),)
                       ),
                     Text(items[index]["price"],style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                      
                        // Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                       
                      ],
                    )
                  )   );
            }),
      ),)
          )
        ],
      )

    );
  }
}