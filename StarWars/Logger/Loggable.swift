//
//  Loggable.swift
//  StarWars
//
//  Created by Matheus Oliveira on 11/08/23.
//

import OSLog

protocol Loggable where Self: Any {

    func log(_ message: String, privacy: StarWarsLoggerPrivacyLevel )
    
    func log(_ message: String)
    
    func retrieveLogs() -> String
}

// MARK: - Loggable Implementation

extension Loggable {
    
    func log(_ message: String, privacy: StarWarsLoggerPrivacyLevel ) {
        StarWarsLogger<Self>.log(message, privacy: privacy)
    }

    func log(_ message: String) {
       StarWarsLogger<Self>.log(message, privacy: StarWarsLoggerPrivacyLevel.public)
    }
    
    func retrieveLogs() -> String {
        
        do {
            let store = try OSLogStore(scope: .currentProcessIdentifier)
            let position = store.position(timeIntervalSinceLatestBoot: 1)
            let logsArray =  try store
                .getEntries(at: position)
                .compactMap { $0 as? OSLogEntryLog }
                .filter { $0.subsystem == Bundle.main.bundleIdentifier! }
                .map { "[\($0.date.formatted())] [\($0.category)] \($0.composedMessage)" }
            var message = ""
            logsArray.forEach { log in
                message += "\(log) \n"
            }
            
            return !message.isEmpty ? message : "No logs were found."
            
        } catch {
            StarWarsLogger<Self>.log("An error was found while exporting logs: \(error.localizedDescription).", privacy: .public)
            return "Error retriving logs."
        }
    }
}
