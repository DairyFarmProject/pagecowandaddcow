import 'dart:convert';

class TypeCows {
  int typecow_id;
  String type_name;
  TypeCows({
    this.typecow_id,
    this.type_name,
  });

  TypeCows copyWith({
    int typecow_id,
    String type_name,
  }) {
    return TypeCows(
      typecow_id: typecow_id ?? this.typecow_id,
      type_name: type_name ?? this.type_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'typecow_id': typecow_id,
      'type_name': type_name,
    };
  }

  factory TypeCows.fromMap(Map<String, dynamic> map) {
    return TypeCows(
      typecow_id: map['typecow_id'],
      type_name: map['type_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeCows.fromJson(String source) => TypeCows.fromMap(json.decode(source));

  @override
  String toString() => 'TypeCows(typecow_id: $typecow_id, type_name: $type_name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TypeCows &&
      other.typecow_id == typecow_id &&
      other.type_name == type_name;
  }

  @override
  int get hashCode => typecow_id.hashCode ^ type_name.hashCode;
}
