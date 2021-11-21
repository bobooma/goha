import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.materials,
    required this.madeIn,
    required this.prod,
    required this.price,
    required this.priceAfterDiscount,
    required this.durationOfDiscount,
    required this.availability,
  }) : super(key: key);
  final String materials;
  final String madeIn;
  final String prod;
  final String price;
  final String priceAfterDiscount;
  final String durationOfDiscount;
  final String availability;

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
          child: Container(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.green[300],
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      prod,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: Colors.white,
                        //
                        // ***
                        // TODO rEVISION
                        //overflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        // letterSpacing: 2,
                        // fontFamily: "Lalezar",
                      ),
                    ),
                  ),
                ),
                myTxt(data: "   التصنيع : $madeIn "),
                myTxt(data: " الخامة : $materials"),
                Expanded(
                  child: Text(
                    " السعر : $price جنيه  ",
                    style: const TextStyle(
                      fontSize: 10,
                      // fontFamily: "Lalezar",
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "بعد الخصم : $priceAfterDiscountجنيه",
                    style: const TextStyle(
                      fontSize: 10,
                      // fontFamily: "Lalezar",
                    ),
                  ),
                ),

                myTxt(data: " مدة الخصم : $durationOfDiscount أيام "),
                myTxt(data: availability),

                // Text(
                //   madeIn,
                //   // textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     //
                //     // ***
                //     // TODO rEVISION
                //     //overflow: TextOverflow.ellipsis,
                //     fontSize: 11,
                //     // letterSpacing: 2,
                //     fontFamily: "Lalezar",
                //   ),
                // ),
                // Text(
                //   madeIn,
                //   // textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     //
                //     // ***
                //     // TODO rEVISION
                //     //overflow: TextOverflow.ellipsis,
                //     fontSize: 11,
                //     // letterSpacing: 2,
                //     fontFamily: "Lalezar",
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class myTxt extends StatelessWidget {
  const myTxt({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        //
        // ***
        // TODO rEVISION
        //overflow: TextOverflow.ellipsis,
        fontSize: 11,
        // letterSpacing: 2,
        // fontFamily: "Lalezar",
      ),
    );
  }
}
