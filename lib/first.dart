import 'dart:async';

import 'package:barcode_scanner/scanner.dart';
import 'package:barcode_scanner/second.dart';
import 'package:barcode_scanner/slideBars.dart';
import 'package:barcode_scanner/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class second extends StatefulWidget {
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  PageController _pageController = PageController(initialPage: 0);
  int curPage = 0;

  _changePage(int index){
    setState(() {
      curPage = index;
      _pageController.animateToPage(curPage, duration: Duration(milliseconds: 200), curve: Curves.slowMiddle);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(curPage<2)
      {
        curPage++;
        _pageController.animateToPage(curPage, duration: Duration(milliseconds: 200), curve: Curves.slowMiddle);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _changePage,
          children: <Widget>[
            First(),
            Second(),
            Third(),

          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for(int i=0;i<3;i++)
                if(i==curPage)
                  SlideBar(isSelected: true,)
                else
                  SlideBar(isSelected: false,)
            ],
          ),
        )
      ],
    );
  }
}
class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18A558),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,),
            child:Container(
              width: 100,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("images/qrcode.png")
              ),
            )
          ),

          Padding(
            padding: const EdgeInsets.only(bottom:180.0),
            child: Text("QR Code Scanner",style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20)),
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
                  Text('NO ANNOYING ADS!',style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 25)),
                  SizedBox(height: 40),
                  
                  Text('Keep scanning and we assure we wont disturb you with unwanted ads.' , style: TextStyle(color: Colors.black, fontSize: 16,),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
