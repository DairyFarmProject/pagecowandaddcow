import 'dart:convert';

class StatusCows {
  int statuscow_id;
  String status_name;
  StatusCows({
    required this.statuscow_id,
    required this.status_name,
  });

  StatusCows copyWith({
    int? statuscow_id,
    String? status_name,
  }) {
    return StatusCows(
      statuscow_id: statuscow_id ?? this.statuscow_id,
      status_name: status_name ?? this.status_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statuscow_id': statuscow_id,
      'status_name': status_name,
    };
  }

  factory StatusCows.fromMap(Map<String, dynamic> map) {
    return StatusCows(
      statuscow_id: map['statuscow_id'],
      status_name: map['status_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusCows.fromJson(String source) => StatusCows.fromMap(json.decode(source));

  @override
  String toString() => 'StatusCows(statuscow_id: $statuscow_id, status_name: $status_name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StatusCows &&
      other.statuscow_id == statuscow_id &&
      other.status_name == status_name;
  }

  @override
  int get hashCode => statuscow_id.hashCode ^ status_name.hashCode;
}
