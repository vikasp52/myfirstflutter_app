class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final String previous_time;

  ChatModel(this.name, this.message, this.time, this.avatarUrl, this.previous_time);
}
  List<ChatModel> dummydata = [
    new ChatModel(
        "Vikas",
        "Hay, this is Vikas!",
        "10:30 AM",
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        "48 minutes ago"
    ),

    new ChatModel(
        "Amit",
        "Hay, this is Vikas!",
        "14:30 PM",
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        "Yesterday, 9:22 PM"
    ),

    new ChatModel(
        "Rahul",
        "Hay, this is Vikas!",
        "5:30 PM",
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        "Today 4:22 PM"
    ),

    new ChatModel(
        "Ashish",
        "Hay, this is Vikas!",
        "23:30 AM",
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        "Today 4:22 PM"
    ),

    new ChatModel(
        "Saurabh",
        "Hay, this is Vikas!",
        "45:30 PM",
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        "Today 5:42 PM"

    ),
  ];
