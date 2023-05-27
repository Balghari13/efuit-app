import 'package:flutter/material.dart';
import '../auth/firebase_services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade200, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Image(image: AssetImage("assets/images/logo.png"),),
      ),
    );
  }
}
