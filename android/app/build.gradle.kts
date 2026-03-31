import com.android.build.gradle.internal.api.ApkVariantOutputImpl
import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile: File? = rootProject.file("key.properties")
if (keystorePropertiesFile?.exists() ?: false) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.likhithpraveenk.storii"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.likhithpraveenk.storii"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        resValue("string", "app_name", "Storii")
    }

    signingConfigs {
        create("release") {
            keyAlias = System.getenv("KEY_ALIAS") ?: (keystoreProperties["keyAlias"] as String?)
            keyPassword =
                System.getenv("KEY_PASSWORD") ?: (keystoreProperties["keyPassword"] as String?)
            storePassword =
                System.getenv("STORE_PASSWORD") ?: (keystoreProperties["storePassword"] as String?)
            val keystorePath =
                System.getenv("KEYSTORE_PATH") ?: (keystoreProperties["storeFile"] as String?)
            storeFile = keystorePath?.let { file(it) }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = when {
                System.getenv("KEY_ALIAS") != null -> signingConfigs.getByName("release")
                keystorePropertiesFile?.exists() == true -> signingConfigs.getByName("release")
                else -> {
                    println("WARNING: No signing credentials found. Building unsigned apk")
                    null
                }
            }
        }
        debug {
            applicationIdSuffix = ".debug"
            resValue("string", "app_name", "Storii (Debug)")
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.material:material:1.13.0")
}
