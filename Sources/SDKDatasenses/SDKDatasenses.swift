// The Swift Programming Language
// https://docs.swift.org/swift-book

import Datasenses_iOS
import Firebase
import FirebaseAnalytics
import UIKit

public final class SDKDatasenses {
    private static let shared = SDKDatasenses()

    private var datasensesInstance: DatasensesInstance!

    private var configs: SDKDatasensesConfig!

    public static func initialize(with configs: SDKDatasensesConfig, application: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
        shared.configs = configs
        Datasenses.initialize(apiKey: configs.key, launchOptions: options, firebaseOptionsFileName: configs.firebasePlistFile)
        shared.datasensesInstance = Datasenses.shared()
        shared.datasensesInstance.loggingEnabled = configs.debugMode
        shared.datasensesInstance.updatePostbackConversionValue(1)
        shared.datasensesInstance.flushInterval = 5 // second
        _ = shared.datasensesInstance.application(application, didFinishLaunchingWithOptions: options)
    }

    public static func trackEvent(_ eventName: String, with properties: [String: Any] = [:]) {
        if shared.configs.enabled == true {
            let props = properties.mapValues {
                if let value = $0 as? DatasensesType {
                    return value
                }
                return ""
            }
            shared.datasensesInstance?.track(event: eventName, properties: props)

            if FirebaseApp.app() != nil {
                Analytics.logEvent(eventName, parameters: properties)
            }
        }
    }

    public static func updateEnableTracking(_ value: Bool) {
        shared.configs.updateEnabled(value)
    }

    public static func handleUrl(_ url: URL) {
        shared.datasensesInstance?.handleUrl(UIApplication.shared, url: url, options: nil)
    }
}
