import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';
import 'package:problems_and_solutions_examples/features/user/domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository _userRepository;
  UserBloc({UserRepository userRepository})
      : _userRepository = userRepository ?? Get.find<UserRepository>(),
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserFetch) {
      yield UserLoading();
      yield* _fetchToState();
    }

    if (event is UserClear) {
      yield const UserInitial();
    }
  }

  Stream<UserState> _fetchToState() async* {
    try {
      final List<User> _userList = await _userRepository.fetchUsers();
      yield UserSuccess(users: _userList);
    } catch (e) {
      yield UserError();
    }
  }
}
