import UIKit
import Flutter
import workmanager


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    WorkmanagerPlugin.register(with: self.registrar(forPlugin: "fetchArticles")!)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
