import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {

  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser?Colors.green:Colors.grey.shade600,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 2.5,horizontal: 25),
        child: Text(message,style: const TextStyle(
          color: Colors.white,fontSize: 17
        ),),
      ),
    );
  }
}
