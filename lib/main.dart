import 'package:flutter/material.dart';
import 'package:khanaapp/address.dart';
import 'package:khanaapp/cart.dart';
import 'package:khanaapp/collectionitems.dart';
import 'package:khanaapp/entermobile.dart';
import 'package:khanaapp/forgetpassword.dart';
import 'package:khanaapp/login.dart';
import 'package:khanaapp/ordercomplete.dart';
import 'package:khanaapp/otp.dart';
import 'package:khanaapp/signup.dart';
import 'package:khanaapp/startedscreen.dart';
import 'package:khanaapp/logincreate.dart';
import 'package:khanaapp/timline.dart';
import 'package:khanaapp/verifyotphone.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:
      //VerifyOtpPhone()
      // Ordercomplete()
     //ProcessTimelinePage()
      //address()
      //Cart()
      //Collectionitems()
     Startscreen(),
    );
  }
}

