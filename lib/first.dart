import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image.network('https://w7.pngwing.com/pngs/164/568/png-transparent-easy-taxi-e-hailing-real-time-ridesharing-taxi-logos-smiley-transport-emoticon.png',height: 200,),
            SizedBox(height: 20,),
            Text('Welcome to Kongsi Ride',style: GoogleFonts.exo2(textStyle: TextStyle(fontWeight: FontWeight.bold,height: 20)),),
            ElevatedButton(
                onPressed: (){Navigator.pushReplacementNamed(context, '/register');},
                child: Text('Register')
            ),
            ElevatedButton(
                onPressed: (){Navigator.pushReplacementNamed(context, '/login');},
                child: Text('Log In')
            ),
          ],
        ),
      ),
    );
  }
}
