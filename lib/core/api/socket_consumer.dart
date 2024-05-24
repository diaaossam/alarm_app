import 'package:alarm_app/config/environment/environment_helper.dart';
/*
import 'package:socket_io_client/socket_io_client.dart' as socket_io;


class SocketApi{

  socket_io.Socket  initSocketApi() {
    socket_io.Socket client = socket_io.io(Environment.socketBaseUrl, {
      'transports': ['websocket'],
      'autoConnect': true
    });
    client.connect();
    client.onConnect((data) {
      print("---------------connected");
    });
    return client;
  }

}

class SocketConsumer {

  late socket_io.Socket client;

  SocketConsumer({required this.client});


  Future<dynamic> disconnectSocket()async {
    client.disconnect();
    client.onDisconnect((data) {});
  }

  Future<dynamic> listenToEvent({required String eventName}) {
    dynamic data;
    client.on(eventName, (dataFromCallBack) => data = dataFromCallBack);
    return data;
  }

  Future<dynamic> emitEvent({required String eventName,Map<String,dynamic> ? json})async {
    client.emit(eventName, json);
    return eventName;
  }
}

*/
