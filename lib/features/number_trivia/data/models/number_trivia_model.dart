import 'package:flutter_clean_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:json_annotation/json_annotation.dart';

part 'number_trivia_model.g.dart';
@JsonSerializable()
class NumberTriviaModel extends NumberTrivia {
   NumberTriviaModel({
    required this.text,
    required this.value,
  }):super(number: value.toInt(),text: text);
  
  @override
  // ignore: overridden_fields
  final String text;
  @JsonKey(name:"number")
  final num value;

  /// factory.
  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) => _$NumberTriviaModelFromJson(json);

  /// Connect the generated [_$NumberTriviaModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);
}
