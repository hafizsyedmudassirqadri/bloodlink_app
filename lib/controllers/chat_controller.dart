import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  // message Controller
  final messageController = TextEditingController();

  // Store Message in List
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[
{"message": "Assalamu alikum", "time": DateTime.now(), "isMe": false}

  ].obs;

  // message send Method

  void sendMessage() {
    String text = messageController.text.trim();

    if (text.isEmpty) {
      return;
    }

    messages.add({"message": text, "time": DateTime.now(), "isMe": true});

    messageController.clear();
  }

  void resetList() {
    messages.clear();
  }
}
