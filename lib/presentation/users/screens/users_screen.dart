import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alshrouk_academy/business_logic/cubit/users_cubit.dart';
import 'package:alshrouk_academy/business_logic/cubit/users_cubit_state.dart';
import 'package:alshrouk_academy/presentation/users/widgets/user_card.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  late UsersCubit usersCubit;

  @override
  void initState() {
    super.initState();
    usersCubit = context.read<UsersCubit>();
    usersCubit.getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All users",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocConsumer<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersDone) {
            return RefreshIndicator(
              onRefresh: () async {
                usersCubit.getUsersData();
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return UserCard(state.usersModel?[index]);
                },
                itemCount: state.usersModel?.length,
                shrinkWrap: true,
              ),
            );
          } else if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return const SizedBox.shrink();
        },
        listener: (context, state) {
          if (state is UsersError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Error in fetching data")));
          }
        },
      ),
    );
  }
}
