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
    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        switch viewRouter.currentPage {
        case .GetStarted:
            ContentView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .MyJourney:
            GameView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .Progression:
            ProgressionView(viewRouter: viewRouter, Information: Information)
        case .Tasks:
            TaskView(viewRouter: viewRouter, Information: Information)
        case .SignUp:
            SignUpView(viewRouter: viewRouter, appViewModel: appViewModel, Information: Information)
        case .Timer:
            TimerView(viewRouter: viewRouter, timerManager: timerManager)
        case .HealthData:
            HealthDataView(viewRouter: viewRouter, Information: Information)
        case .Login:
            LoginView(viewRouter: viewRouter, appViewModel: appViewModel)
        case .Goal:
            GoalView(viewRouter: viewRouter, Information: Information)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), Information: userInformation(),appViewModel: AppViewModel(), timerManager: TimerManager())
    }
}
