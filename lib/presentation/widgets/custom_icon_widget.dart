import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.url, required this.icon});
  final String url;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url: url),
      child: Icon(
        icon,
        color: Colors.blue,
        size: 35,
      ),
    );
  }
}

void _launchUrl({required String url}) async {
  await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';
}
