import 'package:flutter/material.dart';
import 'package:onechat/auth/authservice.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController email =TextEditingController();
  final TextEditingController password =TextEditingController();
  final TextEditingController confirmPassword =TextEditingController();
  final TextEditingController name =TextEditingController();

  final void Function()?onTap;

  RegisterPage({super.key,required this.onTap});

  void register(BuildContext context) async{
    final auth=AuthService();
    if(password.text==confirmPassword.text){
      if(email.text.isNotEmpty&&name.text.isNotEmpty&&password.text.isNotEmpty) {
        try {
          auth.signUpWithEmailPassword(
              context, name.text, password.text, email.text);
          //auth.registerInHomePage();
        }
        on Exception catch (e) {
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
    else{
      showDialog(context: context, builder: (context)=>const AlertDialog(
        title: Text("Password not matching"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    Color primary=Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icon(Icons.message,size: 60,color: primary),
                const SizedBox(height: 50,),
                Text(
                  "Let's create an account",style: TextStyle(
                  color: primary,
                  fontSize: 20,
                ),
                ),
                const SizedBox(height: 25),
                MyTextField(hintText: "Name",obscureText: false,controller: name,focusNode: null,),
                const SizedBox(height: 15),
                MyTextField(hintText: "Email",obscureText: false,controller: email,focusNode: null,),
                const SizedBox(height: 10),
                MyTextField(hintText: "Password",obscureText: true,controller: password,focusNode: null,),
                const SizedBox(height: 10),
                MyTextField(hintText: "Confirm Password",obscureText: true,controller: confirmPassword,focusNode: null,),
                const SizedBox(height: 25),

                MyButton(text: "Register", onTap: ()=>register(context)),
                const SizedBox(height: 25),
                Padding(padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Text("Already have an account? ",style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        fontSize: 15
                      ),),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text("Login Now",style: TextStyle(
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
        ),
      ),
    );
  }
}
