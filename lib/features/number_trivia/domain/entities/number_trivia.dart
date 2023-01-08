import 'package:equatable/equatable.dart';

/// The Number Trivia Entity Model depenend on 
/// [text] and [number] 
/// 
class NumberTrivia extends Equatable {
  
  const NumberTrivia({
    required this.text,
    required this.number,
  });
  
  final String text;
  final int number;

  @override
  List<Object?> get props => [text, number];
}
