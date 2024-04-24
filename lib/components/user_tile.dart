import 'package:flutter/material.dart';
class UserTile extends StatelessWidget {

  final String name,email;
  final void Function()?onTap;

  const UserTile({super.key,
    required this.name,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
       child: Container(
         decoration: BoxDecoration(
             border: Border(bottom: BorderSide(
               color: Theme.of(context).colorScheme.inversePrimary
             ))
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(Icons.person,size: 65),
            Padding(padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(fontSize: 25,
                        color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(email,style: TextStyle(fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ]
              ),
            )

          ],
        ),
      ),
    );
  }
}
