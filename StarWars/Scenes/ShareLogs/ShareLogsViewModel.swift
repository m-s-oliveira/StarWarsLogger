//
//  ShareLogsViewModel.swift
//  StarWars
//
//  Created by Matheus Oliveira on 08/08/23.
//

import UIKit

/// Handles business logic and iterations with `ShareLogsView`.
class ShareLogsViewModel: ObservableObject, Loggable {
    
    // MARK: - Public Properties
    
    /// Contains all loged data during the current execution.
    @Published var logs: String = ""
    
    // MARK: - Public Methods
    
    @MainActor
    func loadLogs() {
        logs = retrieveLogs()
    }
    
    func copyToClipboard() {
        UIPasteboard.general.string = logs
    }
}
