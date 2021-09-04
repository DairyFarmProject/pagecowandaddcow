import 'dart:convert';

class UserDairys {
  final String user_id;
  final String firstname;
  final String lastname;
  final String birthday;
  final String mobile;
  final String user_image;
  final String email;
  final String password; 
  UserDairys({
    required this.user_id,
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.mobile,
    required this.user_image,
    required this.email,
    required this.password,
  });

  UserDairys copyWith({
    String? user_id,
    String? firstname,
    String? lastname,
    String? birthday,
    String? mobile,
    String? user_image,
    String? email,
    String? password,
  }) {
    return UserDairys(
      user_id: user_id ?? this.user_id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthday: birthday ?? this.birthday,
      mobile: mobile ?? this.mobile,
      user_image: user_image ?? this.user_image,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'firstname': firstname,
      'lastname': lastname,
      'birthday': birthday,
      'mobile': mobile,
      'user_image': user_image,
      'email': email,
      'password': password,
    };
  }

  factory UserDairys.fromMap(Map<String, dynamic> map) {
    return UserDairys(
      user_id: map['user_id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      birthday: map['birthday'],
      mobile: map['mobile'],
      user_image: map['user_image'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDairys.fromJson(String source) => UserDairys.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDairys(user_id: $user_id, firstname: $firstname, lastname: $lastname, birthday: $birthday, mobile: $mobile, user_image: $user_image, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserDairys &&
      other.user_id == user_id &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.birthday == birthday &&
      other.mobile == mobile &&
      other.user_image == user_image &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      birthday.hashCode ^
      mobile.hashCode ^
      user_image.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
