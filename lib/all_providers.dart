import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/app-data/presentation/bloc/app_data_bloc.dart';
import 'features/city/presentation/bloc/city_bloc.dart';

class AllProviders extends StatelessWidget {
  final Widget child;
  const AllProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CityBloc>(
          create: (context) => CityBloc(),
        ),
        BlocProvider<AppDataBloc>(
          create: (context) => AppDataBloc(
            cityBloc: BlocProvider.of<CityBloc>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}
