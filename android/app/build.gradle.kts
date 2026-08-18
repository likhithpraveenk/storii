import com.android.build.api.variant.FilterConfiguration.FilterType
import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android plugin.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.likhithpraveenk.storii"
    compileSdk = 37
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.likhithpraveenk.storii"
        minSdk = 24
        targetSdk = 37
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
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
            optimization {
                enable = true
            }
            signingConfig = when {
                System.getenv("KEY_ALIAS") != null -> signingConfigs.getByName("release")
                keystorePropertiesFile.exists() -> signingConfigs.getByName("release")
                else -> {
                    println("WARNING: No signing credentials found. Building unsigned apk")
                    null
                }
            }
        }
        debug {
            applicationIdSuffix = ".debug"
            versionNameSuffix = " (Debug)"
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    dependenciesInfo {
        includeInApk = false
        includeInBundle = false
    }
}

val abiCodes = mapOf("armeabi-v7a" to 1, "arm64-v8a" to 2, "x86_64" to 3)
androidComponents {
    onVariants { variant ->
        variant.outputs.forEach { output ->
            val abi = output.filters.find { it.filterType == FilterType.ABI }?.identifier
            val abiVersionCode = abiCodes[abi]
            if (abiVersionCode != null) {
                val currentCode = output.versionCode.get()
                output.versionCode.set(currentCode * 10 + abiVersionCode)
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
