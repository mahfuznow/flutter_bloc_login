import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocPage<B extends Bloc<E, S>, E, S>
    extends StatelessWidget {
  BaseBlocPage({Key? key}) : super(key: key);

  abstract B bloc;
  late final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(
        builder: ((context) {
          this.context = context;
          bloc = context.read<B>();
          return contents(context);
        }),
      ),
    );
  }

  Widget builder(Widget Function(BuildContext context, S state) builder) {
    return BlocBuilder<B, S>(builder: builder);
  }

  Widget contents(BuildContext context);

  void navigate(Widget destination) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => destination)));
  }
}
