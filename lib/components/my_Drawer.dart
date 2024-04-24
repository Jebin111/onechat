import 'package:flutter/material.dart';
import '../auth/authservice.dart';
import '../pages/settings_page.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final auth =AuthService();
    auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    Color textColour =Theme.of(context).colorScheme.inversePrimary;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Column(
          children: [
            DrawerHeader(child: Center(
              child: Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            )),
            Padding(padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("HOME",style: TextStyle(color: textColour),),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),),Padding(padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                title: Text("SETTINGS",style: TextStyle(color: textColour)),
                leading: const Icon(Icons.settings),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
                },
              ),),Padding(padding: const EdgeInsets.only(left: 25,bottom: 25),
              child: ListTile(
                title: Text("LOGOUT",style: TextStyle(color: textColour)),
                leading: const Icon(Icons.logout),
                onTap: logout,
              ),),
          ],
        )],
      ),
    );
  }
}
