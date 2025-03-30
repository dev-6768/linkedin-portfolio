import 'package:flutter/material.dart';
import 'package:portfolio_website_for_linkedin/firebase/message_sending.dart';
import 'package:portfolio_website_for_linkedin/widgets/helper_widgets.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({super.key});

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: MediaQuery.of(context).size.width*0.8,
    height: MediaQuery.of(context).size.height*0.19,

    child: Container(
    width: MediaQuery.of(context).size.width*0.8,
    height: MediaQuery.of(context).size.height*0.19,
    child: TextField(
      minLines: 5,
      maxLines: null,
      style: const TextStyle(color: Colors.black),
      controller: textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: "Drop a message !",
        prefixIcon: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () {
            print("Chips maang rha hai lagta hai !");
          }
        ),

        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async { 
            if(textEditingController.text == "") {
              UtilFunctions.flutterToastFunction("Enter some text to send");
            }
            else {
              await FirebaseMessage.sendMessage(textEditingController.text);  
            }
            
          }
        ),
      ),
    ),
    ),
    );
  }
}