import 'package:flutter/material.dart';
import 'package:lingo_assignement/view/language_screen.dart';

class StartJourney extends StatelessWidget {
  const StartJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('JOURNEY!', style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),

          SizedBox(height: 5),

          Text('Awaits!', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),

          Image.asset('assets/frog.png'),

          SizedBox(height: 30),
          
          Text('LingoBreeze', style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 38,
            color: Colors.blue.shade300,
          ),),
          
          SizedBox(height: 20,),
          
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageScreen()));
          },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              child: Text("Let's Get Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
          )
        ],
      ),
    );
  }
}
