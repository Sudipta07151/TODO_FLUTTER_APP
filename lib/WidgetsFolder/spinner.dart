import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: SpinKitThreeBounce(
        color: Colors.orange.shade700,
        size: 40,
      ),
    ));
  }
}
