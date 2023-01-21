import 'package:flutter/material.dart';
import 'package:khanaapp/data/cartlist.dart';
import 'package:khanaapp/data/datalist.dart';
import 'package:khanaapp/timline.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
 final List<dynamic> cargetdata;

  Cart({Key key,  this.cargetdata,}) : super(key: key);
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice;
    double totalAmount=0;
 int addproduct( mqty,mprice,int index) {
  // ignore: unnecessary_statements
setState(() {
  totalPrice = mprice * mqty;
 
 widget.cargetdata[index].price = totalPrice;
}); 


}

   int _currentAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Title(color: Colors.black, child: Text("Shopping Cart",style: TextStyle(color: Color(0xff119D50),fontWeight: FontWeight.bold),)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){
        Navigator.pop(context);
        },),
      ),
      body: Column(
        children: [
          Expanded(flex: 80,child: Container(
          child:Padding(padding: EdgeInsets.only(top: 20),child: 
          ListView.builder(
    itemCount: widget.cargetdata.length,
    itemBuilder: (BuildContext context, int index){
    totalAmount =  widget.cargetdata.map<double>((item) => item.quantity*item.price).reduce((value1, value2) => value1+value2);
   print(totalAmount);
//          widget.cargetdata.forEach((element) {
         

//              totalAmount = totalAmount + element.price;
// print(totalAmount);

    // });
      return new  GestureDetector(
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => Chat()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(38),
                                  color: Color(0xffACE5AC),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: 120,
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Container(
                                            height: 80,
                                            width: 80.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    AssetImage( widget.cargetdata[index].image),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          )),
                                    ),
                           Padding(
  padding:
      EdgeInsets.only(top: 10, left: 30),child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     Text(
 widget.cargetdata[index].name,
  style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17),
),
  Text(
  widget.cargetdata[index].price.toString(),
  style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 14),
),
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
     Text("                 "),
    Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              if( widget.cargetdata[index].quantity==1){
                  widget.cargetdata.removeAt(index);
              }
              else{

                 widget.cargetdata[index].quantity--;
                 addproduct(widget.cargetdata[index].amount,widget.cargetdata[index].quantity,index);
                  //addproduct(index);
//  carts[index]['qty'] =  _currentAmount -= 1;
              }
              // ignore: unnecessary_statements
             
            });
          },
        ),
        SizedBox(width: 15),
        Text(
         widget.cargetdata[index].quantity.toString(),
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(width: 15),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
               widget.cargetdata[index].quantity++;
                addproduct(widget.cargetdata[index].amount,widget.cargetdata[index].quantity,index);
             //  carts[index]['qty'] = _currentAmount += 1;
            });
          },
        ),
      ],
    )
  ],
)
  ],
),
)
                                 
                                  ],
                                ),
                              ));
            
  
    },
    padding: EdgeInsets.all(0.0),
  ))
          )),
          Expanded(flex: 20,child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text('Total Amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Text(totalAmount.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18))
            ],),
            Padding(
  padding: EdgeInsets.only(left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Checkout      "),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
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