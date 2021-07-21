import 'dart:convert';

class Abdominals {
  int abdominal_id;
  int round;
  String ab_date;
  String ab_status;
  String ab_caretaker;
  int dry_period;
  String semen_id;
  String semen_name;
  String note;
  int cow_id;
  int semen_specie;
  Abdominals({
    required this.abdominal_id,
    required this.round,
    required this.ab_date,
    required this.ab_status,
    required this.ab_caretaker,
    required this.dry_period,
    required this.semen_id,
    required this.semen_name,
    required this.note,
    required this.cow_id,
    required this.semen_specie,
  });
  

  Abdominals copyWith({
    int? abdominal_id,
    int? round,
    String? ab_date,
    String? ab_status,
    String? ab_caretaker,
    int? dry_period,
    String? semen_id,
    String? semen_name,
    String? note,
    int? cow_id,
    int? semen_specie,
  }) {
    return Abdominals(
      abdominal_id: abdominal_id ?? this.abdominal_id,
      round: round ?? this.round,
      ab_date: ab_date ?? this.ab_date,
      ab_status: ab_status ?? this.ab_status,
      ab_caretaker: ab_caretaker ?? this.ab_caretaker,
      dry_period: dry_period ?? this.dry_period,
      semen_id: semen_id ?? this.semen_id,
      semen_name: semen_name ?? this.semen_name,
      note: note ?? this.note,
      cow_id: cow_id ?? this.cow_id,
      semen_specie: semen_specie ?? this.semen_specie,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abdominal_id': abdominal_id,
      'round': round,
      'ab_date': ab_date,
      'ab_status': ab_status,
      'ab_caretaker': ab_caretaker,
      'dry_period': dry_period,
      'semen_id': semen_id,
      'semen_name': semen_name,
      'note': note,
      'cow_id': cow_id,
      'semen_specie': semen_specie,
    };
  }

  factory Abdominals.fromMap(Map<String, dynamic> map) {
    return Abdominals(
      abdominal_id: map['abdominal_id'],
      round: map['round'],
      ab_date: map['ab_date'],
      ab_status: map['ab_status'],
      ab_caretaker: map['ab_caretaker'],
      dry_period: map['dry_period'],
      semen_id: map['semen_id'],
      semen_name: map['semen_name'],
      note: map['note'],
      cow_id: map['cow_id'],
      semen_specie: map['semen_specie'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Abdominals.fromJson(String source) => Abdominals.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Abdominals(abdominal_id: $abdominal_id, round: $round, ab_date: $ab_date, ab_status: $ab_status, ab_caretaker: $ab_caretaker, dry_period: $dry_period, semen_id: $semen_id, semen_name: $semen_name, note: $note, cow_id: $cow_id, semen_specie: $semen_specie)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Abdominals &&
      other.abdominal_id == abdominal_id &&
      other.round == round &&
      other.ab_date == ab_date &&
      other.ab_status == ab_status &&
      other.ab_caretaker == ab_caretaker &&
      other.dry_period == dry_period &&
      other.semen_id == semen_id &&
      other.semen_name == semen_name &&
      other.note == note &&
      other.cow_id == cow_id &&
      other.semen_specie == semen_specie;
  }

  @override
  int get hashCode {
    return abdominal_id.hashCode ^
      round.hashCode ^
      ab_date.hashCode ^
      ab_status.hashCode ^
      ab_caretaker.hashCode ^
      dry_period.hashCode ^
      semen_id.hashCode ^
      semen_name.hashCode ^
      note.hashCode ^
      cow_id.hashCode ^
      semen_specie.hashCode;
  }
}
