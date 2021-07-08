import 'dart:convert';

class Parturitions {
  int parturition_id;
  String par_date;
  String calf_name;
  String calf_sex;
  String note;
  String per_caretaker;
  int cow_id;
  Parturitions({
    this.parturition_id,
    this.par_date,
    this.calf_name,
    this.calf_sex,
    this.note,
    this.per_caretaker,
    this.cow_id,
  });
  

  Parturitions copyWith({
    int parturition_id,
    String par_date,
    String calf_name,
    String calf_sex,
    String note,
    String per_caretaker,
    int cow_id,
  }) {
    return Parturitions(
      parturition_id: parturition_id ?? this.parturition_id,
      par_date: par_date ?? this.par_date,
      calf_name: calf_name ?? this.calf_name,
      calf_sex: calf_sex ?? this.calf_sex,
      note: note ?? this.note,
      per_caretaker: per_caretaker ?? this.per_caretaker,
      cow_id: cow_id ?? this.cow_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parturition_id': parturition_id,
      'par_date': par_date,
      'calf_name': calf_name,
      'calf_sex': calf_sex,
      'note': note,
      'per_caretaker': per_caretaker,
      'cow_id': cow_id,
    };
  }

  factory Parturitions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Parturitions(
      parturition_id: map['parturition_id'],
      par_date: map['par_date'],
      calf_name: map['calf_name'],
      calf_sex: map['calf_sex'],
      note: map['note'],
      per_caretaker: map['per_caretaker'],
      cow_id: map['cow_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Parturitions.fromJson(String source) => Parturitions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Parturitions(parturition_id: $parturition_id, par_date: $par_date, calf_name: $calf_name, calf_sex: $calf_sex, note: $note, per_caretaker: $per_caretaker, cow_id: $cow_id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Parturitions &&
      o.parturition_id == parturition_id &&
      o.par_date == par_date &&
      o.calf_name == calf_name &&
      o.calf_sex == calf_sex &&
      o.note == note &&
      o.per_caretaker == per_caretaker &&
      o.cow_id == cow_id;
  }

  @override
  int get hashCode {
    return parturition_id.hashCode ^
      par_date.hashCode ^
      calf_name.hashCode ^
      calf_sex.hashCode ^
      note.hashCode ^
      per_caretaker.hashCode ^
      cow_id.hashCode;
  }
}
