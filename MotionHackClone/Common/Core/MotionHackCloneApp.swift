//
//  MotionHackCloneApp.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MotionHackCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    GIDSignIn.sharedInstance.handle(url)
                })
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
