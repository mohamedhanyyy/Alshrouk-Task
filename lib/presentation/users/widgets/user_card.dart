import 'package:flutter/material.dart';
import 'package:alshrouk_academy/data/models/users_model.dart';

import '../../../services/navigation/navigation.dart';
import '../../user_details/screens/user_details_screen.dart';


class UserCard extends StatelessWidget{

  final UsersModel? user;

  const UserCard(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
   return  InkWell(
     onTap: (){

     AppNavigation.navigate(
         context: context,
         page: UserDetailsScreen(usersModel: user!));


     },
     child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              title: Text('${user?.name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text('${user?.email}'),
              leading:
              const Icon(Icons.person, color: Colors.red),
            ),
          ],
        ),
      ),
   );
  }
}