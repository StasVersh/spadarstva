import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/data/services/group_services.dart';
import 'package:spadarstva/app/data/services/notification_services.dart';
import 'package:spadarstva/app/data/services/user_services.dart';
import 'package:spadarstva/app/routes/app_pages.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';
import 'package:spadarstva/core/values/app_values.dart';
import 'package:spadarstva/generated/locales.g.dart';
import 'package:spadarstva/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  var isAuthorized = Get.find<AuthServices>().isAuth();
  var userLanguage = Get.find<UserServices>().currentUser?.settings.language;
  runApp(
    GetMaterialApp(
      title: 'Spadarstva',
      initialRoute: isAuthorized ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      supportedLocales: AppValues.locales.map((code) => Locale(code)),
      locale: Locale(userLanguage ?? LocaleKeys.en),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, page) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: page ?? const SizedBox.shrink()),
      translationsKeys: AppTranslation.translations,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
        dividerTheme: const DividerThemeData(
          color: AppColors.backgroundSecondary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.text,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyles.regular,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Future initServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.deviceCheck,
  );
  Get.put<AuthServices>(AuthServices(FirebaseAuth.instance), permanent: true);
  await Get.put<GroupServices>(
      GroupServices(FirebaseFirestore.instance),
      permanent: true)
      .init();
  await Get.put<NotificationServices>(
      NotificationServices(FirebaseFirestore.instance),
      permanent: true)
      .init();
  await Get.put<UserServices>(
          UserServices(FirebaseFirestore.instance, FirebaseAuth.instance),
          permanent: true)
      .init();
}
