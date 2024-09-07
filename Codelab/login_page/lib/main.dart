import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login Page",
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool isTextObscured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 4.0,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.network(
              'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/new-ui-logo.png'),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: const <Widget>[
              MenuTile(title: "Academy"),
              MenuTile(title: 'Challenge'),
              MenuTile(title: 'Event'),
              MenuTile(title: 'Job'),
              MenuTile(title: 'Developer'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                    "https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/certificate_logo.png"),
                const SizedBox(height: 32.0),
                Text(
                  "Masuk",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      isDense: true),
                  enabled: true,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  obscureText: isTextObscured,
                  decoration: InputDecoration(
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(isTextObscured
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isTextObscured = !isTextObscured;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade800,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {}
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 20),
                          color: Colors.white,
                          child: Text(
                            'atau',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton.icon(
                  label: Text("Masuk dengan Google", style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                  ),
                  // Getting the FaIcon from Pub.get
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                OutlinedButton.icon(
                    label: Text("Masuk dengan Facebook", style: TextStyle(color: Colors.black),),
                    icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue
                    ),
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black)
                    ),
                    onPressed: () {}
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Belum punya akun? Ayo",
                      children: const [
                        TextSpan(text: " daftar", style: TextStyle(color: Colors.blue)
                        ),
                      ]
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Dengan melakukan login, Anda setuju dengan ',
                    children: [
                      TextSpan(
                        text: 'syarat & ketentuan Dicoding',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ]
                  ),
                )

              ],
            )),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;

  const MenuTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: const Icon(
        Icons.navigate_next,
        color: Colors.black,
      ),
    );
  }
}
