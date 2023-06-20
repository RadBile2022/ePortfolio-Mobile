import 'package:flutter/material.dart';

class Card_Component_AboutMe extends StatelessWidget {
  late final String? _titleCardString;
  late final VoidCallback _$tapCardGesture;
  late final Widget? __descCardWidget;

  Card_Component_AboutMe(
    this._titleCardString,
    this._$tapCardGesture,
    this.__descCardWidget,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _titleCardString!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              GestureDetector(
                onTap: _$tapCardGesture,
                child: Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: __descCardWidget),
        ],
      ),
    );
  }
}
