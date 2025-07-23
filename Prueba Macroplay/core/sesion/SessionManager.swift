//
//  SessionManager.swift
//  Prueba Macroplay
//
//  Created by William Vidal on 22/07/25.
//

import Foundation
import FirebaseAuth
import Combine

class SessionManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
        
        Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            print("Error al cerrar sesión: \(error.localizedDescription)")
        }
    }
}
