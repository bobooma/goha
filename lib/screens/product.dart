import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:url_launcher/url_launcher.dart';

class ProdImage extends StatefulWidget {
  ProdImage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  State<ProdImage> createState() => _ProdImageState();
}

class _ProdImageState extends State<ProdImage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller!.forward();
    controller.addListener(() {
      
    })
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const phoneNum = "201208272300";
    final message = "مطلوب ${widget.imgUrl}";
    // final url = "https://wa.me/$phoneNum/?text=$message";
    final url2 = "https://api.whatsapp.com/send?phone=$phoneNum";

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.green[300],
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(
                    widget.imgUrl,
                  ),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 50,
                  left: MediaQuery.of(context).size.width / 10,
                  right: MediaQuery.of(context).size.width / 10,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      //** */  indirect
                      //a launch("tel://$phoneNum");

                      // ** */   direct
                      try {
                        await FlutterPhoneDirectCaller.callNumber(phoneNum);
                      } on Exception catch (e) {
                        // TODO
                      }
                    },
                    icon: const Icon(Icons.call),
                    label: Text("  اطلبه الآن فون  "),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        //** */  indirect

                        await launch(url2);
                      },
                      icon: const Icon(Icons.call),
                      label: Text(" اطلبه الآن واتس آب "),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
