import 'package:courses_app/core/global/global.dart';
import 'package:courses_app/core/router/app_router.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await GlobalServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppRouter(0)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          AppRouter appRouter = context.read();
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // initialRoute: AppRoutesNames.mainPage, // for devolping only
            initialRoute: AppRoutesNames.welcome,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}


/*
Platform  Firebase App Id
web       1:444354708357:web:34c70072079a8abecdbaec
android   1:444354708357:android:71bceb095975fc4fcdbaec
ios       1:444354708357:ios:69047fc5b47f0c77cdbaec



Alias name: androiddebugkey
Creation date: Nov 6, 2023
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Mon Nov 06 16:44:41 EET 2023 until: Wed Oct 29 17:44:41 EEST 2053
Certificate fingerprints:
         SHA1: FF:75:24:77:7A:0C:BD:92:E9:EF:89:00:16:84:BE:59:A9:50:88:77
         SHA256: FD:0D:33:E3:4E:82:76:4A:FF:48:06:B4:64:55:99:8D:A4:45:77:97:40:92:BA:20:E6:69:08:26:3A:B8:BC:95
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk.

 */