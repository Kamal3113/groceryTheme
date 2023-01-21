import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
    void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.dialogbox();
    });
    // dialogbox();
  }

  dialogbox() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(23.0))),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    height: 80,
                    child: Stack(
                      children: [
                        
                        CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xff2aad4d),
                              child: Icon(
                                Icons.check,
                                size: 35,
                                color: Colors.white,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                  
                      ],
                    )),
SizedBox(height: 10,),
             Text(
                      'Your account has been created successfully',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                Padding(
  padding: EdgeInsets.only(top:20,left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Done"),
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
            // content:
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}