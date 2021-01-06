import 'package:band_names_app/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: Text("ServerStatus: ${socketService.serverStatus}"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.socket.emit('emitir-mensaje', {"mensaje":'quesito', "mensaje2":'atun'});
        },
        child: Icon(Icons.send),
        elevation: 1,
      ),
    );
  }
}
