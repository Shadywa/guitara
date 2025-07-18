// lib/call/ui/call_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CallBloc, CallsState>(
      listener: (context, state) {
        if (state is CallEnded) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<CallBloc, CallsState>(
          builder: (context, state) {
            if (state is CallLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is CallError) {
              return Center(
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is CallConnected) {
              final call = state.call;

              return Stack(
                children: [
                  // يملأ حاوية الفيديو كامل الشاشة
                  Positioned.fill(child: StreamCallContainer(call: call)),

                  // زر إنهاء المكالمة
                  Positioned(
                    bottom: 32,
                    left: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.call_end, color: Colors.white),
                      label: const Text(
                        'End Call',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        context.read<CallBloc>().add(LeaveCall());
                      },
                    ),
                  ),
                ],
              );
            }
            // الحالة الأولية أو غير معروفة
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
