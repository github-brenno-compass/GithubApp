//
//  ContentView.swift
//  Compass Github
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import GithubUI
import GithubKit
import AuthenticationApp
import HomeApp

struct ContentView: View {

    @Environment(\.viewResolver) var viewResolver

    @StateObject var viewModel = ViewModel()

    var body: some View {
        Group {
            if viewModel.isAuthenticated() {
                viewResolver(HomeAppScene.home(
                    HomeAppScene.Home()
                ))
            } else {
                viewResolver(AuthenticationAppScene.login(
                    AuthenticationAppScene.Login()
                ))
            }
        }
        .sceneAction(for: AuthenticationAppAction.self) {
            switch $0 {
            case .logout:
                viewModel.logout()
            case .authenticated:
                viewModel.objectWillChange.send()
            default:
                break
            }
        }
    }
}

extension ContentView {

    class ViewModel: ObservableObject {

        @Injected(\.getAuthorizationTokenUseCase) var getAuthorizationTokenUseCase
        @Injected(\.deleteAuthorizationTokenUseCase) var deleteAuthorizationTokenUseCase

        func isAuthenticated() -> Bool {
            do {
                _ = try getAuthorizationTokenUseCase()
                return true
            } catch {
                return false
            }
        }

        func logout() {
            try? deleteAuthorizationTokenUseCase()
            objectWillChange.send()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
