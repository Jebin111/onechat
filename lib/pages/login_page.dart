import 'package:flutter/material.dart';
import 'package:onechat/auth/authservice.dart';
import 'package:onechat/components/my_button.dart';
import 'package:onechat/components/my_textfield.dart';

class LoginPage extends StatelessWidget{

  final TextEditingController email =TextEditingController();
  final TextEditingController password =TextEditingController();

  final void Function()?onTap;

  LoginPage({super.key,required this.onTap});

  void login(BuildContext context) async{
    final authService =AuthService();
    if(email.text.isNotEmpty&&password.text.isNotEmpty) {
      try {
        await authService.signInWithEmailPassword(
            context, email.text, password.text);
      }
      catch (e) {
        showDialog(context: context, builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ));
      }
    }
    else{
      showDialog(context: context, builder: (context)=>const AlertDialog(
        title: Text("Fill all inputs"),
      ));
    }
  }

  @override
  Widget build(BuildContext context){
    Color primary=Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,size: 60,color: primary),
            const SizedBox(height: 50,),
            Text(
              "Let's get Started",style: TextStyle(
              color: primary,
              fontSize: 25,
            ),
            ),
            const SizedBox(height: 25,),
            MyTextField(hintText: "Email",obscureText: false,controller: email,focusNode: null,),

            const SizedBox(height: 10,),
            MyTextField(hintText: "Password",obscureText: true,controller: password,focusNode: null,),

            const SizedBox(height: 25),
            MyButton(text: "Login", onTap: ()=>login(context)),

            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Don't have an account? ",style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15
                  ),),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text("Register Now",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 15
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}