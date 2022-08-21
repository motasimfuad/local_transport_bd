import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_transport_bd/features/home/presentation/pages/home_page.dart';
import 'package:local_transport_bd/features/search_route/presentation/pages/search_result_page.dart';

import '../../features/search_route/presentation/pages/transport_detail_page.dart';

class AppRouter {
  static const String homePage = '/';
  static const String searchResultPage = 'search-route';
  static const String transportDetailPage = 'transport-detail';
}

class RouterParams {
  static const String id = 'id';
}

final router = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: AppRouter.homePage,
  routes: [
    // home page
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

    // search result page
    GoRoute(
        name: AppRouter.searchResultPage,
        path: '/${AppRouter.searchResultPage}',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SearchResultPage(),
          );
        },
        routes: [
          GoRoute(
            name: AppRouter.transportDetailPage,
            path: '${AppRouter.searchResultPage}/:id',
            pageBuilder: (context, state) {
              final id = state.params[RouterParams.id];

              return MaterialPage(
                key: state.pageKey,
                child: TransportDetailPage(
                  id: id!,
                ),
              );
            },
          ),
        ]),

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
