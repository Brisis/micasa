import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/messages/inbox_message_page.dart';
import 'package:micasa/pages/messages/model/chat_user.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const InboxTopSection(),
          verticalSpace(height: 15),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: kWhiteColor,
                contentPadding: EdgeInsets.all(8),
                focusedBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(),
          const InboxItemsSection(),
        ],
      ),
    );
  }
}

class InboxTopSection extends StatelessWidget {
  const InboxTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Inbox",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kChipColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: kWhiteColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kChipColor,
            thickness: 1,
          ),
          verticalSpace(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "All Messages (3)",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: kBigTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(height: 30),
        ],
      ),
    );
  }
}

class InboxItemsSection extends StatefulWidget {
  const InboxItemsSection({super.key});

  @override
  State<InboxItemsSection> createState() => _InboxItemsSectionState();
}

class _InboxItemsSectionState extends State<InboxItemsSection> {
  List<ChatUser> chatUsers = [
    ChatUser(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "assets/images/users/3.jpeg",
      time: "Now",
    ),
    ChatUser(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "assets/images/users/2.jpg",
      time: "Yesterday",
    ),
    ChatUser(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "assets/images/users/1.jpg",
      time: "31 Mar",
    ),
    ChatUser(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "assets/images/users/3.jpeg",
      time: "28 Mar",
    ),
    ChatUser(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "assets/images/users/2.jpg",
      time: "23 Mar",
    ),
    ChatUser(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "assets/images/users/1.jpg",
      time: "17 Mar",
    ),
    ChatUser(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      imageURL: "assets/images/users/3.jpeg",
      time: "24 Feb",
    ),
    ChatUser(
      name: "John Wick",
      messageText: "How are you?",
      imageURL: "assets/images/users/2.jpg",
      time: "18 Feb",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InboxItem(
              name: chatUsers[index].name,
              messageText: chatUsers[index].messageText,
              imageUrl: chatUsers[index].imageURL,
              time: chatUsers[index].time,
              isMessageRead: (index == 0 || index == 3) ? true : false,
            );
          },
        ),
      ),
    );
  }
}

class InboxItem extends StatelessWidget {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;

  InboxItem({
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(routeTransition(const InboxMessagePage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kWhiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                backgroundImage: AssetImage(imageUrl),
                maxRadius: 20,
                // child:  Center(
                //   child: Icon(
                //     Icons.support_agent,
                //     size: kIconSize,
                //     color: kWhiteColor,
                //   ),
                // ),
              ),
              horizontalSpace(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: kMediumTextSize,
                        color: kBlackColor,
                        fontWeight:
                            isMessageRead ? FontWeight.bold : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(),
                    Text(
                      messageText,
                      style: TextStyle(
                        fontSize: kMediumTextSize,
                        color: kBlackColor,
                        fontWeight:
                            isMessageRead ? FontWeight.bold : FontWeight.normal,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              horizontalSpace(),
              Text(
                time,
                style: TextStyle(
                  fontSize: kNormalTextSize,
                  color: kBlackColor,
                  fontWeight:
                      isMessageRead ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
