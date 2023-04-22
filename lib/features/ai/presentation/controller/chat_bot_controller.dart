import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/dependency_injection/locator.dart';

class ChatBotViewController extends ChangeNotifier {
  // final ChatBotRepository _chatBotRepository;

  ChatBotViewController();
  //   required ChatBotRepository chatRepository,
  // }) : _chatBotRepository = _chatBotRepository;

  bool _waitingMessage = false;
  get waitingMessage => _waitingMessage;

  final List<String> _messages = [];
  get messages => _messages;

  late String response;

  void sendMessage(controller) {
    if (controller.text.isNotEmpty) {
      messages.add(controller.text);
      controller.clear();
      _waitingMessage = true;

      //mock
      notifyListeners();
      sendResponse();
    }
  }

  void sendResponse() {
    response = 'soy una respuesta';
    messages.add(response);
    _waitingMessage = false;
    notifyListeners();
  }
}

final chatBotProvider =
    ChangeNotifierProvider((ref) => ChatBotViewController());
    //   chatRepository: locator<ChatBotRepository>(),
    // ));
