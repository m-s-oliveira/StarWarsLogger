//
//  StarWarsLogger.swift
//  StarWars
//
//  Created by Matheus Oliveira on 07/08/23.
//

import OSLog

/// Enum containing privary level for  ` OSLogMessage`.
///
/// Note: Different than `OSLogPrivacy`, this can be used allong with a generic logger layer.
enum StarWarsLoggerPrivacyLevel {
    case auto, `public`, `private`, sensitive
}

/// Logging wrapper layer.
class StarWarsLogger<category: Any> {
    
    // MARK: - Public Methods
        
    static func log(_ message: String, privacy: StarWarsLoggerPrivacyLevel = .public) {
        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: category.self))
        
        switch privacy {
        case .auto:
            logger.log(level: .default, "\(message, privacy: .auto)")
            
        case .private:
            logger.log(level: .default, "\(message, privacy: .private)")
            
        case .public:
            logger.log(level: .default, "\(message, privacy: .public)")
            
        case .sensitive:
            logger.log(level: .default, "\(message, privacy: .sensitive)")
        }
    }
}
