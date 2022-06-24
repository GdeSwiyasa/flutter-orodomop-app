import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String quote;
  final String author;

  Quote({required this.quote, required this.author});

  @override
  // TODO: implement props
  List<Object?> get props => [
        quote,
        author,
      ];
}
