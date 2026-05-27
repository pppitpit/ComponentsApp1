//
//  TabBarViewModel.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 17/5/2565 BE.
//

import Combine
import Core
import Login
import RollingCounter
import SeeMore
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var currentTab: Tabs = .home
    @Published var isLogin: Bool = false
    private var anyCancellable: Set<AnyCancellable> = .init()

    init() {
        subscribeIsLogin()
    }

    private func subscribeIsLogin() {
        LoginManager.shared.isLogin
            .assign(to: \.isLogin, on: self)
            .store(in: &anyCancellable)
    }

    func login() {
        let scene = LoginScene.login
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }

    func logout() {
        LoginManager.shared.logout()
    }

    func goRolling() {
        let scene = RollingCounterScene.rolling
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }

    func seeMore() {
        let scene = SeeMoreScene.seeMore
        let transition: SceneTransitionType = .present(scene: scene, animated: true)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }

    func chat() {
        let scene = ChatScene.chat
        let transition: SceneTransitionType = .present(scene: scene, animated: true, presentationStyle: .pageSheet)
        let coordinator = SceneCoordinator()
        coordinator.transition(type: transition)
    }
}
