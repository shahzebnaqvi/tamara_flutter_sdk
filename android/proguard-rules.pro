# Tamara Flutter SDK ProGuard Rules

# Keep TamaraPlugin class
-keep class co.tamara.sdk.TamaraPlugin { *; }

# Keep all Tamara SDK classes
-keep class co.tamara.sdk.** { *; }

# Keep Dagger generated classes
-keep class co.tamara.sdk.di.** { *; }

# Keep model classes
-keep class co.tamara.sdk.model.** { *; }

# Keep API classes
-keep class co.tamara.sdk.api.** { *; }

# Keep UI classes
-keep class co.tamara.sdk.ui.** { *; }

# Keep repository classes
-keep class co.tamara.sdk.repository.** { *; }

# Keep utility classes
-keep class co.tamara.sdk.util.** { *; }

# Keep VO classes
-keep class co.tamara.sdk.vo.** { *; }

# Keep error classes
-keep class co.tamara.sdk.error.** { *; }

# Keep logging classes
-keep class co.tamara.sdk.log.** { *; }

# Keep all public methods and fields
-keepclassmembers class co.tamara.sdk.** {
    public *;
}

# Keep serializable classes
-keepnames class * implements java.io.Serializable
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep Retrofit classes
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

# Keep Gson classes
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep OkHttp classes
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Keep Dagger classes
-keep class dagger.** { *; }
-keep class javax.inject.** { *; }
-keep class * extends dagger.Module
-keep class * extends dagger.Component

# Keep AndroidX Lifecycle classes
-keep class androidx.lifecycle.** { *; }

# Keep AndroidX Navigation classes
-keep class androidx.navigation.** { *; }

# Keep AndroidX AppCompat classes
-keep class androidx.appcompat.** { *; }

# Keep AndroidX Core classes
-keep class androidx.core.** { *; }

# Keep AndroidX ConstraintLayout classes
-keep class androidx.constraintlayout.** { *; }

# Keep AndroidX Flexbox classes
-keep class com.google.android.flexbox.** { *; }
