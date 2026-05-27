//
//  ChatMessage.swift
//  ComponentsApp1
//

import Foundation

struct ChatMessage: Identifiable {
    let id: UUID
    let text: String
    let isFromCurrentUser: Bool
    let timestamp: Date

    init(id: UUID = UUID(), text: String, isFromCurrentUser: Bool, timestamp: Date = Date()) {
        self.id = id
        self.text = text
        self.isFromCurrentUser = isFromCurrentUser
        self.timestamp = timestamp
    }
}
