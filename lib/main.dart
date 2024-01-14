import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alshrouk_academy/presentation/users/screens/users_screen.dart';
import 'package:alshrouk_academy/services/remote/api_helper/dio_helper.dart';
import 'package:alshrouk_academy/shared/const/app_consts.dart';

import 'business_logic/cubit/users_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersCubit>(create: (context) => UsersCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: AppConstants.fontFamily),
        debugShowCheckedModeBanner: false,
        title: 'Alshrouk Task',
        home: const AllUsersScreen(),
      ),
    );
  }
}
