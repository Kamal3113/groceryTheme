import 'package:flutter/material.dart';
import 'package:khanaapp/homescreen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpPhone extends StatefulWidget {
 

  @override
  State<VerifyOtpPhone> createState() => _VerifyOtpPhoneState();
}

class _VerifyOtpPhoneState extends State<VerifyOtpPhone> {
    static final int _pinLength = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 40, left: 30),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 33,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                  //  Navigator.push(context, MaterialPageRoute(builder:(context)=> PhoneScreen())),
                  )),
          Positioned(
              child: Container(
            padding: EdgeInsets.only(top: 200, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'OTP Verification',
                    style:
                        TextStyle(color:Color(0xff2aad4d),fontSize: 22.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter the OTP sent you to +91 9459934879\nto change your Password.',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: PinCodeTextField(
                        length: 5,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor:  Color(0xFFddebdf),
                        ),
                        appContext: context,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Didn\t recieve the OTP?',
                    style: TextStyle(color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => null
                      //  Navigator.push(context, MaterialPageRoute(builder:(context)=> HomeScreen())),
                      ),
                      Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Verify & Proceed"),
    onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder:(context)=>Homescreen() ));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}