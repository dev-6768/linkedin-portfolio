import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website_for_linkedin/widgets/helper_widgets.dart';

class FirebaseMessage {
  static sendMessage(String message) async {
    await FirebaseFirestore.instance.collection('data').add({"message": message});
    UtilFunctions.flutterToastFunction("Message has been sent.");
  }
}

