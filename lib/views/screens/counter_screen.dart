import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/counter_provider.dart';
import 'package:provider_statemanagement/views/screens/cart_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build function called!!!");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          "Counter App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (ctx, counterProvider, child) {
                return Text(
                  counterProvider.count.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Colors.black
                  ),
                );
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text("Cart Screen",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<CounterProvider>(context,listen: false).increment();
          context.read<CounterProvider>().increment();
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
