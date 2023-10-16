import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paradoxs_coffee/bloc/category/category_bloc.dart';
import 'package:paradoxs_coffee/bloc/order/order_bloc.dart';
import 'package:paradoxs_coffee/bloc/product/product_bloc.dart';
import 'package:paradoxs_coffee/data/firebase_service/order_service.dart';
import 'package:paradoxs_coffee/data/local/db/local_database.dart';
import 'package:paradoxs_coffee/data/repositories/order_repo/order_repo.dart';
import 'package:paradoxs_coffee/ui/app_routes.dart';
import 'package:paradoxs_coffee/utils/theme.dart';

import 'data/local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  LocalDatabase.getInstance;
  await Firebase.initializeApp();

  runApp(
    App(
      orderService: OrderService(),
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.orderService,
  });

  final OrderService orderService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => OrderRepo(orderService: orderService),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OrderBloc(
              orderRepo: context.read<OrderRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
