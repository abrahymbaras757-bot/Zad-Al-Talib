enum UserRole { student, teacher, admin }

class UserModel {
  final String id;
  final String? image;
  final String name;
  final String password;
  final UserRole role;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    required this.password,
    this.image,
    required this.isActive,
  });

  UserModel copyWith({
    String? name,
    String? password,
    UserRole? role,
    String? image,
    bool? isActive,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      password: password ?? this.password,
      role: role ?? this.role,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
    );
  }
}
