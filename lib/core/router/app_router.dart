import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_transport_bd/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String homePage = '/';
  static const String allProductsPage = 'products';
}

class RouterParams {
  static const String id = 'id';
}

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: AppRouter.homePage,
  routes: [
    GoRoute(
      name: AppRouter.homePage,
      path: AppRouter.homePage,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
    ),

    // countries
    // GoRoute(
    //   name: AppRouter.allCountriesPage,
    //   path: '/${AppRouter.allCountriesPage}',
    //   pageBuilder: (context, state) {
    //     return MaterialPage(
    //       key: state.pageKey,
    //       child: const AllCountriesPage(),
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //         name: AppRouter.countryPage,
    //         path: ':${RouterParams.id}',
    //         pageBuilder: (context, state) {
    //           final countryId = state.params[RouterParams.id];
    //           return MaterialPage(
    //             // key: state.pageKey,
    //             child: CountryPage(id: int.parse(countryId.toString())),
    //           );
    //         }),
    //   ],
    // ),
  ],
);
