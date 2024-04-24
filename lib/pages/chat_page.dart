import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onechat/auth/authservice.dart';
import 'package:onechat/components/chat_bubble.dart';
import 'package:onechat/components/my_textfield.dart';
import 'package:onechat/services/chat_service.dart';
class ChatPage extends StatefulWidget {

  final String receiverEmail,receiverID;

  const ChatPage({super.key,required this.receiverEmail,required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController msg=TextEditingController();
  final ChatServices chatServices=ChatServices();
  final AuthService authService=AuthService();
  final ScrollController scrollController=ScrollController();

  FocusNode focusNode=FocusNode();

  @override
  void initState(){
    super.initState();

    focusNode.addListener(() {
      if(focusNode.hasFocus){
        Future.delayed(
          const Duration(milliseconds: 500),()=>scrollDown()
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 500),
        ()=>scrollDown());
  }

  @override
  void dispose(){
    focusNode.dispose();
    msg.dispose();
    super.dispose();
  }

  void scrollDown(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  void sendMsg() async{
    if(msg.text.isNotEmpty){
      await chatServices.sendMsg(widget.receiverID, msg.text.toString().trim());
      msg.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverEmail),
        foregroundColor: Colors.grey.shade100,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: buildMsgList()),
          buildUserInput(),
        ],
      ),
    );
  }

  Widget buildMsgList(){
    String senderId= authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatServices.getMsg(widget.receiverID, senderId),
        builder: (context,snapshot){
      if(snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView(
        controller: scrollController,
        children: snapshot.data!.docs.map((doc) => buildMsgItem(doc)).toList(),
      );
        });
  }

  Widget buildMsgItem(DocumentSnapshot doc){
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
    bool isCurrentUser=data['senderID']==authService.getCurrentUser()!.uid;
    var alignment =isCurrentUser? Alignment.centerRight:Alignment.centerLeft;
    return Container(
      alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser?CrossAxisAlignment.end: CrossAxisAlignment.start,
            children:[
              ChatBubble(isCurrentUser: isCurrentUser,
                message: data["msg"],
              )
            ]));
  }

  Widget buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(child: MyTextField(
            controller: msg,
            hintText: "Type a message...",
            obscureText: false,
            focusNode: focusNode,
          )),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
              margin: const EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: sendMsg, icon: const Icon(
                  Icons.arrow_upward,
              color: Colors.white
              )))
        ],
      ),
    );
  }
}
