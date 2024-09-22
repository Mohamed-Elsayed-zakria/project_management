class Data {
  final String? id;
  final String? username;
  final String? email;
  final String? role;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  const Data({
    this.id,
    this.username,
    this.email,
    this.role,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'email': email,
        'role': role,
        'active': active,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
