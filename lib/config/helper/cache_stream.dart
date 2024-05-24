import 'dart:async';

class StreamCache<T> {
  T? _cachedData;
  late StreamController<T> _streamController;

  StreamCache() {
    _streamController = StreamController<T>.broadcast(
      onListen: () {
        if (_cachedData != null) {
          _streamController.add(_cachedData!);
        }
      },
    );
  }

  Stream<T> get stream => _streamController.stream;

  void addToCache(T data) {
    _cachedData = data;
    _streamController.add(data);
  }

  void dispose() {
    _streamController.close();
  }
}