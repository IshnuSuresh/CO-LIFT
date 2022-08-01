//
//  ViewRouter.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-28.
//

import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage:Page = .GetStarted
}

enum Page{
    case GetStarted
    case Progression
    case MyJourney
    case Tasks
    case SignUp
    case Timer
    case HealthData
    case Login
}
