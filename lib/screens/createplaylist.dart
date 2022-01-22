import 'package:flutter/material.dart';
class CreatePlaylist extends StatefulWidget {
  const CreatePlaylist({Key? key}) : super(key: key);

  @override
  _CreatePlaylistState createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {
  final songnameController = TextEditingController();
  final artistnameController = TextEditingController();
  final songdescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container();

  }
}
