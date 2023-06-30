import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';

class InboxMessagePage extends StatefulWidget {
  const InboxMessagePage({super.key});

  @override
  State<InboxMessagePage> createState() => _InboxMessagePageState();
}

class _InboxMessagePageState extends State<InboxMessagePage> {
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "Hello, Will",
      messageType: "receiver",
    ),
    ChatMessage(
      messageContent: "How have you been?",
      messageType: "receiver",
    ),
    ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender",
    ),
    ChatMessage(
      messageContent: "ehhhh, doing OK.",
      messageType: "receiver",
    ),
    ChatMessage(
      messageContent: "Is there any thing wrong?",
      messageType: "sender",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                horizontalSpace(width: 2),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/5.jpg",
                  ),
                  maxRadius: 20,
                ),
                horizontalSpace(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Kriss Benwat",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      verticalSpace(height: 6),
                      const Text(
                        "Online",
                        style: TextStyle(
                          color: kSuccessColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    size: kIconLargeSize,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? const Color.fromARGB(159, 224, 224, 224)
                          : Color.fromARGB(116, 144, 202, 249)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.attach_file,
                        color: Colors.white,
                        size: kIconSize,
                      ),
                    ),
                  ),
                  horizontalSpace(width: 15),
                  const Expanded(
                    child: TextField(
                      // textInputAction: TextInputAction.newline,
                      // maxLines: null,
                      // expands: true,
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  horizontalSpace(width: 15),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: kIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}
