// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {

  public enum Camera {
    public enum Permission {
      /// Please allow access to your camera to take photos
      public static let subtitle = Strings.tr("Localizable", "Camera.Permission.Subtitle")
      /// Camera Access
      public static let title = Strings.tr("Localizable", "Camera.Permission.Title")
    }
  }

  public enum Location {
    public enum Permission {
      /// We wants to access your location only to provide a better experience by helping you find new friends nearby.
      public static let subtitle = Strings.tr("Localizable", "Location.Permission.Subtitle")
      /// Enable location services
      public static let title = Strings.tr("Localizable", "Location.Permission.Title")
    }
  }

  public enum PushNotification {
    public enum Permission {
      /// Enable push notifications to let send you personal news and updates.
      public static let subtitle = Strings.tr("Localizable", "PushNotification.Permission.Subtitle")
      /// Enable push notifications
      public static let title = Strings.tr("Localizable", "PushNotification.Permission.Title")
    }
  }

  public enum Settings {
    public enum Permissions {
      /// Go to Settings
      public static let primaryAction = Strings.tr("Localizable", "Settings.Permissions.PrimaryAction")
      /// To continue, is necessary have access to Camera, Notifications and Location. Give them to enjoy the best experience on Reddit Memes
      public static let subtitle = Strings.tr("Localizable", "Settings.Permissions.Subtitle")
      /// Permission access
      public static let title = Strings.tr("Localizable", "Settings.Permissions.Title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
