import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/cart_provider.dart';
import 'package:provider_statemanagement/providers/counter_provider.dart';
import 'package:provider_statemanagement/providers/theme_provider.dart';
import 'package:provider_statemanagement/views/screens/counter_screen.dart';
import 'package:provider_statemanagement/views/screens/theme_screen.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(
            //     seedColor: Colors.deepPurple,
            //   ),
            //   useMaterial3: true,
            // ),
            theme: provider.themeData,
            debugShowCheckedModeBanner: false,
            home: const CounterScreen()
          );
        },
      )
    );
  }
}
