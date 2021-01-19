class User {
  final String name;
  final String lastName;
  final int age;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const User({
    this.name,
    this.lastName,
    this.age,
  });

  User copyWith({
    String name,
    String lastName,
    int age,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (lastName == null || identical(lastName, this.lastName)) &&
        (age == null || identical(age, this.age))) {
      return this;
    }

    return User(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          lastName == other.lastName &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ lastName.hashCode ^ age.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastName': lastName,
      'age': age,
    };
  }

//</editor-fold>

}
