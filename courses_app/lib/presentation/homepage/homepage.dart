// ignore_for_file: avoid_unnecessary_containers

import 'package:courses_app/presentation/homepage/homepage_block/app_bloc.dart';
import 'package:courses_app/presentation/homepage/homepage_block/app_events.dart';
import 'package:courses_app/presentation/homepage/homepage_block/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<AppBloc>().add(IncrementEvent());
                  },
                  icon: const Icon(Icons.add),
                ),
                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return Text(state.counter.toString());
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.read<AppBloc>().add(DecrementEvent());
                  },
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
