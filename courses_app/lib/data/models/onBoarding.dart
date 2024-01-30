// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnBoarding {
  final int index;
  final String title;
  final String subtitle;
  final String buttonName;
  final String imageName;
  OnBoarding({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.buttonName,
    required this.imageName,
  });

  OnBoarding copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? buttonName,
    String? imageName,
  }) {
    return OnBoarding(
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      buttonName: buttonName ?? this.buttonName,
      imageName: imageName ?? this.imageName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'title': title,
      'subtitle': subtitle,
      'buttonName': buttonName,
      'imageName': imageName,
    };
  }

  factory OnBoarding.fromMap(Map<String, dynamic> map) {
    return OnBoarding(
      index: map['index'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      buttonName: map['buttonName'] as String,
      imageName: map['imageName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnBoarding.fromJson(String source) => OnBoarding.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OnBoarding(index: $index, title: $title, subtitle: $subtitle, buttonName: $buttonName, imageName: $imageName)';
  }

  @override
  bool operator ==(covariant OnBoarding other) {
    if (identical(this, other)) return true;

    return other.index == index && other.title == title && other.subtitle == subtitle && other.buttonName == buttonName && other.imageName == imageName;
  }

  @override
  int get hashCode {
    return index.hashCode ^ title.hashCode ^ subtitle.hashCode ^ buttonName.hashCode ^ imageName.hashCode;
  }
}
