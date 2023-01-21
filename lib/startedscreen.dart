import 'package:flutter/material.dart';
import 'package:khanaapp/fadeanimation.dart';
import 'package:khanaapp/login.dart';
import 'package:khanaapp/logincreate.dart';

class Startscreen extends StatefulWidget {


  @override
  State<Startscreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<Startscreen> {
  TextEditingController _email = TextEditingController();
   TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff2aad4d),
         
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   colors: [
          //     Colors.orange[900],
          //     Colors.orange[800],
          //     Colors.orange[400]
          //   ]
          // )
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
         
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                
                children: <Widget>[
                  Container(
                  child: Image.asset("asset/grocery.png",fit: BoxFit.cover,))
              
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
   Container(
                        
                         child: 
                             Text('Welcome to Grocery Store!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xff2aad4d)),),
  
                        
                         ),
                         Container(
                        
                         child: Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
                        Text('Further to that, I want to make the image and a text inside the card responsive',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,),),
  
                        
                           )  ),
                         Column(
                           children: [
                       
                    SizedBox(height: 10,),
                     Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("   Get Started    "),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Logincreate()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
                        //    FadeAnimation(4,RaisedButton(color: Colors.white, onPressed: (){
                        //      Navigator.push(context, MaterialPageRoute(builder: (context)=>Logincreate()));
                        //    },child: Container(
                        //   height: 50,
                        //   margin: EdgeInsets.symmetric(horizontal: 50),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50),
                        //     color: Colors.black
                        //   ),
                        //   child: Center(
                        //     child: Text("Get Started", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        //   ),
                        // ))),      
                           ],
                         )
                  ],
                )
              //    SingleChildScrollView(
              //     child: Padding(
              //       padding: EdgeInsets.all(30),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: <Widget>[
                 
                    //  Container(
                        
                    //      child: 
                    //          Text('Home Delivery!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
  
                        
                    //      ),
                    //      Container(
                        
                    //      child: 
                    //     Text('Further to that, I want to make the image and a text inside the card responsive',style: TextStyle(fontSize: 15),),
  
                        
                    //      ),
                         
                        
              //           FadeAnimation(1.6, Container(
              //             height: 50,
              //             margin: EdgeInsets.symmetric(horizontal: 50),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50),
              //               color: Colors.orange[900]
              //             ),
              //             child: Center(
              //               child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              //             ),
              //           )),
              //       SizedBox(height: 10,),
              //              FadeAnimation(3, Container(
              //             height: 50,
              //             margin: EdgeInsets.symmetric(horizontal: 50),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50),
              //               color: Colors.orange[900]
              //             ),
              //             child: Center(
              //               child: Text("Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              //             ),
              //           )),
                       
              //         ],
              //       ),
              //     ),
              //   ),
               ),
            )
          ],
        ),
      ),
    );
  }
}