import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/domain/entities/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            title: Text(
              quote.quote,
              textAlign: TextAlign.center,
            ),
            subtitle: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  quote.author,
                  style: const TextStyle(color: kPrimaryColor),
                ),
              ),
            )),
      ),
    );
  }
}
