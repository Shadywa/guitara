import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:videocall/call/ui/contacts.dart';
import 'call/bloc/bloc.dart';
import 'call/bloc/event.dart';
import 'call/ui/call_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamVideo _client;
  bool _connected = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  Future<void> _initStream() async {
    final userId = 'user_${Random().nextInt(10000)}';
    final user = User.guest(userId: userId, name: userId);

    _client = StreamVideo('hhratxwe2n7d', user: user);

    final result = await _client.connect();
    if (result.isSuccess) {
      developer.log(result.toString());
      setState(() => _connected = true);
    } else {
      developer.log(result.toString());
      setState(() => _error = result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return MaterialApp(
        home: Scaffold(body: Center(child: Text('Connection error: $_error'))),
      );
    }
    if (!_connected) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return RepositoryProvider.value(
      value: _client,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CallBloc(client: _client)..add(JoinCall()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Group Video Call',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ContactsPage(),
        ),
      ),
    );
  }
}
