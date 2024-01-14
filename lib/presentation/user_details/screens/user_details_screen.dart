import 'package:flutter/material.dart';
import 'package:alshrouk_academy/data/models/users_model.dart';

import '../widgets/user_details_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.usersModel});

  final UsersModel? usersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User details',
            style: buildHeaderStyle().copyWith(color: Colors.black)),
        centerTitle: true,
      ),
      body: buildUserDetailsWidget(usersModel: usersModel),
    );
  }
}
