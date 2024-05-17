import 'package:flutter/material.dart';
import 'animated_widget.dart';

class TextWidget extends StatefulWidget {
  final String textString;
  final String? fontString;
  final double fontSize;
  TextWidget(this.textString, this.fontString, this.fontSize);

  @override
  State<TextWidget> createState() => _TextWidgetState(textString, fontString, fontSize);  
}

class _TextWidgetState extends State<TextWidget> {
  final String textString;
  final String? fontString;
  final double? fontSize;

  _TextWidgetState(this.textString, this.fontString, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width*0.8,
    height: MediaQuery.of(context).size.height*0.11,
    child: Center(
    
    child: Text(
        textString,
        style: TextStyle(
          fontFamily: fontString,
          fontSize: fontSize,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
      ),
    ),
    );
  }

}

class TextContainerWidget extends StatefulWidget {
  final textContainerText;
  TextContainerWidget(this.textContainerText);

  @override
  State<TextContainerWidget> createState() => _TextContainerWidgetState(textContainerText);
}

class _TextContainerWidgetState extends State<TextContainerWidget> {
  final String textContainerText;
  _TextContainerWidgetState(this.textContainerText);
  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.11,
            color: Colors.red.withOpacity(0),
            child: AnimatedTextWidget(
            textContainerText,
          ),  
        );
  }
}
