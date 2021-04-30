import 'package:flutter/material.dart';

class TestSignInView extends StatefulWidget {
  @override
  _TestSignInViewState createState() => _TestSignInViewState();
}

class _TestSignInViewState extends State<TestSignInView> {
  bool _load = false;

  loading() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        ? Container(
            color: Colors.white,
            width: 70.0,
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
          )
        : Container();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(),
                      TextField(),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blueGrey),
                        child: Text('Click me'),
                        onPressed: () {
                          setState(() {
                            _load = true;
                            loading();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center,
            ),
          ],
        ));
  }
}
