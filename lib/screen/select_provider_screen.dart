import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/layout/default_layout.dart';
import 'package:riverpod_sample/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('SelectProviderScreen.build');

    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next : $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: Column(
        children: [
          // Text(
          //   state.name,
          // ),
          // Text(
          //   state.hasBought.toString(),
          // ),
          // Text(
          //   state.isSpicy.toString(),
          // ),
          Text(state.toString()),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleHasBought();
            },
            child: Text('Toggle hasBought'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleIsSpicy();
            },
            child: Text('Toggle hasBought'),
          ),
        ],
      ),
    );
  }
}
