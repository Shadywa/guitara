// lib/call/bloc/bloc.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'event.dart';
import 'state.dart';

class CallBloc extends Bloc<CallEvent, CallsState> {
  final StreamVideo client;
  static const _roomId = 'test-room';

  CallBloc({required this.client}) : super(CallInitial()) {
    on<JoinCall>((event, emit) async {
      emit(CallLoading());
      try {
        // 1. طلب إذونات الكاميرا والمايك
        final cam = await Permission.camera.request();
        final mic = await Permission.microphone.request();
        if (!cam.isGranted || !mic.isGranted) {
          emit(CallError('Camera or microphone permission denied'));
          return;
        }

        // 2. إنشاء المكالمة باستخدام وضع التطوير
        final call = client.makeCall(
          callType: StreamCallType.development(), // ← هنا
          id: _roomId,
        );

        // 3. إنشاء/استرجاع الغرفة
        debugPrint('🟢 Calling getOrCreate() for room=$_roomId');
        await call.getOrCreate();
        debugPrint('🟢 getOrCreate() completed');

        // 4. الانضمام للمكالمة
        debugPrint('🟢 Joining call...');
        await call.join();
        debugPrint('🟢 join() completed, call state=${call.state.runtimeType}');

        emit(CallConnected(call));
      } catch (e, st) {
        debugPrint('🔴 Error in JoinCall: $e\n$st');
        emit(CallError('Error joining call: ${e.toString()}'));
      }
    });

    on<LeaveCall>((event, emit) async {
      if (state is CallConnected) {
        final call = (state as CallConnected).call;
        await call.leave();
        emit(CallEnded());
      }
    });
  }
}
