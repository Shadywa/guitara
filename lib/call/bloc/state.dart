import 'package:equatable/equatable.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

// Call states: ابتدائي، جاري الاتصال، متصل، انتهت المكالمة، خطأ
abstract class CallsState extends Equatable {
  const CallsState();
  @override
  List<Object?> get props => [];
}

class CallInitial extends CallsState {}                  // الحالة الابتدائية قبل أي فعل
class CallLoading extends CallsState {}                  // جاري الانضمام إلى المكالمة
class CallConnected extends CallsState {                 // المكالمة متصلة و نشطة
  final Call call;
  const CallConnected(this.call);
  @override
  List<Object?> get props => [call];
}
class CallEnded extends CallsState {}                    // انتهت المكالمة
class CallError extends CallsState {                     // خطأ أثناء الانضمام
  final String error;
  const CallError(this.error);
  @override
  List<Object?> get props => [error];
}
