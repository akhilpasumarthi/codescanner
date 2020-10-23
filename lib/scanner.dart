import 'package:barcode_scanner/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  int _index = 4;
  String _data = "";

  Future<void> Scanwebsite()
  async {
    setState(() {
      _index=4;
    });
    String output;
    output= await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title:  Text("QR Code Contains"),
            content: Text(output),
            actions: [
              FlatButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Url(url: output)));
                  }, child: Text("Go to the Website"))
            ],

          );
        }
    );
  }
  Future<void>Scanqr()
  async {
    setState(() {
      _index=4;
    });
    String output;
    output= await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
    print(output);
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title:  Text("QR Code Contains"),
          content: Text(output),
          actions: [
            FlatButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("close"))
          ],

        );
      }
    );
  }
  Future<void>Scanbar ()
  async{
    setState(() {
      _index=4;
    });
    String output;
    output=await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
    print(output);
    showDialog(context: context,
    builder: (BuildContext context){
           return AlertDialog(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))) ,
             title:  Text("Bar Code Contains"),
             content: Text(output),
             actions: [
               FlatButton(
                 color: Colors.blue,
                   onPressed: (){
                 Navigator.of(context).pop();
               }, child: Text("close"))
             ],


           );
        } );
  }
  Future<int>_getint()async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setInt('clicks',1);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getint();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Scanwebsite();
                        _index = 0;
                      });
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: _index == 0 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Icon(
                          Icons.public,
                          color: _index == 0 ? Colors.white : Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 1;
                        Scanqr();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _index == 1 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Icon(
                          Icons.qr_code,
                          color: _index == 1 ? Colors.white : Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 2;
                        Scanbar();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _index == 2 ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
                        child: Icon(
                          Icons.code,
                          color: _index == 2 ? Colors.white : Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

