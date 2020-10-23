import 'package:barcode_scanner/first.dart';
import 'package:barcode_scanner/scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    _getint();
    Future.delayed(Duration(seconds: 3),(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>second()));
    });
    super.initState();
  }

  Future<int> _getint()async {
   final prefs=await SharedPreferences.getInstance();
   var clicks= prefs.getInt('clicks');
   if (clicks==1)
   {
     Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) => Scanner()));

   }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Text('All-IN-One Scanner ',style: TextStyle( fontSize: 35.0, fontWeight: FontWeight.w800,color: Colors.white),),
      )
    );
  }
}
