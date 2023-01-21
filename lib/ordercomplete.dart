import 'package:flutter/material.dart';
import 'collectionitems.dart';
class Ordercomplete extends StatefulWidget {


  @override
  State<Ordercomplete> createState() => _OrdercompleteState();
}

class _OrdercompleteState extends State<Ordercomplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Container(
           height: 200,
           width: 250,
        
          child: Image.asset("asset/loginlogo.png",fit: BoxFit.cover,),
        )  ,
          Container(
            child: Column(
              children: [
                 Text(
                    'Order Successfully!',
                    style:
                        TextStyle(color:Color(0xff2aad4d),fontSize: 22.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
             Text(
                      'We will start work on time.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                         SizedBox(height: 10,),
             Text(
                      'Thank You!',
                      style: TextStyle(
                        color:Color(0xff2aad4d),
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
              ],
            ),
          ),
          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               Container(
            child: Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("View Order"),
    onPressed: () {},
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
          ),
           Container(
            child: Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Continue Shopping"),
    onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Collectionitems()));
       },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
          )
              ],
            ) ,
          ),
         
        ],
      ),
    );
  }
}