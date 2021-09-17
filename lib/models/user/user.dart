enum UserType {
  PARTICULAR,
  PROFESSIONAL,
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  UserType? type;
  DateTime? createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt}';
  }
}
