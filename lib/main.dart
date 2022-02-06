import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge/router.dart';
import 'package:forge/settings/cubit/settings_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      const ProviderScope(
        child: ProviderSetup(),
      ),
    ),
    storage: storage,
  );
}

class ProviderSetup extends ConsumerWidget {
  const ProviderSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (context) {
          return SettingsCubit();
        })
      ],
      child: const MyApp(),
    );
  }
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
