import 'dart:convert';

class Vaccines {
  final int vaccine_id;
  final String vac_nameen;
  final String vac_nameth;
  final String detail;
  Vaccines({
    this.vaccine_id,
    this.vac_nameen,
    this.vac_nameth,
    this.detail,
  });

  Vaccines copyWith({
    int vaccine_id,
    String vac_nameen,
    String vac_nameth,
    String detail,
  }) {
    return Vaccines(
      vaccine_id: vaccine_id ?? this.vaccine_id,
      vac_nameen: vac_nameen ?? this.vac_nameen,
      vac_nameth: vac_nameth ?? this.vac_nameth,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vaccine_id': vaccine_id,
      'vac_nameen': vac_nameen,
      'vac_nameth': vac_nameth,
      'detail': detail,
    };
  }

  factory Vaccines.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Vaccines(
      vaccine_id: map['vaccine_id'],
      vac_nameen: map['vac_nameen'],
      vac_nameth: map['vac_nameth'],
      detail: map['detail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vaccines.fromJson(String source) => Vaccines.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vaccines(vaccine_id: $vaccine_id, vac_nameen: $vac_nameen, vac_nameth: $vac_nameth, detail: $detail)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Vaccines &&
      o.vaccine_id == vaccine_id &&
      o.vac_nameen == vac_nameen &&
      o.vac_nameth == vac_nameth &&
      o.detail == detail;
  }

  @override
  int get hashCode {
    return vaccine_id.hashCode ^
      vac_nameen.hashCode ^
      vac_nameth.hashCode ^
      detail.hashCode;
  }
}
