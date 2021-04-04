import 'package:flutter/material.dart';

class TranslationCard extends StatelessWidget {
  final String? from;
  final String? to;
  final String? detectedLang;

  const TranslationCard({
    Key? key,
    @required this.from,
    @required this.to,
    this.detectedLang = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTranslation(),
              _buildFavorite(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTranslation() {
    return Flexible(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(from!),
          SizedBox(height: 4),
          Text(
            to!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          if (detectedLang!.isNotEmpty) ...[
            SizedBox(height: 12),
            Text(
              'Detected language: $detectedLang',
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildFavorite() {
    return Flexible(
      flex: 1,
      child:
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () => null),
    );
  }
}
