import 'dart:convert';

class Cows {
  final int cow_id;
  final int typecow_id;
  final int species_id;
  final int farm_id;
  final int statuscow_id;
  final String cow_no;
  final String cow_name;
  final String cow_birthday;
  final String cow_sex;
  final String cow_image1;
  final String cow_image2;
  final String cow_image3;
  final String note;
  Cows({
    this.cow_id,
    this.typecow_id,
    this.species_id,
    this.farm_id,
    this.statuscow_id,
    this.cow_no,
    this.cow_name,
    this.cow_birthday,
    this.cow_sex,
    this.cow_image1,
    this.cow_image2,
    this.cow_image3,
    this.note,
  });

  Cows copyWith({
    int cow_id,
    int typecow_id,
    int species_id,
    int farm_id,
    int statuscow_id,
    String cow_no,
    String cow_name,
    String cow_birthday,
    String cow_sex,
    String cow_image1,
    String cow_image2,
    String cow_image3,
    String note,
  }) {
    return Cows(
      cow_id: cow_id ?? this.cow_id,
      typecow_id: typecow_id ?? this.typecow_id,
      species_id: species_id ?? this.species_id,
      farm_id: farm_id ?? this.farm_id,
      statuscow_id: statuscow_id ?? this.statuscow_id,
      cow_no: cow_no ?? this.cow_no,
      cow_name: cow_name ?? this.cow_name,
      cow_birthday: cow_birthday ?? this.cow_birthday,
      cow_sex: cow_sex ?? this.cow_sex,
      cow_image1: cow_image1 ?? this.cow_image1,
      cow_image2: cow_image2 ?? this.cow_image2,
      cow_image3: cow_image3 ?? this.cow_image3,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cow_id': cow_id,
      'typecow_id': typecow_id,
      'species_id': species_id,
      'farm_id': farm_id,
      'statuscow_id': statuscow_id,
      'cow_no': cow_no,
      'cow_name': cow_name,
      'cow_birthday': cow_birthday,
      'cow_sex': cow_sex,
      'cow_image1': cow_image1,
      'cow_image2': cow_image2,
      'cow_image3': cow_image3,
      'note': note,
    };
  }

  factory Cows.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cows(
      cow_id: map['cow_id'],
      typecow_id: map['typecow_id'],
      species_id: map['species_id'],
      farm_id: map['farm_id'],
      statuscow_id: map['statuscow_id'],
      cow_no: map['cow_no'],
      cow_name: map['cow_name'],
      cow_birthday: map['cow_birthday'],
      cow_sex: map['cow_sex'],
      cow_image1: map['cow_image1'],
      cow_image2: map['cow_image2'],
      cow_image3: map['cow_image3'],
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cows.fromJson(String source) => Cows.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cows(cow_id: $cow_id, typecow_id: $typecow_id, species_id: $species_id, farm_id: $farm_id, statuscow_id: $statuscow_id, cow_no: $cow_no, cow_name: $cow_name, cow_birthday: $cow_birthday, cow_sex: $cow_sex, cow_image1: $cow_image1, cow_image2: $cow_image2, cow_image3: $cow_image3, note: $note)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cows &&
        o.cow_id == cow_id &&
        o.typecow_id == typecow_id &&
        o.species_id == species_id &&
        o.farm_id == farm_id &&
        o.statuscow_id == statuscow_id &&
        o.cow_no == cow_no &&
        o.cow_name == cow_name &&
        o.cow_birthday == cow_birthday &&
        o.cow_sex == cow_sex &&
        o.cow_image1 == cow_image1 &&
        o.cow_image2 == cow_image2 &&
        o.cow_image3 == cow_image3 &&
        o.note == note;
  }

  @override
  int get hashCode {
    return cow_id.hashCode ^
        typecow_id.hashCode ^
        species_id.hashCode ^
        farm_id.hashCode ^
        statuscow_id.hashCode ^
        cow_no.hashCode ^
        cow_name.hashCode ^
        cow_birthday.hashCode ^
        cow_sex.hashCode ^
        cow_image1.hashCode ^
        cow_image2.hashCode ^
        cow_image3.hashCode ^
        note.hashCode;
  }
}
