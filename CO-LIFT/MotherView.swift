//
//  MotherView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-28.
//

import SwiftUI
struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var Information: userInformation
    @StateObject var appViewModel: AppViewModel
    
    var body: some View {
        switch viewRouter.currentPage {
        case .GetStarted:
            ContentView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .MyJourney:
            GameView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .Progression:
            ProgressionView(viewRouter: viewRouter, Information: Information)
        case .Tasks:
            TaskView(viewRouter: viewRouter)
        case .SignUp:
            SignUpView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .Timer:
            TimerView(viewRouter: viewRouter)
        case .HealthData:
            HealthDataView(viewRouter: viewRouter, Information: Information)
        case .Login:
            LoginView(viewRouter: viewRouter, appViewModel: appViewModel)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), Information: userInformation(),appViewModel: AppViewModel())
    }
}
