import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';
import 'package:problems_and_solutions_examples/features/user/domain/repositories/user_repository.dart';

class ApiUserRepository extends UserRepository {
  @override
  Future<List<User>> fetchUsers() {
    // TODO: implement fetchUsers
    throw UnimplementedError();
  }
}
