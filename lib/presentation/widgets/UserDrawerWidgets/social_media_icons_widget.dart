import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_icon_widget.dart';

class BuildSocialMediaIcons extends StatelessWidget {
  const BuildSocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(start: 16.0),
      child: Row(
        children: [
          CustomIcon(
            icon: FontAwesomeIcons.facebook,
            url: 'https://www.facebook.com/groups/omarahmedx14',
          ),
          SizedBox(
            width: 15,
          ),
          CustomIcon(
            icon: FontAwesomeIcons.youtube,
            url: 'https://www.youtube.com/c/OmarAhmedx14/videos',
          ),
          SizedBox(
            width: 20,
          ),
          CustomIcon(
            icon: FontAwesomeIcons.telegram,
            url: 'https://t.me/OmarX14',
          ),
        ],
      ),
    );
  }
}
