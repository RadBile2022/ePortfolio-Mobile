import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomeMarkdown extends StatelessWidget {
  final String desc;
  final VoidCallback $onButtonMore;

  const HomeMarkdown({
    super.key,
    required this.desc,
    required this.$onButtonMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Markdown(
          shrinkWrap: true,
          selectable: true,
          data: desc.toString().length <= 180
              ? desc
              : '${desc.toString().substring(0, 180)}.....',
          physics: const NeverScrollableScrollPhysics(),
        ),
        Container(
          alignment: Alignment.topRight,
          child: TextButtonWidget($onButtonMore: $onButtonMore),
        )
      ],
    );
  }
}


