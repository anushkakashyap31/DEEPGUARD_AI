import 'package:flutter/material.dart';

class AlertBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onClose;

  const AlertBanner({Key? key, required this.message, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      child: ListTile(
        leading: const Icon(Icons.warning, color: Colors.white),
        title: Text(message, style: const TextStyle(color: Colors.white)),
        trailing: onClose != null
            ? IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              )
            : null,
      ),
    );
  }
}
