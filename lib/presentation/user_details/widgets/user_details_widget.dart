import 'package:flutter/material.dart';
import 'package:alshrouk_academy/data/models/users_model.dart';

TextStyle buildHeaderStyle() {
  return const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
}

Widget buildUserDetailsWidget({UsersModel? usersModel}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://www.iconarchive.com/download/i103501/paomedia/small-n-flat/user-female.1024.png',
          width: double.infinity,
          height: 150,
        ),
        const SizedBox(height: 5),
        Text('Personal Info', style: buildHeaderStyle()),
        const SizedBox(height: 5),
        Text('Email: ${usersModel?.email}'),
        Text('Name: ${usersModel?.name}'),
        Text('Phone: ${usersModel?.phone}'),
        Text('Company: ${usersModel?.company}'),
        Padding(padding: const EdgeInsets.only(top: 30, bottom: 5), child: Text('Address', style: buildHeaderStyle())),
        Text('City: ${usersModel?.address?.city}'),
        Text('GEO: (${usersModel?.address?.geo?.lat} , ${usersModel?.address?.geo?.lng})'),
        Text('Street: ${usersModel?.address?.street}'),
        Text('ZIP Code: ${usersModel?.address?.zipcode}'),
        const SizedBox(height: 30),
        Text('Website:', style: buildHeaderStyle()),
        Text('https://${usersModel?.website}.com'),
        const SizedBox(height: 5),
      ],
    ),
  );
}
