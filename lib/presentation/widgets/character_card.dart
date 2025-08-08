import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_test/core/components/tokens/tokens.dart';

class CharacterCard extends StatelessWidget {
  final VoidCallback onTap;
  final String characterName;
  final String imageUrl;

  const CharacterCard({super.key, required this.onTap, required this.characterName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(Spacements.lg)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.network(imageUrl, fit: BoxFit.cover)),
            SizedBox(height: Spacements.xxxs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacements.md),
              child: Text(
                characterName,
                style: TextStyle(fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Spacements.xxxs),
          ],
        ),
      ),
    );
  }
}
