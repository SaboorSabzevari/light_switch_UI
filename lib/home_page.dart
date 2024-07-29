import 'package:flutter/material.dart'hide BoxShadow, BoxDecoration;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final primaryColorWhite = const Color(0xffDBE0EB);
  final primaryColorDark = const Color(0xff2E3243);
  bool isPressed = false;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? primaryColorDark : primaryColorWhite,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dayNight(),
            const SizedBox(
              height: 36,
            ),
            centerText(),
            const SizedBox(height: 120,),
          powerButton(),
          ],
        ),
      ),
    );
  }

  Widget dayNight() {
    return Stack(
      children: [
        Container(
          width: 190,
          height: 210,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      const Color(0xff30218F),
                      const Color(0xff8D81DD),
                    ]
                  : [
                      const Color(0xffFFCC81),
                      const Color(0xffFF6E30),
                    ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          top: -33,
          right: -62,
          child: Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? primaryColorDark : null),
          ),
        )
      ],
    );
  }

  Widget centerText() {
    return Text(
      isDark ? 'Good\n Night': 'Good\nMorning',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: isDark ? primaryColorWhite : primaryColorDark),
    );
  }

  Widget powerButton() {
    return Listener(
      onPointerDown: (_)=>setState(() {
        isPressed=true;
      }),
      onPointerUp: (_)=>setState(() {
        isPressed=false;
        isDark = !isDark;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: isDark?primaryColorDark:primaryColorWhite));
      }),


      child: AnimatedContainer(duration: const Duration(milliseconds: 200),
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark?primaryColorDark:primaryColorWhite,
          boxShadow: [
            BoxShadow(
              offset:const Offset (-5,5),
              blurRadius: 10,
              color: isDark?const Color(0xff123625):
              const Color(0xffA5B7D6),
              inset: isPressed,
            ),BoxShadow(
              offset:const Offset (5,- 5),
              blurRadius: 10,
              color: isDark?const Color(0x4D9DA7CF):
              Colors.white70,
              inset: isPressed,
            ),
          ]


        ),
        child: Icon(Icons.power_settings_new,
        size: 48,
          color: isDark?primaryColorWhite:primaryColorDark,
        ),

      ),
    );
  }
}
