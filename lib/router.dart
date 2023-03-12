// import 'package:client/di.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppRouter {
//   /// Converts: navigating to a named route -> that actual route.
//   Route onGenerateRoute(RouteSettings routeSettings) {
//     Widget page;
//     // Arguments passed to a named route.
//     final args = routeSettings.arguments as Map<String, dynamic>?;
//     switch (routeSettings.name) {
//       case "/open":
//         page = const OpenScreen();
//         break;
//       case "/onboarding":
//         page = ShowcaseScreen(
//           isRewatching: args!["isRewatching"],
//         );
//         break;
//       case "/login":
//         page = const LoginScreen();
//         break;
//       case "/register":
//         page = const RegistrationScreen();
//         break;
//       case "/home": //! Most of the (main) screens are tabs under the /home named route. Thus, should have their BLoC/Cubit providers here.
//         page = MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               lazy: false,
//               create: (context) => sl<ProfileCubit>()..loadProfile(),
//             ),
//           ],
//           child: const HomeScreen(),
//         );
//         break;
//       default:
//         throw Exception("Named route ${routeSettings.name} not defined");
//     }
//     return MaterialPageRoute(
//       fullscreenDialog: false,
//       settings: routeSettings,
//       builder: (_) => page,
//     );
//   }
// }
