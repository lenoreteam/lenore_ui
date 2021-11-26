import 'dart:convert';

class Gender {
  int? id;
  String? title;
  Gender({
    this.id,
    this.title,
  });

  Gender copyWith({
    int? id,
    String? title,
  }) {
    return Gender(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory Gender.fromMap(map) {
    return Gender(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Gender.fromJson(Map<String, dynamic> source) =>
      Gender.fromMap(source);

  @override
  String toString() => 'Gender(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Gender && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
