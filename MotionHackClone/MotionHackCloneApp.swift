//
//  MotionHackCloneApp.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import SwiftUI

@main
struct MotionHackCloneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
