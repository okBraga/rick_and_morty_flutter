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
          Text(message),
          SizedBox(height: Spacements.md),
          //TODO melhorar botão
          ElevatedButton(onPressed: onTap, child: Text('Tentar novamente', style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}
