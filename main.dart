import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route Demo',
      //TODO 1: Update Route Table HERE
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/Login': (context) => LoginScreen(),
        '/second': (context) => LoginScreen(),
      },
      // Start the app with the "/" named route.
      // The app starts on the FirstScreen widget.
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => FirstScreen();
            break;
          case '/Login':
            builder = (BuildContext context) => LoginScreen();
            break;
          case '/Register':
            builder = (BuildContext context) => RegisterScreen();
            break;
          default:
            builder = (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('Error - Page not found'),
                  ),
                );
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('background_image.jpg'), // Replace 'background_image.jpg' with your image path
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop), // Adjust the opacity value (0.0 - 1.0) here
              ),
            ),
          ),
          // Content
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('logo.png', width: 300.0 ), // Replace 'logo.png' with your image path
                  ),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Login');
                      // Login button pressed
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20.0), // Adjust the font size here
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Register');
                      // Register button pressed
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                      child: Text(
                        'Register(Alumni)',
                        style: TextStyle(fontSize: 20.0), // Adjust the font size here
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Align text to the left
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('logo.png', width: 300.0 ), // Replace 'logo.png' with your image path
            ),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'with your Mahidol University Account.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 100.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Home');
                // Perform login action here
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}