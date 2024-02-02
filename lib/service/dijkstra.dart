class DijkstraResult {
  final List<String> path;
  final double length;

  DijkstraResult(this.path, this.length);

  @override
  String toString() {
    return 'Path: $path\nLength: $length';
  }
}

DijkstraResult dijkstra(
    Map<String, Map<String, double>> graph, String start, String end) {
  Map<String, double> distances = {};
  Map<String, String?> previous = {};
  List<String> nodes = [];
  PriorityQueue<String> queue =
  PriorityQueue((a, b) => distances[a]!.compareTo(distances[b]!));
  double max = 100000000;

  // Initialize distances and queue
  for (var node in graph.keys) {
    if (node == start) {
      distances[node] = 0;
      queue.add(node);
    } else {
      distances[node] = max;
    }
    previous[node] = null;
    nodes.add(node);
  }

  while (!queue.isEmpty) {
    var smallest = queue.removeFirst();
    if (smallest == end) {
      List<String> path = [];
      double length = 0;
      while (previous[smallest] != null) {
        path.insert(0, smallest);
        length += graph[previous[smallest]]![smallest]!;
        smallest = previous[smallest]!;
      }
      path.insert(0, start);
      return DijkstraResult(path, length);
    }

    if (distances[smallest] == max) {
      continue;
    }

    for (var neighbor in graph[smallest]!.keys) {
      var alt = distances[smallest]! + graph[smallest]![neighbor]!;
      if (alt < distances[neighbor]!) {
        distances[neighbor] = alt;
        previous[neighbor] = smallest;
        queue.add(neighbor);
      }
    }
  }

  return DijkstraResult(
      [], 0); // Return an empty list if there is no path from start to end
}

class PriorityQueue<T> {
  final List<T> _list = [];
  final Comparator<T> _compare;

  PriorityQueue(this._compare);

  void add(T item) {
    _list.add(item);
    _list.sort(_compare);
  }

  T removeFirst() {
    return _list.removeAt(0);
  }

  bool get isEmpty => _list.isEmpty;
}
