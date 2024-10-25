import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/cart_provider.dart';
import 'package:provider_statemanagement/providers/counter_provider.dart';
import 'package:provider_statemanagement/providers/theme_provider.dart';
import 'package:provider_statemanagement/providers/wish_list_provider.dart';
import 'package:provider_statemanagement/views/screens/choose_app_screen.dart';


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
        ChangeNotifierProvider(create: (context) => WishListProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            theme: provider.themeData,
            debugShowCheckedModeBanner: false,
            home: const ChooseAppScreen()
          );
        },
      )
    );
  }
}

