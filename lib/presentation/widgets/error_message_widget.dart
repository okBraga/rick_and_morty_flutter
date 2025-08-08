import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter_test/core/components/tokens/tokens.dart';

class ErrorMessageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String message;

  const ErrorMessageWidget({super.key, required this.onTap, this.message = 'Erro ao buscar os dados!'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: Spacements.md),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text('Tentar novamente', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
