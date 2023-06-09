
import 'package:e_fruit_app/provider/product_provider.dart';
import 'package:e_fruit_app/provider/review_cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/splash screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    //return ChangeNotifierProvider(create: (context)=>ProductProvider(),
    return MultiProvider(providers:[
      ChangeNotifierProvider<ProductProvider>(
          create: (context)=>ProductProvider()),
      ChangeNotifierProvider<ReviewCartProvider>(
          create: (context)=>ReviewCartProvider()),

    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    ));
  }
}

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(seconds: 5),()=>
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()))
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//      // backgroundColor: Colors.green.shade100,
//
//     body: Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.green.shade200, Colors.green],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,),
//       ),
//       height: double.infinity,
//       width: double.infinity,
//       child: Image(image: AssetImage("assets/images/logo.png"),),
//     ),
//     );
//   }
// }
