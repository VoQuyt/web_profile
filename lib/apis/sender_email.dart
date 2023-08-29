import 'package:flutter/material.dart';
import 'package:web_profile/helper/httpclient/domain.dart';
import 'package:web_profile/helper/httpclient/http_client.dart';

class Apis {
  static Future<Map<String, dynamic>> senderEmail(String body) async {
    try {
      String bodyRoute = "?format=json&api_key=${Domain.keyEmail}&$body";
      var res = await HttpClient(
              url: 'https://api.selzy.com/en/api/sendEmail$bodyRoute',
              route: '')
          .get();
      return res!.data;
    } catch (e) {
      debugPrint("senderEmail error $e");
      return {"data": "senderEmail Error"};
    }
  }
}
