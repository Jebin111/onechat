import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderID, senderEmail,recieverID,msg;
  final Timestamp time;

  Message({
    required this.senderEmail,
    required this.senderID,
    required this.recieverID,
    required this.msg,
    required this.time,
});

  Map<String,dynamic> toMap(){
    return{
      'senderID':senderID,
      'senderEmail':senderEmail,
      'receiverID':recieverID,
      'msg':msg,
      'time':time
    };
  }

}