import UIKit
import Flutter
import GoogleMaps
import flutter_config

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let key: String = FlutterConfigPlugin.env(for: 'AIzaSyDDePftEcwsO_3FbqR5L6PEFKZy0_i5tao')
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(key)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
