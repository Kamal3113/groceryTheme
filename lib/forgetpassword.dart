import 'package:flutter/material.dart';

class Forgetpasssword extends StatefulWidget {


  @override
  State<Forgetpasssword> createState() => _ForgetpassswordState();
}

class _ForgetpassswordState extends State<Forgetpasssword> {
   GlobalKey<FormState> _key = new GlobalKey();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return      Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Forget Password",style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Container(
          child: Image.asset("asset/ft.jpeg"),
        )  ,
        Container(
      
          child: 

        
        
              Text("Change Password",style: TextStyle(color: Color(0xff2aad4d),fontSize: 18,fontWeight: FontWeight.bold),),
           
             
            ) ,
            Container(
              child:   Form(key: _key, child: 
             Column(children: [
                    Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
       new TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                      fillColor: Color(0xFFddebdf),
              hintText: 'New Password',
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
        new SizedBox(height: 10.0),
             Padding(padding: EdgeInsets.only(left: 20,right: 20),child: 
       new TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                      fillColor: Color(0xFFddebdf),
              hintText: 'Confirm Password',
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
             
          )
            ),
       Container(
         child: 
        
 Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Colors.black,
    child: Text("Submit"),
    onPressed: () {},
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
                      
         
        
          )  
        
        ],
       )
    );
 
  }
}