import 'package:flutter/material.dart' show Center, CircularProgressIndicator, StatelessWidget, Widget, WillPopScope;

class Loading extends StatelessWidget {
  Widget build(_) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
