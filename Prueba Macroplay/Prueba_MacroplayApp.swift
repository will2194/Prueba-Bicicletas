//
//  Prueba_MacroplayApp.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import SwiftUI

@main
struct Prueba_MacroplayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            let repository = LoginRepositoryImpl()
            let useCase = DefaultLoginUseCase(repository: repository)
            let viewModel = LoginViewModel(loginUseCase: useCase, session: session)
            LoginView(viewModel: viewModel).environmentObject(session)
        }
    }
}
