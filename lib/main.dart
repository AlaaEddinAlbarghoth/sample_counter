import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_counter/counter/counter_cubit.dart';
import 'package:sample_counter/screens/other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'MyCounter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('counter is ${state.counter}'),
                );
              });
        } else if (state.counter == -1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const OtherPage();
            }),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 52.0),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                heroTag: 'increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10.0),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                heroTag: 'decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
