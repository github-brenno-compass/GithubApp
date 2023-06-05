//
//  Compass_GithubApp.swift
//  Compass Github
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import AuthenticationApp
import HomeApp
import GithubKit

@main
struct Compass_GithubApp: App {

    init() {
        Self.start()
    }

    var body: some Scene {

        WindowGroup {
            ContentView()
                .viewResolver(for: AuthenticationAppScene.self) {
                    AuthenticationAppResolver($0)
                }
                .viewResolver(for: HomeAppScene.self) {
                    HomeAppResolver($0)
                }
                .sceneActionEnabled()
        }
    }
}

extension Compass_GithubApp {

    @MainActor
    static func start() {
        AuthenticationApp.start()
        HomeApp.start()

        Container.shared.navigationBuilder.register {
            NavigationBuilder()
        }

        Container.shared.navigationSplitBuilder.register {
            NavigationSplitBuilder()
        }

        Container.shared.globalConstants.register {
            GlobalConstants()
        }
    }
}
