import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';
import 'package:problems_and_solutions_examples/features/user/domain/repositories/user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future<List<User>> fetchUsers() async {
    Future.delayed(const Duration(seconds: 2));
    return [tUser1, tUser2, tUser3];
  }
}

final User tUser1 = User(name: 'name1', lastName: 'lastName1', age: 10);
final User tUser2 = User(name: 'name2', lastName: 'lastName2', age: 11);
final User tUser3 = User(name: 'name3', lastName: 'lastName3', age: 12);
