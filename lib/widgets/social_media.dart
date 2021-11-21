import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

enum Social { facebook, twitter, email, linkedin, whatsapp }

class SocialMedia extends StatelessWidget {
  final String link;
  final Axis axis;

  const SocialMedia({
    Key? key,
    required this.link,
    required this.axis,
  }) : super(key: key);

// ****
  Future<void> share(Social platform) async {
    const subject = " share everywhere  myQuotes";
    const txt = " share everywhere ";
    final urlShare = Uri.encodeComponent(link);
    final urls = {
      Social.facebook:
          "https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$txt",
      Social.twitter:
          "https://www.twitter.com/intent/tweet?url=$urlShare&t=$txt",
      Social.email: "mailto:?subject=$subject&body=$txt\n\n$urlShare",
      Social.linkedin:
          "https://www.linkedin.com/shareArticle?mini=true&url=$urlShare",
      Social.whatsapp: "https://www.api.whatsapp.com/send?text=$txt$urlShare",
    };
    final url = urls[platform]!;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    axis;

    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'شارك التطبيق من فضلك ',
            style: TextStyle(
              // fontFamily: "Rubik",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            FontAwesomeIcons.facebookSquare,
            color: facebookColor,
            size: 40,
          ),
          // SizedBox(
          //   width: 10,
          // ),

          Icon(FontAwesomeIcons.whatsapp, color: whatsappColor, size: 40),
          SizedBox(
            width: 10,
          ),
          Icon(FontAwesomeIcons.arrowCircleRight,
              color: Colors.green, size: 30),

          // socialBtn(

          //     onclicked: () => share(Social.facebook)),
          // const SizedBox(
          //   width: 5,
          // ),
          // socialBtn(
          //     icon: FontAwesomeIcons.twitter,
          //     color: twittetColor,
          //     onclicked: () => share(Social.twitter)),
          // const SizedBox(
          //   width: 5,
          // ),
          // socialBtn(
          //     icon: Icons.mail,
          //     color: mailColor,
          //     onclicked: () => share(Social.email)),
          // const SizedBox(
          //   width: 5,
          // ),
          // socialBtn(
          //     icon: FontAwesomeIcons.linkedinIn,
          //     color: linkedinColor,
          //     onclicked: () => share(Social.linkedin)),
          // const SizedBox(
          //   width: 5,
          // ),
          // socialBtn(
          //     icon: FontAwesomeIcons.whatsapp,
          //     color: whatsappColor,
          //     onclicked: () => share(Social.whatsapp))
        ],
      ),
    );
  }
}

Widget socialBtn({
  required IconData icon,
  required Color color,
  required VoidCallback onclicked,
}) =>
    Expanded(
      child: InkWell(
        child: Center(
          child: FaIcon(
            icon,
            color: color,
            size: 40,
          ),
        ),
        onTap: onclicked,
      ),
    );
