import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/platform_widget.dart';

class SettingsPage extends StatelessWidget  {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        // Must Wrap ListTile under the Material package since Cupertino doesn't have that
        Material(
          child: ListTile(
            title: const Text("Dark Theme"),
            trailing: Switch.adaptive(value: false, onChanged: (value) {
              defaultTargetPlatform == TargetPlatform.iOS ?
                  showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("Comming Soon!"),
                        content: const Text('This feature will be coming soon!'),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Ok"),
                            onPressed: () => Navigator.pop(context)
                          )
                        ],

                      );
                  }
                ) : showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Coming Soon!'),
                      content: const Text('This feature will be coming soon!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  }
              );
              }
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildList(context),
    );
  }


  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildList(context),
    );
  }

}