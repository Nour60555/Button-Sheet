import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Sheet ',
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orangeAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
        ),
      ),

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _showLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return LoginBottomSheet();
      },
    );
  }

  void _showRegisterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RegisterBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyBee APP'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(232, 15, 1, 12)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                        width: 200,
                        height: 200,
                        child: ClipOval(
                          child: Image.network(
                            "https://media.istockphoto.com/id/1337620343/vector/bee-flying-on-a-line-route-in-heart-shape-lovely-bee-character.jpg?s=612x612&w=is&k=20&c=4K18fljC4UN1RvfmieOgOwWjFASkpZldoWaoCM0Jx3U=",
                            fit: BoxFit.fill,
                          ),
                        )),
            ElevatedButton(
              onPressed: () => _showLoginSheet(context),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 215, 230, 79)), // Button background color
                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 4, 4, 4)), // Button text color
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Button padding
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Button rounded corners
                    ),
                  ),
                ),
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showRegisterSheet(context),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)), // Button background color
                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 209, 249, 48)), // Button text color
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Button padding
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Button rounded corners
                    ),
                  ),
                ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginBottomSheet extends StatefulWidget {
  @override
  _LoginBottomSheetState createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              onSaved: (value) => _username = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onSaved: (value) => _password = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Handle login logic here
                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 4, 4, 4)), // Button background color
                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 240, 102)), // Button text color
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Button padding
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Button rounded corners
                    ),
                  ),
                ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterBottomSheet extends StatefulWidget {
  @override
  _RegisterBottomSheetState createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  String? _age;
  bool _isMale = false;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              onSaved: (value) => _username = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onSaved: (value) => _password = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Age'),
              onSaved: (value) => _age = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            Row(
              children: [
                Text('Male'),
                Checkbox(
                  value: _isMale,
                  onChanged: (value) {
                    setState(() {
                      _isMale = value!;
                    });
                  },
                ),
                Text('Female'),
                Checkbox(
                  value: !_isMale,
                  onChanged: (value) {
                    setState(() {
                      _isMale = !value!;
                    });
                  },
                ),
              ],
            ),
            CheckboxListTile(
              title: Text("Accept Terms and Conditions"),
              value: _acceptTerms,
              onChanged: (newValue) {
                setState(() {
                  _acceptTerms = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  // Checkbox at the leading edge of the title.
              subtitle: !_acceptTerms
                  ? Text(
                      'You must accept terms and conditions',
                      style: TextStyle(color: Colors.red),
                    )
                  : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && _acceptTerms) {
                  _formKey.currentState!.save();
                  // Handle registration logic here
                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 212, 255, 70)), // Button background color
                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)), // Button text color
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ), // Button padding
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Button rounded corners
                    ),
                  ),
                ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

