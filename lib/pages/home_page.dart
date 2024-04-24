import 'package:flutter/material.dart';
import 'package:onechat/auth/authservice.dart';
import 'package:onechat/components/my_Drawer.dart';
import 'package:onechat/components/user_tile.dart';
import 'package:onechat/services/chat_service.dart';

import 'chat_page.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatServices chatServices=ChatServices();
  final AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        foregroundColor: Colors.grey.shade100,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: buildUserList(),
    );
  }


  Widget buildUserList(){
    return StreamBuilder(stream: chatServices.getUsersStream(), builder: (context,snapshot){
      if(snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView(
        children: snapshot.data!.map<Widget>((userData)=>buildUserListItem(userData,context)).toList(),
      );
    });
  }


  Widget buildUserListItem(Map<String,dynamic> userData,BuildContext context){

    if(userData["email"]!=authService.getCurrentUser()!.email){
      return UserTile(name: userData["name"],email: userData["email"],
          onTap:(){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ChatPage(
                  receiverEmail: userData["email"],receiverID: userData["uid"],)));
          }
          );
    }
    else{
      return Container();
    }
  }

}
