import 'dart:convert';

class User {
  int? user_id;
  String? firstname;
  String? lastname;
  String? birthday;
  String? mobile;
  String? user_image;
  String? email;
  String? password;
  int? worker_id;
  int? role_id;
  int? farm_id;
  String? date_startwork;
  String? date_endwork;
  String? role_name;
  String? farm_no;
  String? farm_name;
  String? farm_image;
  String? address;
  int? moo;
  String? soi;
  String? road;
  String? sub_district;
  String? district;
  String? province;
  int? postcode;
  User({
    required this.user_id,
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.mobile,
    required this.user_image,
    required this.email,
    required this.password,
    required this.worker_id,
    required this.role_id,
    required this.farm_id,
    required this.date_startwork,
    required this.date_endwork,
    required this.role_name,
    required this.farm_no,
    required this.farm_name,
    required this.farm_image,
    required this.address,
    required this.moo,
    required this.soi,
    required this.road,
    required this.sub_district,
    required this.district,
    required this.province,
    required this.postcode,
  });

  User copyWith({
    int? user_id,
    String? firstname,
    String? lastname,
    String? birthday,
    String? mobile,
    String? user_image,
    String? email,
    String? password,
    int? worker_id,
    int? role_id,
    int? farm_id,
    String? date_startwork,
    String? date_endwork,
    String? role_name,
    String? farm_no,
    String? farm_name,
    String? farm_image,
    String? address,
    int? moo,
    String? soi,
    String? road,
    String? sub_district,
    String? district,
    String? province,
    int? postcode,
  }) {
    return User(
      user_id: user_id ?? this.user_id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      birthday: birthday ?? this.birthday,
      mobile: mobile ?? this.mobile,
      user_image: user_image ?? this.user_image,
      email: email ?? this.email,
      password: password ?? this.password,
      worker_id: worker_id ?? this.worker_id,
      role_id: role_id ?? this.role_id,
      farm_id: farm_id ?? this.farm_id,
      date_startwork: date_startwork ?? this.date_startwork,
      date_endwork: date_endwork ?? this.date_endwork,
      role_name: role_name ?? this.role_name,
      farm_no: farm_no ?? this.farm_no,
      farm_name: farm_name ?? this.farm_name,
      farm_image: farm_image ?? this.farm_image,
      address: address ?? this.address,
      moo: moo ?? this.moo,
      soi: soi ?? this.soi,
      road: road ?? this.road,
      sub_district: sub_district ?? this.sub_district,
      district: district ?? this.district,
      province: province ?? this.province,
      postcode: postcode ?? this.postcode,
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
      'worker_id': worker_id,
      'role_id': role_id,
      'farm_id': farm_id,
      'date_startwork': date_startwork,
      'date_endwork': date_endwork,
      'role_name': role_name,
      'farm_no': farm_no,
      'farm_name': farm_name,
      'farm_image': farm_image,
      'address': address,
      'moo': moo,
      'soi': soi,
      'road': road,
      'sub_district': sub_district,
      'district': district,
      'province': province,
      'postcode': postcode,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      user_id: map['user_id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      birthday: map['birthday'],
      mobile: map['mobile'],
      user_image: map['user_image'],
      email: map['email'],
      password: map['password'],
      worker_id: map['worker_id'],
      role_id: map['role_id'],
      farm_id: map['farm_id'],
      date_startwork: map['date_startwork'],
      date_endwork: map['date_endwork'],
      role_name: map['role_name'],
      farm_no: map['farm_no'],
      farm_name: map['farm_name'],
      farm_image: map['farm_image'],
      address: map['address'],
      moo: map['moo'],
      soi: map['soi'],
      road: map['road'],
      sub_district: map['sub_district'],
      district: map['district'],
      province: map['province'],
      postcode: map['postcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
  factory User.fromJsons(Map<String, dynamic> responseData) {
    return User(
      user_id: responseData['user_id'],
      firstname: responseData['firstname'],
      lastname: responseData['lastname'],
      birthday: responseData['birthday'],
      mobile: responseData['mobile'],
      user_image: responseData['user_image'],
      email: responseData['email'],
      password: responseData['password'],
      worker_id: responseData['worker_id'],
      role_id: responseData['role_id'],
      farm_id: responseData['farm_id'],
      date_startwork: responseData['date_startwork'],
      date_endwork: responseData['date_endwork'],
      role_name: responseData['role_name'],
      farm_no: responseData['farm_no'],
      farm_name: responseData['farm_name'],
      farm_image: responseData['farm_image'],
      address: responseData['address'],
      moo: responseData['moo'],
      soi: responseData['soi'],
      road: responseData['road'],
      sub_district: responseData['sub_district'],
      district: responseData['district'],
      province: responseData['province'],
      postcode: responseData['postcode'],
    );
  }

  @override
  String toString() {
    return 'User(user_id: $user_id, firstname: $firstname, lastname: $lastname, birthday: $birthday, mobile: $mobile, user_image: $user_image, email: $email, password: $password, worker_id: $worker_id, role_id: $role_id, farm_id: $farm_id, date_startwork: $date_startwork, date_endwork: $date_endwork, role_name: $role_name, farm_no: $farm_no, farm_name: $farm_name, farm_image: $farm_image, address: $address, moo: $moo, soi: $soi, road: $road, sub_district: $sub_district, district: $district, province: $province, postcode: $postcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.user_id == user_id &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.birthday == birthday &&
        other.mobile == mobile &&
        other.user_image == user_image &&
        other.email == email &&
        other.password == password &&
        other.worker_id == worker_id &&
        other.role_id == role_id &&
        other.farm_id == farm_id &&
        other.date_startwork == date_startwork &&
        other.date_endwork == date_endwork &&
        other.role_name == role_name &&
        other.farm_no == farm_no &&
        other.farm_name == farm_name &&
        other.farm_image == farm_image &&
        other.address == address &&
        other.moo == moo &&
        other.soi == soi &&
        other.road == road &&
        other.sub_district == sub_district &&
        other.district == district &&
        other.province == province &&
        other.postcode == postcode;
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
        password.hashCode ^
        worker_id.hashCode ^
        role_id.hashCode ^
        farm_id.hashCode ^
        date_startwork.hashCode ^
        date_endwork.hashCode ^
        role_name.hashCode ^
        farm_no.hashCode ^
        farm_name.hashCode ^
        farm_image.hashCode ^
        address.hashCode ^
        moo.hashCode ^
        soi.hashCode ^
        road.hashCode ^
        sub_district.hashCode ^
        district.hashCode ^
        province.hashCode ^
        postcode.hashCode;
  }
}
