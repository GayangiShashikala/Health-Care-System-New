import 'package:flutter/material.dart';

class page_2 extends StatelessWidget {
  const page_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/welcome2.jpg'),
              fit: BoxFit.cover
          )
      ),
    );
  }
}
