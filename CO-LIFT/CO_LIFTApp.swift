//
//  CO_LIFTApp.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-26.
//
import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CO_LIFTApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var Information = userInformation()
    @StateObject var appViewModel = AppViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter, Information: Information, appViewModel: appViewModel)
        }
    }
}
