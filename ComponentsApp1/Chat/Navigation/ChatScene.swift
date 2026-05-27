//
//  ChatScene.swift
//  ComponentsApp1
//

import Core
import SwiftUI

enum ChatScene {
    case chat
}

extension ChatScene: SceneType {
    func viewController() -> UIViewController {
        switch self {
        case .chat:
            let viewController = UIHostingController(rootView: ChatView())
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isHidden = true
            return navigationController
        }
    }
}

extension ChatScene {
    func dismiss() {
        let transition: SceneTransitionType = .dismiss(animated: true)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
