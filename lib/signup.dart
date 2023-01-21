import 'package:flutter/material.dart';
import 'package:khanaapp/entermobile.dart';
import 'package:khanaapp/login.dart';

class Signup extends StatefulWidget {
 

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   GlobalKey<FormState> _key = new GlobalKey();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Sign Up",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Container(
          child: Image.asset("asset/s.png"),
        )  ,
        Container(
      
          child: Column(children: [

        
        
              Text("Sign Up",style: TextStyle(color: Color(0xff2aad4d),fontSize: 18,fontWeight: FontWeight.bold),),
             new SizedBox(height: 20.0), 
             
             Form(key: _key, child: 
             Column(children: [
         
        new SizedBox(height: 10.0),
                  Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
     RaisedButton.icon(
  onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Entermobile())); },
  shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(30.0))),
  label: Text('Sign up with mobile', 
         style: TextStyle(color: Colors.white),),
  icon: Icon(Icons.mobile_friendly, color:Colors.white,), 
  textColor: Colors.white,
  splashColor: Colors.red,
  color: Colors.black,),),
           new SizedBox(height: 10.0),
                  Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
     RaisedButton.icon(
  onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup())); },
  shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(30.0))),
  label: Text('Sign up with gmail', 
         style: TextStyle(color: Colors.white),),
  icon: Icon(Icons.email_outlined, color:Colors.white,), 
  textColor: Colors.white,
  splashColor: Colors.red,
  color: Colors.black,),),
             ],),
             
          )  ],)) ,
       Container(
         child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
Text("Already have an account?",textAlign: TextAlign.center,),
                        FlatButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
                        }, child:  Text("LogIn!",style: TextStyle(color: Color(0xff2aad4d),fontSize: 15,fontWeight: FontWeight.bold),),)
            ],
          )
        
          )  
        
        ],
       )
    );
  }
}