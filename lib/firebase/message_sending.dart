import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website_for_linkedin/widgets/helper_widgets.dart';

class FirebaseMessage {
  static sendMessage(String message) async {
    try {
      final deviceInfo = await UtilFunctions.getDeviceDetails();
      final deviceLocation = await UtilFunctions.getCurrentLocation();
      final deviceCoordinates = 'Latitude: ${deviceLocation.latitude}, Longitude: ${deviceLocation.longitude}';
      await FirebaseFirestore.instance.collection('data').add({
        "message": message,
        "date": DateTime.now(),
        "deviceInfo": deviceInfo,
        "userLocation": deviceCoordinates,
      });
      UtilFunctions.flutterToastFunction("Message has been sent.");
    }

    catch(err) {
      UtilFunctions.flutterToastFunction("Failed to send message. : $err");
    }
    
  }
}

