import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_quotes/data/quotes_data.dart';
import 'package:my_quotes/models/quotes_model.dart';
import 'package:my_quotes/screens/quote.dart';
import 'package:provider/provider.dart';

import '../widgets/my_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  // *** VARIABLES:
  // *
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) =>
      // *

      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[600],
            // Theme.of(context).colorScheme.primaryVariant,
            title: const Text('QuotesBook'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: //         // ...quoteData.quotes.map((quote) => InkWell(
                InkWell(
              onTap: () {
                final nextOrder = <String, dynamic>{
                  "details": "never give up",
                  "imgUrl": ""
                };
                database
                    .child("quotes")
                    .push()
                    .set(nextOrder)
                    .then((value) => print("done"))
                    .catchError((err) => print("error"));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => QuoteImage(imgUrl: ""),
                //   ),
                // );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Stack(children: [
                  Positioned(
                    child: MyCard(details: "never give up"),
                  ),
                  Positioned(
                    top: 20,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 2)],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(""),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ));
}
