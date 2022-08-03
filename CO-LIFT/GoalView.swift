//
//  GoalView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-08-02.
//

import SwiftUI

struct GoalView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var Information: userInformation
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                Text("Please Enter Your SMART Goal")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Bold", size: 30))
                .multilineTextAlignment(.center)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.top, 1)
            }
            VStack {
                Text("What Would You Like To Acheive With CO-LIFT?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .frame(width: 375, height: 75)
                
                ZStack{
                    TextEditor(text: $Information.goal)
                    Text(Information.goal).opacity(0.0).padding(.all, 8)
                }
                .frame(width: 375, height: 300)
                .border(Color.black, width: 3.0)
                .background(Color.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            }
            Spacer()
            Button {
                Information.addData(dateOfBirth: Information.dateOfBirth, didUserExercise: Information.didUserExercise, didUserMeditate: Information.didUserMeditate, email: Information.email, goal: Information.goal, hoursSlept: Information.selectedHoursOfSleep, minutesExercised: Information.selectedMinutesOfExercise, name: Information.name, numberOfDaysConsistent: Information.consistentDays, numberOfDrinksConsumed: Information.selectedAmountOfDrinks, tasksCompleted: Information.tasksCompleted)
                viewRouter.currentPage = .Progression
            } label: {
                Text("Confirm")
                    .foregroundColor(.white)
                    .font(.custom("RobotoSlab-Regular", size: 20))
            }
            .padding(.all, 20)
            .padding(.horizontal, 70)
            .background(Color.black)
            Spacer()
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(viewRouter: ViewRouter(), Information: userInformation())
    }
}
