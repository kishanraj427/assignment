import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendMessage() async {

  String targetDeviceToken =
      'cpVBjESVQmS9ernPX32Dol:APA91bHuZScVosQlPJ1e65ZD2njll1Uw59VHqCV39VMFGym8-8PnMWLTqyVloXNhrk5TMFIVw26zFkCTryPxEQWEepiDVk9vsv9Sx9MBu63wLYcscQdR5WJOobWBIh8RYj8RvJvXbXFv';

  // Replace 'your_server_key_here' with your Firebase project's server key
  String serverKey =
      'AAAAYy97Dz4:APA91bGWKHFzPnxeD34U0FPoyKiLkk22KERcsY14zzqQ94swY5TCHocmBt5dM_QftKQISAipLzu6r7jsV2IqXcFHAAMLyEscYhc-tvn8cTvnO7ythSCO9FbS8NTkq1295AH6aavoJd-L';

  // Construct the FCM message
  Map<String, dynamic> message = {
    'to': targetDeviceToken,
    'notification': {
      'title': 'Flutter FCM Example', 
      'body': 'This is a test notification from Flutter!',
    },
    "data": {
      "key1": "value1",
      "key2": "value2"
    }
  };

  Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  http.post(url, headers: headers, body: jsonEncode(message)).then((response) {
    print('FCM message sent successfully');
    print('Response: ${response.body}');
  }).catchError((error) {
    print('Error sending FCM message: $error');
  });
}
