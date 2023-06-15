
abstract class Services<T> {
  Future<void> create(T t) async {}

  Future<List<T>?> read() async {
    return [];
  }

  Future<void> update(T t) async {}

  Future<void> remove(String id) async {}
}

