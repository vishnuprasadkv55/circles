import 'package:circles/models/user_model.dart';

class MessageModel {
  final UserModel sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  MessageModel({this.sender, this.isLiked, this.text, this.time, this.unread});
}

//current user
final UserModel currentUser = UserModel(
    id: 0,
    name: 'current user',
    imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60');
final UserModel sophia = UserModel(
    id: 1,
    name: 'Sophia',
    imageUrl: 'https://images.unsplash.com/photo-1519742866993-66d3cfef4bbd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60');
final UserModel stephen = UserModel(
    id: 2,
    name: 'Stephen',
    imageUrl: 'https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60');
final UserModel george = UserModel(
  id: 3,
  name: 'George',
  imageUrl: 'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
);
final UserModel julia = UserModel(
  id: 4,
  name: 'Julia',
  imageUrl: 'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
);
final UserModel peter = UserModel(
  id: 5,
  name: 'Peter',
  imageUrl: 'https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=515&q=80',
);
final UserModel emily = UserModel(
  id: 5,
  name: 'Emily',
  imageUrl: 'https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
);
final UserModel marina = UserModel(
  id: 6,
  name: 'Marina',
  imageUrl: 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
);
final UserModel olivia = UserModel(
  id: 7,
  name: 'Olivia',
  imageUrl: 'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
);

List<UserModel> favourites = [marina, stephen, emily, julia, olivia];
// EXAMPLE CHATS ON HOME SCREEN
List<MessageModel> chats = [
  MessageModel(
    sender: marina,
    time: '5:30 PM',
    text: 'Find conversation mockup stock images in HD and millions of other royalty-free stock photos, illustrations and vectors in the Shutterstock collection.',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: olivia,
    time: '4:30 PM',
    text: 'Design your next chatbot. or voice experience. Design for any platform. Botsociety allows you to design conversations for any platform',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: emily,
    time: '3:30 PM',
    text: 'This is a premium icon which is suitable for commercial work: Use it commercially. No attribution required',
    isLiked: false,
    unread: false,
  ),
  MessageModel(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: julia,
    time: '1:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: false,
  ),
  MessageModel(
    sender: peter,
    time: '12:30 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: false,
  ),
  MessageModel(
    sender: george,
    time: '11:30 AM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<MessageModel> messages = [
  MessageModel(
    sender: marina,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  MessageModel(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: marina,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: marina,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  MessageModel(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  MessageModel(
    sender: marina,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];