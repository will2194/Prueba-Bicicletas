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
            if session.isLoggedIn {
                let repository = StationRepositoryImpl()
                let useCase = GetStationsUseCase(repository: repository)
                let homeVM = HomeViewModel(getStationsUseCase: useCase, session: session)
                HomeView(viewModel: homeVM).environmentObject(session)
            } else {
                let repository = LoginRepositoryImpl()
                let useCase = LoginUseCaseImpl(repository: repository)
                let registerUseCase = RegisterUseCaseImpl(repository: repository)
                let viewModel = LoginViewModel(loginUseCase: useCase, session: session)
                let registerViewModel = RegisterViewModel(registerUseCase: registerUseCase, session: session)
                LoginView(viewModel: viewModel, registerViewModel: registerViewModel).environmentObject(session)
            }
        }
    }
}
