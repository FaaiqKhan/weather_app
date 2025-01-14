import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ErrorViewWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: Text("Retry"),
          ),
        ],
      ),
    );
  }
}
