import 'package:get/get.dart';
import 'package:problems_and_solutions_examples/features/user/domain/bloc/user_bloc.dart';
import 'package:problems_and_solutions_examples/features/user/domain/repositories/user_repository.dart';
import 'package:problems_and_solutions_examples/features/user/infraestructure/repositories/fake_user_repository.dart';

void initDI() {
  Get.put<UserRepository>(FakeUserRepository());
  Get.put<UserBloc>(UserBloc());
}
