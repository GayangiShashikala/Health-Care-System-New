import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class page3 extends StatelessWidget {
  const page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_ginda0jy.json'),
        )
    );
  }
}
