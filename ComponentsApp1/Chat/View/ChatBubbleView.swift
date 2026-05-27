//
//  ChatBubbleView.swift
//  ComponentsApp1
//

import SwiftUI

struct ChatBubbleView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isFromCurrentUser { Spacer() }

            Text(message.text)
                .padding(12)
                .background(message.isFromCurrentUser ? Color.blue : Color.gray.opacity(0.3))
                .foregroundColor(message.isFromCurrentUser ? .white : .primary)
                .cornerRadius(16)

            if !message.isFromCurrentUser { Spacer() }
        }
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}
