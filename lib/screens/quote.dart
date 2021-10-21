import 'package:flutter/material.dart';
import 'package:my_quotes/models/quotes_model.dart';

class QuoteImage extends StatelessWidget {
  const QuoteImage({
    Key? key,
    required this.imgUrl,
    // required this.conclusion,
  }) : super(key: key);

  final String imgUrl;
  // final String conclusion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Image(
          image: NetworkImage(imgUrl),
        ));
  }
}
