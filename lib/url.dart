import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Url extends StatefulWidget {
  final url;
  const Url({Key key, this.url}):super(key: key);
  @override
  _UrlState createState() => _UrlState();
}

class _UrlState extends State<Url> {

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,// hides leading widget

              )
          ),
          body: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,


          )
      );

    }
}
