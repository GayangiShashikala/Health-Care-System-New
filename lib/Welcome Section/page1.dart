import 'package:flutter/material.dart';


class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/welcome1.PNG'),
        fit: BoxFit.cover
        )
      ),
    );
  }
}