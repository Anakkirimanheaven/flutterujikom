class ProfileResponse {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String? avatar;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      avatar: json['avatar'],
    );
  }
}
