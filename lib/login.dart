import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khanaapp/collectionitems.dart';
import 'package:khanaapp/fadeanimation.dart';
import 'package:khanaapp/forgetpassword.dart';
import 'package:khanaapp/homescreen.dart';

class Loginscreen extends StatefulWidget {


  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Login",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body:SingleChildScrollView(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Container(
          child: Image.asset("asset/login.png"),
        )  ,
        Container(
      
          child: Column(children: [

        
        
              Text("Log In",style: TextStyle(color: Color(0xff2aad4d),fontSize: 18,fontWeight: FontWeight.bold),),
             new SizedBox(height: 20.0), 
             
             Form(key: _key, child: 
             Column(children: [
               Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
     new TextFormField(
          keyboardType: TextInputType.emailAddress,
         
       
          decoration: InputDecoration(
          filled: true,
                      fillColor: Color(0xFFddebdf),
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
           // ignore: missing_return
           validator: (val) {
                                  if (val.length == 0)
                                    return "Please enter email";
                                  else if (!val.contains("@"))
                                    return "Please enter valid email";
                                },
        )),
        new SizedBox(height: 10.0),
             Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
       new TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                      fillColor: Color(0xFFddebdf),
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
           // ignore: missing_return
           validator: (val) {
                                  if (val.length == 0)
                                    return "Please enter email";
                                  else if (!val.contains("@"))
                                    return "Please enter valid email";
                                },),),
             ],),
             
          )  ],)) ,
       Container(
         child: 
        Column(
            children: [
 Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Log In"),
    onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Collectionitems()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
                        FlatButton(onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgetpasssword()));
                        }, child:  Text("Forget password!",style: TextStyle(color: Color(0xff2aad4d),fontSize: 15,fontWeight: FontWeight.bold),),)
            ],
          )
        
          )  
        
        ],
       )) 
    );
  }
}