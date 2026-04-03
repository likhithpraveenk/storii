# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Suppress Play Core warnings
-dontwarn com.google.android.play.core.**

# Preserve crash report info
-keepattributes SourceFile,LineNumberTable,Signature,EnclosingMethod,InnerClasses

# Flutter
-keep class io.flutter.** { *; }
