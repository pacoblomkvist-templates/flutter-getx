import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  const UrlText({Key? key, required this.text, required this.url, this.style})
      : super(key: key);

  final String text;
  final String url;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(
        textAlign: TextAlign.left,
        text,
        style: style ??
            const TextStyle(
                decoration: TextDecoration.underline, color: Colors.blue),
      ),
    );
  }
}
