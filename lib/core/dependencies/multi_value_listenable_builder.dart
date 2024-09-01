import 'package:flutter/widgets.dart';

class MultiValueListenableBuilder extends StatefulWidget {
  final List<ValueNotifier> valueNotifiers;
  final Widget Function(
      BuildContext context, List<dynamic> values, Widget? child) builder;
  final Widget? child;

  const MultiValueListenableBuilder({
    super.key,
    required this.valueNotifiers,
    required this.builder,
    this.child,
  });

  @override
  State<MultiValueListenableBuilder> createState() =>
      _MultiValueListenableBuilderState();
}

class _MultiValueListenableBuilderState
    extends State<MultiValueListenableBuilder> {
  late Listenable _combinedListenable;
  late List<dynamic> _values;

  @override
  void initState() {
    super.initState();
    _values = widget.valueNotifiers.map((vn) => vn.value).toList();
    _combinedListenable = Listenable.merge(widget.valueNotifiers);
    _combinedListenable.addListener(_updateValues);
  }

  @override
  void dispose() {
    _combinedListenable.removeListener(_updateValues);
    super.dispose();
  }

  void _updateValues() {
    setState(() {
      _values = widget.valueNotifiers.map((vn) => vn.value).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _values, widget.child);
  }
}
