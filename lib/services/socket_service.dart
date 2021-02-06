import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket; 

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('https://flutter-socket-server-votes.herokuapp.com/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // socket.onConnect((_) {
    //   print('connect');
    // });


    _socket.on('connect', (_){
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    // socket.onDisconnect((_) => print('disconnect'));

    _socket.on('disconnect', (_){
      print('disconnect queso');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });


    // socket.on('nuevo-mensaje', (payload){
    //   print('nuevo mensaje: $payload');
    //   print('contenido: ${payload["mensaje"]}');
    //   print( payload.containsKey('mensaje2') ? payload['mensaje2'] : "no hay");
    // });

    // _socket.on('active-bands',(bands){

    // });
  }
}
