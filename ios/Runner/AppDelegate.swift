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
    let key: String = FlutterConfigPlugin.env(for: 'AIzaSyBWwLApDrWgzxqZYw4ONQyi3RbBIwy2Hd8')
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(key)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
