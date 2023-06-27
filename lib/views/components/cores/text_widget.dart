import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String data;

  const TitleWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final String data;

  const SubTitleWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(fontSize: 12.0),
    );
  }
}

class TitleRichWidget extends StatelessWidget {
  final String boldText;
  final String regularText;

  const TitleRichWidget({
    super.key,
    required this.boldText,
    required this.regularText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        children: <TextSpan>[
          TextSpan(
            text: boldText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: regularText,
          ),
        ],
      ),
    );
  }
}
