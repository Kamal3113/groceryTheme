import 'package:flutter/material.dart';

class address extends StatefulWidget {


  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  TextEditingController search = new TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Title(color: Colors.black, child: Text("Shipping Address",style: TextStyle(color: Color(0xff119D50),fontWeight: FontWeight.bold),)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){
        Navigator.pop(context);
        },),
      ),
      body:Column(
        children: [
          Expanded(flex: 80,child: Container(
          child:  Padding(padding: EdgeInsets.only(top: 40,left: 25,right: 25),child :  Column(
      
          children: [
             Container(height: 50,
          child:  TextField(
  controller: search,
  decoration: InputDecoration(
    fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Name",
      hintText: "Name",
      prefixIcon: Icon(Icons.person),
      
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide.none)),
),
      ),
      SizedBox(height: 15,),
       Container(height: 50,
          child:    TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "MobileNo.",
      hintText: "MobileNo",
      prefixIcon: Icon(Icons.phone),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
),
      ),
      SizedBox(height: 15,),  Container(height: 50,
          child:  TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Address",
      hintText: "Address",
      prefixIcon: Icon(Icons.business_outlined),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
),
      ),  SizedBox(height: 15,),
       Container(height: 50,
          child:    TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "Pin code",
      hintText: "Pin code",
      prefixIcon: Icon(Icons.corporate_fare_rounded,),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
),
      ),
        SizedBox(height: 15,),
       Container(height: 50,
          child:    TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "City/Town",
      hintText: "City/Town",
      prefixIcon: Icon(Icons.location_history),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
),
      ),
      SizedBox(height: 15,),  Container(height: 50,
          child:   TextField(
  controller: search,
  decoration: InputDecoration(
     fillColor: Color(0xffE8FCEC),
    filled: true,
      labelText: "State",
      hintText: "State",
      prefixIcon: Icon(Icons.location_city),
      border: OutlineInputBorder( borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
),
      )
          ],
        ))
          )),
          Expanded(flex: 20,child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
Row(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
     Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value;
    });
  },
),
              Text('Same as billing address'),
  ],
),
FlatButton(onPressed: (){}, child: Text("Add billing address",style: TextStyle(fontWeight: FontWeight.bold,textBaseline: TextBaseline.alphabetic,color: Color(0xff119D50) ),))
           
           
            ],),
            Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Save      "),
    onPressed: () {
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),
          ],),))
        ],
      ),
    );
  }
}