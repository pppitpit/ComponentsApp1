//
//  ChatViewModel.swift
//  ComponentsApp1
//

import Combine
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText: String = ""

    init() {
        loadSampleMessages()
    }

    func sendMessage() {
        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let message = ChatMessage(text: trimmed, isFromCurrentUser: true)
        messages.append(message)
        inputText = ""

        simulateReply()
    }

    private func simulateReply() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            let reply = ChatMessage(text: "Thanks for your message!", isFromCurrentUser: false)
            self?.messages.append(reply)
        }
    }

    private func loadSampleMessages() {
        messages = [
            ChatMessage(text: "Hi there! Welcome to the chat.", isFromCurrentUser: false),
            ChatMessage(text: "Hello! Thanks for having me.", isFromCurrentUser: true),
            ChatMessage(text: "How can I help you today?", isFromCurrentUser: false)
        ]
    }
}
