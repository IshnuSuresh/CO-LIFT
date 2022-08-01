//
//  HealthDataView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-29.
//

import SwiftUI

class userInformation: ObservableObject{
    @Published var selectedHoursOfSleep:Int = 0
    @Published var selectedMinutesOfExercise:Int = 0
    @Published var selectedAmountOfDrinks:Int = 0
    @Published var yesterdayHoursOfSleep:Int = 0
    @Published var yesterdayMinutesOfExercise:Int = 0
    @Published var yesterdayAmountOfDrinks:Int = 0
    @Published var consistentDays:Int = 0
}

struct HealthDataView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var Information: userInformation
    
    @State var Counter: Int = 0
    
    var hours = Array(0...12)
    var minutes = Array(0...120)
    var drinks = Array(0...10)
    
    var body: some View {
        VStack{
            Text("Please Enter Your Health Data")
                .foregroundColor(.black)
                .font(.custom("RobotoSlab-Regular", size: 30))
                .multilineTextAlignment(.center)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .foregroundColor(.black)
                .font(.custom("RobotoSlab-Regular", size: 15))
                .multilineTextAlignment(.center)
                .padding(.top, 1)
            Spacer()
            Spacer()
            VStack{
                Text("For How Many Hours Did You Sleep Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 60.0)
                    .frame(width: 375.0)
                
                Picker("Hours of Sleep", selection: $Information.selectedHoursOfSleep){
                    ForEach(hours, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Hour(s) of Sleep")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .background(Color("Turquoise"))
                Spacer()
                Text("For How Many Minutes Did You Exercise Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 30.0)
                    .frame(width: 375.0, height: 30.0)
                
                Picker("Minutes of Exercise", selection: $Information.selectedMinutesOfExercise){
                    ForEach(minutes, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Minute(s) of Exercise")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .background(Color("Turquoise"))
                Spacer()
                Text("How Many Drinks Did You Have Today?")
                    .foregroundColor(.black)
                    .font(.custom("RobotoSlab-Regular", size: 15))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 90.0)
                
                Picker("Alcohol Intake", selection: $Information.selectedAmountOfDrinks){
                    ForEach(drinks, id: \.self) {
                        Text("\($0.formatted(.number.grouping(.never))) Drink(s)")
                        }
                }
                .frame(width:375, height: 100.0)
                .pickerStyle(MenuPickerStyle())
                .background(Color("Turquoise"))
                Spacer()
                
            }
            Button {
                if Information.selectedHoursOfSleep >= Information.yesterdayHoursOfSleep && Information.selectedMinutesOfExercise >= Information.yesterdayMinutesOfExercise && Information.selectedAmountOfDrinks <= Information.yesterdayAmountOfDrinks{
                    Information.consistentDays += 1
                }
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

struct HealthDataView_Previews: PreviewProvider {
    static var previews: some View {
        HealthDataView(viewRouter: ViewRouter(), Information: userInformation())
    }
}
