import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:problems_and_solutions_examples/features/user/domain/bloc/user_bloc.dart';
import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';

class UserPage extends StatelessWidget {
  UserPage({Key key, this.title}) : super(key: key);
  final String title;

  void _fetchData() {
    Get.find<UserBloc>().add(UserFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        cubit: Get.find<UserBloc>(),
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserSuccess) {
            final List<User> _users = state.users;
            return ListView.builder(
              itemCount: _users.length,
              itemBuilder: (_, index) {
                final User _user = _users[index];
                return ListTile(
                  leading: Text(_user.age.toString()),
                  title: Text(_user.name),
                  subtitle: Text(_user.lastName),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        tooltip: 'Download',
        child: Icon(Icons.download_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
