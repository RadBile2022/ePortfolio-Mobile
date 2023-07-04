import 'package:flutter/material.dart';

class MoreHorizIcon24 extends StatelessWidget {
final Function (String) $onTapMoreHoriz;


  const MoreHorizIcon24({super.key, required this.$onTapMoreHoriz});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.more_horiz,
      ),
      onTap:$onTapMoreHoriz ,
    ) ;
  }
}
