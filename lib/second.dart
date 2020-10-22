import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff167D7F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,),
              child:Container(
                width: 100,
                alignment: Alignment.center,
                child: Image(
                    image: AssetImage("images/barcode.png")
                ),
              )
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:180.0),
            child: Text("Bar Code Scanner",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20)),
          ),
          Container(

            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(65),topLeft: Radius.circular(65)),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text('CLEAN UI',style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 25)),
                  SizedBox(height: 40),

                  Text('Scan your code with easy & clean user interface.' , style: TextStyle(color: Colors.black, fontSize: 16,),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
