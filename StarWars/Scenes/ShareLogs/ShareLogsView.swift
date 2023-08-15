//
//  ShareLogsView.swift
//  StarWars
//
//  Created by Matheus Oliveira on 08/08/23.
//

import SwiftUI

struct ShareLogsView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject private var viewModel: ShareLogsViewModel = .init()
    
    private var textStyle = UIFont.TextStyle.body
    
    // MARK: - View
    
    var body: some View {
        
        if viewModel.logs.isEmpty {
            ProgressView()
        }
        
        VStack {
            TextView(text: viewModel.logs,
                     textStyle: textStyle)
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                viewModel.copyToClipboard()
            }) {
                Text("Copy to clipboard")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        
        .task {
            viewModel.loadLogs()
        }
    }
}

// MARK: - Preview

struct ShareLogsView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLogsView()
    }
}
