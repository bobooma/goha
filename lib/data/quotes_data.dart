import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_quotes/models/quotes_model.dart';

// ignore: constant_identifier_names
const QUOTES_PATH = "quotes";
late final String ahmed;

//
class QuotesData extends ChangeNotifier {
  late StreamSubscription<Event> quoteStream;

  final _database = FirebaseDatabase.instance.reference();
  List<QuoteModel> _quotes = [];
  late final String adgh;

  @override
  void dispose() {
    quoteStream.cancel();
    super.dispose();
  }

  List<QuoteModel> get quotes {
    return _quotes;
  }

  void ordersLisetener() {
    quoteStream = _database.child(QUOTES_PATH).onValue.listen((event) {
      final alllQuotes = Map<String, dynamic>.from(event.snapshot.value);

      _quotes = alllQuotes.values
          .map((quoteAsJson) =>
              QuoteModel.fromRTDB(Map<String, dynamic>.from(quoteAsJson)))
          .toList();
      notifyListeners();
    });
  }
}
