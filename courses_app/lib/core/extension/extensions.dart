import 'package:flutter/material.dart';

extension PrintToConsole on Object? {
  get pr {
    print(' .................... ');
    print('$this');
    print(' .................... ');
    return this;
  }
}

extension DontPrintToConsole on Object? {
  get prx {
    return this;
  }
}

extension PrintTitleToConsole on Object? {
  get prt {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print('>>>>> $this >>>>>');
    return this;
  }
}

extension CenterOneWidget on Widget {
  Widget get cr => Center(child: this);
}

extension ExpandOneWidget on Widget {
  Widget get ex => Expanded(child: this);
}

extension SliverAdapter on Widget {
  Widget get sliver => SliverToBoxAdapter(child: this);
}

extension CenterAllWidgets on List<Widget> {
  List<Widget> get center => map((e) => Center(child: e)).toList();
}

extension ExpandAllWidgets on List<Widget> {
  List<Widget> get expand => map((e) => Expanded(child: e)).toList();
}

extension MapValueToString on Map {
  Map<String, String> get keyAndvalueToString => map((key, value) => MapEntry(key.toString(), value.toString()));
}

extension ToMap on Object? {
  Map<String, Object?> get toMap => this as Map<String, Object?>;
}

extension ToInt on Object? {
  int get toInt => this as int;
}

extension ToDouble on Object? {
  double get toDouble => this as double;
}

snackBar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title).cr,
    duration: const Duration(milliseconds: 800),
  ));
}
