import 'package:flutter/material.dart';
import 'package:khanaapp/verifyotphone.dart';

class Entermobile extends StatefulWidget {


  @override
  State<Entermobile> createState() => _EntermobileState();
}

class _EntermobileState extends State<Entermobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Login with Mobile",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Container(
          child: Image.asset("asset/ft.jpeg"),
        )  ,
          Container(
            child: Column(
              children: [
                 Text(
                    'Mobile Verification',
                    style:
                        TextStyle(color:Color(0xff2aad4d),fontSize: 22.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
             Text(
                      'We will send you a One Time Password on this mobile number',
                      style: TextStyle(
                        color: Colors.black,
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
              children: [
                Text("Enter Mobile Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
            ,Padding(padding: EdgeInsets.only(left: 20,right: 20),child:  TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Type Mobile no.',        
                          enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.red),   
                            ),  
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                      ),  
             )))
              ],
            ) ,
          ),
          Container(
            child: Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Get OTP"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOtpPhone()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
          )
        ],
      ),
    );
  }
}