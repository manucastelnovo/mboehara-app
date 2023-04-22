// import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// class ChatBotView extends HookConsumerWidget{
//   const ChatBotView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

import 'package:flutter/material.dart';
import 'package:puae_app/features/ai/presentation/controller/chat_bot_controller.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = TextEditingController();
    final chatBotController = ref.watch(chatBotProvider);
    final waitingMessage = chatBotController.waitingMessage;
    final List<String> _messages = chatBotController.messages;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          color: Colors.blue,
                          child: Text(
                            _messages[index],
                            textAlign: TextAlign.center,
                          )),
                    ],
                  )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enviar mensaje...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => chatBotController.sendMessage(_controller),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
