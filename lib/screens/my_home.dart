import 'package:Goha/screens/product.dart';
import 'package:Goha/screens/upload_screen.dart';
import 'package:Goha/widgets/social_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../widgets/my_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  // *** VARIABLES:
  // *

  final String link = "....";

  final prods = FirebaseFirestore.instance
      .collection("products")
      .orderBy("time", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) =>
      // *

      Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/goha1.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TweenAnimationBuilder(
                    duration: const Duration(seconds: 1),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Opacity(
                        opacity: value,
                        child: Padding(
                          padding: EdgeInsets.only(top: value * 20),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      "< براندات",
                      style: TextStyle(
                          fontSize: 37,
                          fontFamily: "Lalezar",
                          color: Colors.blueGrey[900]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: //         // ...quoteData.quotes.map((quote) => InkWell(
              Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: StreamBuilder(
                  stream: prods,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return const Text('error .....');
                    }
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(key: ,
                          onDismissed: ,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProdImage(
                                      imgUrl: snapshot.data.docs[index]
                                          ["imgUrl"]),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Stack(children: [
                                MyCard(
                                  madeIn: snapshot.data.docs[index]["madeIn"],
                                  prod: snapshot.data.docs[index]["prodName"],
                                  price: snapshot.data.docs[index]["price"],
                                  materials: snapshot.data.docs[index]
                                      ["materials"],
                                  availability: snapshot.data.docs[index]
                                      ["availability"],
                                  durationOfDiscount: snapshot.data.docs[index]
                                      ["durationOfDiscount"],
                                  priceAfterDiscount: snapshot.data.docs[index]
                                      ["priceAfterDiscount"],
                                ),
                                Positioned(
                                  top: -5,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      boxShadow: const [BoxShadow(blurRadius: 2)],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            snapshot.data.docs[index]["imgUrl"]),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 40,
                child: SocialMedia(
                  axis: Axis.horizontal,

                  //  TODO : add link of the app
                  link: "link",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            // ! for users
            // child:
            // const Icon(Icons.share),
            // onPressed: () {
            //   Share.share(link);
            //
            // ! for admin
            child: const Icon(Icons.add_a_photo),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UploadScreen(),
              ));
            }),
      );
}
