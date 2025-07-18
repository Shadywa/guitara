-keep class org.conscrypt.** { *; }
-dontwarn org.conscrypt.**

# احتفظ بكلاسات OkHttp
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**

# احتفظ بكلاسات WebRTC
-keep class org.webrtc.** { *; }
-dontwarn org.webrtc.**