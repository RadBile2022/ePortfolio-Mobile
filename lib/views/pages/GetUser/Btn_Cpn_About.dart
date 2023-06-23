import 'package:flutter/material.dart';

class Elevated_Btn_Component_About extends StatelessWidget {
  late final String? _titleButtonString;
  late final VoidCallback? _$onButtonPressed;
  late final IconData? __iconButtonData;
  late final Color? __backgroundButtonColor;
  late final Color? __foregroundButtonColor;

  Elevated_Btn_Component_About(
    this._titleButtonString,
    this._$onButtonPressed,
    this.__iconButtonData,
    this.__backgroundButtonColor,
    this.__foregroundButtonColor,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _$onButtonPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: __backgroundButtonColor,
        foregroundColor: __foregroundButtonColor,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Icon(
        __iconButtonData,
        size: 20.0,
      ),
      label: Text(
        _titleButtonString!,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Outlined_Btn_Component_About extends StatelessWidget {
  late final String? _titleButtonString;
  late final VoidCallback? _$onButtonPressed;
  late final Color? __backgroundButtonColor;
  late final Color? __foregroundButtonColor;

  Outlined_Btn_Component_About(
    this._titleButtonString,
    this._$onButtonPressed,
    this.__backgroundButtonColor,
  );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _$onButtonPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: __backgroundButtonColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Text(
        _titleButtonString!,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    );
  }
}

class Outlined_Btn_Component_Generic extends StatelessWidget {
  late final String? _titleButtonString;
  late final VoidCallback? _$onButtonPressed;
  late final Color? __backgroundButtonColor;
  late final Color? __foregroundButtonColor;

  Outlined_Btn_Component_Generic(
      this._titleButtonString,
      this._$onButtonPressed,
      this.__backgroundButtonColor,
      );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(

      onPressed: _$onButtonPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: __backgroundButtonColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 9.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey[900]!),
        ),
      ),
      child: Text(
        _titleButtonString!,
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 14.0,
        ),
      ),
    );
  }
}

/// plus icon
///  OutlinedButton.icon(
//                   onPressed: () {
//                     // Handle edit button tap
//                   },
//                   icon: Icon(Icons.edit),
//                   label: Text('Edit'),
//                   style: OutlinedButton.styleFrom(
//                     primary: Colors.black,
//                     textStyle: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 12.0,
//                       vertical: 8.0,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       side: BorderSide(color: Colors.grey[300]!),
//                     ),
//                   ),
//                 ),
