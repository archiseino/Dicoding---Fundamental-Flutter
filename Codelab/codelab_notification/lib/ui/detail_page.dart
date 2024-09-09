import 'package:codelab_notification/utils/received_notification.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail_page";

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceivedNotification arg = ModalRoute.of(context)?.settings.arguments as ReceivedNotification;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go Back!"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

  }
}