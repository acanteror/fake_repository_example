import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}
