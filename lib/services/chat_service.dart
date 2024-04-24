import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onechat/models/message.dart';

class ChatServices{

  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;

  Stream<List<Map<String,dynamic>>>getUsersStream(){
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc){
        final user =doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMsg(String receiverID, msg) async{
    final String currentUserID=firebaseAuth.currentUser!.uid;
    final String currentUserEmail=firebaseAuth.currentUser!.email!;
    final Timestamp timestamp=Timestamp.now();

    Message newMsg=Message(senderEmail: currentUserEmail, senderID: currentUserID, recieverID: receiverID, msg: msg, time: timestamp);
    List<String> ids=[currentUserID,receiverID];
    ids.sort();
    String chatRoomID =ids.join('_');

    await firestore.collection("chat_rooms").doc(chatRoomID).collection("msg").add(newMsg.toMap());
  }

  Stream<QuerySnapshot> getMsg(String userID,otherUserID){
    List<String> ids=[userID,otherUserID];
    ids.sort();
    String chatRoomID=ids.join('_');

    return firestore.collection("chat_rooms")
        .doc(chatRoomID).collection("msg")
        .orderBy("time",descending: false)
        .snapshots();
  }
}
