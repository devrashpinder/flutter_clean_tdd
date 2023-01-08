// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberTriviaModel _$NumberTriviaModelFromJson(Map<String, dynamic> json) =>
    NumberTriviaModel(
      text: json['text'] as String,
      value: json['number'] as num,
    );

Map<String, dynamic> _$NumberTriviaModelToJson(NumberTriviaModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.value,
    };
