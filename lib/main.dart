import 'package:cook_app/core/network/local/cache_helper.dart';
import 'package:cook_app/core/network/remote/dio_helper.dart';
import 'package:cook_app/core/services/service_locator.dart';
import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/features/auth/presentation/controller/cubit/bloc_observer/bloc.dart';
import 'package:cook_app/features/intro/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  DioHelper.init();
  await CacheHelper.init();
  ServiceLocator.getInit();
  Bloc.observer = MyBlocObserver();
  // String userId = CacheHelper.getData(key: 'userId');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your vapplication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cook App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kScaffoldBGColor,
            fontFamily: 'DMSans'),
        home: const SplashView());
  }
}
