import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:flutter/material.dart';

class ContainerButtonProfile extends StatelessWidget {
  final String text;
  final VoidCallback $addOnPressed;

  const ContainerButtonProfile({
    super.key,
    required this.text,
    required this.$addOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: CardWidgetX(
        widget: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: ProfileElevatedButton(
            text: text,
            $addOnPressed: $addOnPressed,
          ),
        ),
      ),
    );
  }
}
