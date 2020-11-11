import 'package:correct/utils/simple_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class PathRouter {
  final List<RoutePath> paths;
  final Widget notFoundRoute;
  PathRouter({
    @required this.paths,
    @required this.notFoundRoute,
  });

  Route onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name);
    for (var i = 0; i < paths.length; i++) {
      if (paths[i].match(uri)) {
        return SimpleRoute(
          builder: (context) => paths[i].navigate(uri),
          settings: settings,
        );
      }
    }
    return SimpleRoute(
      builder: (context) => notFoundRoute,
      settings: RouteSettings(
        name: "/404",
      ),
    );
  }
}

class RoutePath {
  final String path;
  final Widget Function(PathData data) route;

  RoutePath({
    @required this.path,
    @required this.route,
  });

  bool match(Uri uri) {
    final pathUri = Uri.parse(path);
    if (pathUri.pathSegments.length != uri.pathSegments.length) return false;
    for (var i = 0; i < pathUri.pathSegments.length; i++) {
      final segment = pathUri.pathSegments[i];
      if (!segment.startsWith(":")) {
        if (segment != uri.pathSegments[i]) return false;
      }
    }
    return true;
  }

  Widget navigate(Uri uri) {
    if (!match(uri)) throw Exception("Navigation cannot be successful");
    final data = Map<String, String>();
    final pathUri = Uri.parse(path);
    for (var i = 0; i < pathUri.pathSegments.length; i++) {
      final segment = pathUri.pathSegments[i];
      if (segment.startsWith(":")) {
        data.putIfAbsent(segment.substring(1), () => uri.pathSegments[i]);
      }
    }
    return route(PathData(data));
  }
}

class PathData {
  final Map<String, String> _map;

  PathData(this._map);

  bool getBool(String key) {
    return _map[key] == "true";
  }

  String getString(String key) {
    return _map[key];
  }

  int getInt(String key) {
    return int.tryParse(_map[key]);
  }
}
