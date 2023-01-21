import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:khanaapp/ordercomplete.dart';

import 'package:timelines/timelines.dart';


const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  final _formKey = GlobalKey<FormState>();
          final TextEditingController _textNameController = new TextEditingController();
          final TextEditingController _textPhoneController =
          new TextEditingController();
          String _selectBookType = "";
          String title;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
          bool isVisible = false;
  int _processIndex = 2;
  bool _value = false;
  int val = -1;
   String _selectedPaytype = 'Credit/ATM';
  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }
    int groupValue =0;
PageController controller =PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Title(color: Colors.black, child: Text("Delivery",style: TextStyle(color: Color(0xff119D50),fontWeight: FontWeight.bold),)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){
        Navigator.pop(context);
        },),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(flex: 20,child:  Container(
            
            height: 120,
            child:
 Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
            space: 30.0,
            thickness: 5.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
              MediaQuery.of(context).size.width / _processes.length,
          // oppositeContentsBuilder: (context, index) {
          //   return Padding(
          //     padding: const EdgeInsets.only(bottom: 15.0),
          //     child: Icon(Icons.ac_unit_rounded)
          //   );
          // },
          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                _processes[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: getColor(index),
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            var color;
            var child;
            if (index == _processIndex) {
              color = inProgressColor;
              child = Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            } else if (index < _processIndex) {
              color = completeColor;
              child = Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
            }

            if (index <= _processIndex) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(30.0, 30.0),
                    painter: _BezierPainter(
                      color: color,
                      drawStart: index > 0,
                      drawEnd: index < _processIndex,
                    ),
                  ),
                  DotIndicator(
                    size: 30.0,
                    color: color,
                    child: child,
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(15.0, 15.0),
                    painter: _BezierPainter(
                      color: color,
                      drawEnd: index < _processes.length - 1,
                    ),
                  ),
                  OutlinedDotIndicator(
                    borderWidth: 4.0,
                    color: color,
                  ),
                ],
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == _processIndex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5), color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: _processes.length,
        ),
      )),),
            Expanded(flex: 90,child: Container(
              child:   PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
              Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child:
              Column(
                children: [

              
          Text("My home #1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23, ),),
        
      Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Text("3001 , panchkula 01,Hrayana",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Color(0xff119D50) ),)),
        SizedBox(height: 20,),   IconButton(icon: Icon(Icons.edit), onPressed: (){}),
         
          Text("Edit address",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15,),)  ],
              )),
          Container( child:    Padding(
  padding: EdgeInsets.only(top:4,bottom: 15,left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Continue      "),
    onPressed: () {
      controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      setState(() {
  _processIndex = (_processIndex + 1) % _processes.length;
});
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),)
          ],
        ),
      ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
           
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                 child:Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // const Text('Please let us know your gender:'),
              ListTile(
                leading: Radio<String>(
                  value: 'Credit/ATM',
                  groupValue: _selectedPaytype,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaytype = value;
                    });
                  },
                ),
                title: const Text('Credit/ATM'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Debit',
                  groupValue: _selectedPaytype,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaytype = value;
                    });
                  },
                ),
                title: const Text('Debit'),
              ),
              const SizedBox(height: 5),
            _selectedPaytype == 'Credit/ATM' ? Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey,
                        onCreditCardModelChange: onCreditCardModelChange,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',

                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder Name',
                        ),
                      ),
                      
                    ],
                  ) :  TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Type sd no.',        
                          enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: Colors.red),   
                            ),  
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                      ),  
             ))
            ],
          )),

                  ),  Container( child:    Padding(
  padding: EdgeInsets.only(top:4,bottom: 15,left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Pay Now      "),
    onPressed: () {
      if(formKey.currentState.hashCode==null){
 if (formKey.currentState.validate()) {
                            print('valid!');
                            _showValidDialog(context,"Valid","Your card successfully valid !!!");
                          } else {
                            print('invalid!');
                          }
      }
      
      controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      setState(() {
  _processIndex = (_processIndex + 1) % _processes.length;
});
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),)

               //   groupValue!=1?23:Text('data')
                ],
              )),
          
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 child: Column(
                   children: [

               
           Padding(padding: EdgeInsets.only(top: 20),child:  CircleAvatar(
               radius: 70,
               backgroundColor:  Color(0xff119D50),
               child: Icon(Icons.check,size: 120,color: Colors.white,),
            ) ),
            Text('Order Confirmed!',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)    ],
                 ),
               ),
            Container( child:    Padding(
  padding: EdgeInsets.only(top:4,bottom: 15,left: 20.0, right: 20.0),
  child: RaisedButton(
    textColor: Colors.white,
    color: Color(0xff092C08),
    child: Text("      Done      "),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Ordercomplete()));
    },
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
  ),
),)
           ],)
            ),

          ],
        ),)),
//              Expanded(flex: 8,child: Container( child:    Padding(
//   padding: EdgeInsets.only(top:4,bottom: 15,left: 20.0, right: 20.0),
//   child: RaisedButton(
//     textColor: Colors.white,
//     color: Color(0xff092C08),
//     child: Text("      Continue      "),
//     onPressed: () {
//       controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
//       setState(() {
//   _processIndex = (_processIndex + 1) % _processes.length;
// });
//      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
//     },
//     shape: new RoundedRectangleBorder(
//       borderRadius: new BorderRadius.circular(30.0),
//     ),
//   ),
// ),)),
         
 
    
      
        ],
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.ac_unit),
      //   onPressed: () {
      //     setState(() {
      //       _processIndex = (_processIndex + 1) % _processes.length;
      //     });
      //   },
      //   backgroundColor: inProgressColor,
      // ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }   Future <AlertDialog> _showValidDialog(BuildContext context, String title, String content,) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff1b447b),
          title: Text(title),
          content: Text(content),
          actions: [
            FlatButton(
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 18,color: Colors.cyan),
                ),
                onPressed: () {
                 Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
     this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Address',
  'Delivery',
  'Payment',
  'Confirm',
 
];

