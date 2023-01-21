import 'package:flutter/material.dart';
import 'package:khanaapp/fadeanimation.dart';
import 'package:khanaapp/login.dart';
import 'package:khanaapp/signup.dart';

class Logincreate extends StatefulWidget {


  @override
  State<Logincreate> createState() => _StartScreenState();
}

class _StartScreenState extends State<Logincreate> {
  TextEditingController _email = TextEditingController();
   TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
         
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
        
          children: <Widget>[
         
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(height: 300,
                  width: 260,
                  child: Image.asset("asset/loginlogo.png"))
              
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2aad4d),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
   Container(
                        
                         child: 
                             Text('Home Delivery!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
  
                        
                         ),
                         Container(
                        
                         child: Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
                        Text('Further to that, I want to make the image and a text inside the card responsive',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,),),
  
                        
                           )  ),
                         Column(
                           children: [
                          Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.white,
    child: Text("            Login            ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
SizedBox(height: 4,),
   Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    // textColor: Colors.white,
    color: Colors.black,
    child: Text("            Signup            ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
                    //       FadeAnimation(1.6, Container(
                    //       height: 50,
                    //       margin: EdgeInsets.symmetric(horizontal: 50),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Colors.white
                    //       ),
                    //       child: Center(
                    //         child: Text("Login", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                    //       ),
                    //     )),
                    // SizedBox(height: 10,),
                    //        FadeAnimation(3, Container(
                    //       height: 50,
                    //       margin: EdgeInsets.symmetric(horizontal: 50),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Colors.black
                    //       ),
                    //       child: Center(
                    //         child: Text("Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    //       ),
                    //     )),      
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