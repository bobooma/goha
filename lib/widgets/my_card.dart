import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.details,
  }) : super(key: key);
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.only(left: 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                details,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  //
                  // ***
                  // TODO rEVISION
                  //overflow: TextOverflow.ellipsis,
                  fontSize: 17,
                  // letterSpacing: 2,
                  fontFamily: "RobotoCondensed",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
