import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/counter_provider.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build function called!!!");
    final provider = Provider.of<CounterProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Counter App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, counterProvider, child) {
            return Text(

              provider.count.toString(),


              /// setup no 01
              // counterProvider.count.toString(),


              /// setup no 02
              // ctx.watch<CounterProvider>().count.toString(),


            /// setup no 03
            // context.watch<CounterProvider>().count.toString(),

              /// setup no 04
              // Provider.of<CounterProvider>(context).count.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          provider.increment();

          /// setup no 01
          // Provider.of<CounterProvider>(context,listen: false).increment();


          /// setup no 02
          // context.read<CounterProvider>().increment();


          /// setup no 03
          // context.watch<CounterProvider>().decrement();
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
