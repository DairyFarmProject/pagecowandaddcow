import 'dart:convert';

class Abdominal {
  final int abdominal_id;
  final int cow_id;
  final int round;
  final String ab_date;
  final String ab_status;
  final String ab_caretaker;
  final int dry_period;
  final String semen_id;
  final String semen_name;
  final int semen_specie;
  final String note;
  Abdominal({
    required this.abdominal_id,
    required this.cow_id,
    required this.round,
    required this.ab_date,
    required this.ab_status,
    required this.ab_caretaker,
    required this.dry_period,
    required this.semen_id,
    required this.semen_name,
    required this.semen_specie,
    required this.note,
  });
 

  Abdominal copyWith({
    int? abdominal_id,
    int? cow_id,
    int? round,
    String? ab_date,
    String? ab_status,
    String? ab_caretaker,
    int? dry_period,
    String? semen_id,
    String? semen_name,
    int? semen_specie,
    String? note,
  }) {
    return Abdominal(
      abdominal_id: abdominal_id ?? this.abdominal_id,
      cow_id: cow_id ?? this.cow_id,
      round: round ?? this.round,
      ab_date: ab_date ?? this.ab_date,
      ab_status: ab_status ?? this.ab_status,
      ab_caretaker: ab_caretaker ?? this.ab_caretaker,
      dry_period: dry_period ?? this.dry_period,
      semen_id: semen_id ?? this.semen_id,
      semen_name: semen_name ?? this.semen_name,
      semen_specie: semen_specie ?? this.semen_specie,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abdominal_id': abdominal_id,
      'cow_id': cow_id,
      'round': round,
      'ab_date': ab_date,
      'ab_status': ab_status,
      'ab_caretaker': ab_caretaker,
      'dry_period': dry_period,
      'semen_id': semen_id,
      'semen_name': semen_name,
      'semen_specie': semen_specie,
      'note': note,
    };
  }

  factory Abdominal.fromMap(Map<String, dynamic> map) {
    return Abdominal(
      abdominal_id: map['abdominal_id'],
      cow_id: map['cow_id'],
      round: map['round'],
      ab_date: map['ab_date'],
      ab_status: map['ab_status'],
      ab_caretaker: map['ab_caretaker'],
      dry_period: map['dry_period'],
      semen_id: map['semen_id'],
      semen_name: map['semen_name'],
      semen_specie: map['semen_specie'],
      note: map['note'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Abdominal.fromJson(String source) => Abdominal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Abdominal(abdominal_id: $abdominal_id, cow_id: $cow_id, round: $round, ab_date: $ab_date, ab_status: $ab_status, ab_caretaker: $ab_caretaker, dry_period: $dry_period, semen_id: $semen_id, semen_name: $semen_name, semen_specie: $semen_specie, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Abdominal &&
      other.abdominal_id == abdominal_id &&
      other.cow_id == cow_id &&
      other.round == round &&
      other.ab_date == ab_date &&
      other.ab_status == ab_status &&
      other.ab_caretaker == ab_caretaker &&
      other.dry_period == dry_period &&
      other.semen_id == semen_id &&
      other.semen_name == semen_name &&
      other.semen_specie == semen_specie &&
      other.note == note;
  }

  @override
  int get hashCode {
    return abdominal_id.hashCode ^
      cow_id.hashCode ^
      round.hashCode ^
      ab_date.hashCode ^
      ab_status.hashCode ^
      ab_caretaker.hashCode ^
      dry_period.hashCode ^
      semen_id.hashCode ^
      semen_name.hashCode ^
      semen_specie.hashCode ^
      note.hashCode;
  }
}
