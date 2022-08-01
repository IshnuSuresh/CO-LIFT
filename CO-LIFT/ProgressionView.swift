//
//  ProgressionView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-29.
//

import SwiftUI

struct ProgressionView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var Information: userInformation
    
    var body: some View {
        GeometryReader{geometry in
            VStack{
                ScrollView{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Image("profile")
                                .resizable()
                                .padding(.trailing)
                                .frame(width: 55, height: 40)
                        }
                        VStack{
                            Text("CO-LIFT")
                                .foregroundColor(.black)
                                .font(.custom("RobotoSlab-Bold", size: 60.0))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 1.0)
                            Text("Keep Up The Great Work! You've Been Maintaining Consistency For \(Information.consistentDays) Days!")
                                .foregroundColor(.black)
                                .font(.custom("RobotoSlab-Regular", size: 20.0))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 1.0)
                        }
                        HStack{
                            Spacer()
                            Image(systemName: "bed.double")
                                .resizable()
                                .frame(width:70, height: 50)
                                .foregroundColor(.white)
                            Spacer()
                            VStack{
                                Text("You Slept For \(Information.selectedHoursOfSleep) Hours Today! \(Information.selectedHoursOfSleep - Information.yesterdayHoursOfSleep) Hours More Than Yesterday!")
                                    .foregroundColor(.white)
                                    .font(.custom("RobotoSlab-Regular", size: 17.0))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1.0)
                                    .padding(.trailing, 10.0)
                                
                                
                                Link(destination: URL(string: "https://www.headspace.com/sleep/how-to-sleep-better")!) {
                                    Text("How Do You Sleep Better?")
                                }
                                .padding(.all)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(20.0)
                                .font(.custom("RobotoSlab-Regular", size: 16.0))
                                
                            }
                        }
                        .frame(width: 375, height: 125)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        HStack{
                            Spacer()
                            Spacer()
                            Image(systemName: "figure.walk")
                                .resizable()
                                .frame(width: 50, height: 70)
                                .foregroundColor(.white)
                            Spacer()
                            VStack{
                                Text("You Exercised For \(Information.selectedMinutesOfExercise) Minutes Today! \(Information.selectedMinutesOfExercise - Information.yesterdayMinutesOfExercise) Minutes More Than Yesterday!")
                                    .foregroundColor(.white)
                                    .font(.custom("RobotoSlab-Regular", size: 14.0))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1.0)
                                    .padding(.trailing, 10.0)
                                HStack{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Link(destination: URL(string: "https://www.muscleandfitness.com/workout-plan/workouts/workout-routines/complete-mf-beginners-training-guide-plan/")!) {
                                        Text("What Are Some Exercises?")
                                    }
                                    .padding(.all)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(20.0)
                                    .font(.custom("RobotoSlab-Regular", size: 16.0))
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                        .frame(width: 375, height: 125)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        HStack{
                            Spacer()
                            Image("party")
                            Spacer()
                            VStack{
                                Spacer()
                                Text("Congrats! You've Decreased Your Alcohol Intake By \(Information.yesterdayAmountOfDrinks - Information.selectedAmountOfDrinks) Drink(s)!")
                                    .foregroundColor(.white)
                                    .font(.custom("RobotoSlab-Regular", size: 17.0))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1.0)
                                    .padding(.trailing, 10.0)
                                
                                Link(destination: URL(string: "https://www.healthline.com/health/alcohol/how-to-stop-drinking#change-it-up")!) {
                                    Text("How Do You Quit Drinking?")
                                }
                                .padding(.all)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(20.0)
                                .font(.custom("RobotoSlab-Regular", size: 16.0))
                                Spacer()
                            }
                        }
                        .frame(width: 375, height: 125)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        HStack{
                            Spacer()
                            Image(systemName: "brain")
                                .resizable()
                                .frame(width: 60, height: 50)
                                .foregroundColor(.white)
                            Spacer()
                            VStack{
                                Text("Mental Health Resources")
                                    .foregroundColor(.white)
                                    .font(.custom("RobotoSlab-Regular", size: 20.0))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1.0)
                                    .padding(.trailing, 10.0)
                                
                                Link(destination: URL(string: "https://www.ontario.ca/page/find-mental-health-support")!) {
                                    Text("Improve Your Mental Health")
                                }
                                .padding(.all)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(20.0)
                                .font(.custom("RobotoSlab-Regular", size: 16.0))
                            }
                            Spacer()
                        }
                        .frame(width: 375, height: 125)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        HStack{
                            Spacer()
                            Image(systemName: "person.fill.checkmark")
                                .resizable()
                                .frame(width: 60, height: 40)
                                .foregroundColor(.white)
                            Spacer()
                            VStack{
                                Text("Update Your Daily Infomration")
                                    .foregroundColor(.white)
                                    .font(.custom("RobotoSlab-Regular", size: 17.0))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 1.0)
                                    .padding(.trailing, 10.0)
                                
                                Button {
                                    Information.yesterdayHoursOfSleep = Information.selectedHoursOfSleep
                                    Information.yesterdayMinutesOfExercise = Information.selectedMinutesOfExercise
                                    Information.yesterdayAmountOfDrinks = Information.selectedAmountOfDrinks
                                    viewRouter.currentPage = .HealthData
                                } label: {
                                    Text("Update Now")
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                        .padding(.horizontal, 60)
                                        .background(.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(20.0)
                                        .font(.custom("RobotoSlab-Regular", size: 17.0))
                                }
                            }
                        }
                        .frame(width: 375, height: 120)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        
                    }
                }
                HStack{
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .Progression, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "arrow.up.arrow.down", tabName: "Progression")
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .MyJourney, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "figure.walk", tabName: "My Journey")
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .Tasks, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "list.bullet", tabName: "Tasks")
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBackgroundColour"))
                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView(viewRouter: ViewRouter(), Information: userInformation())
    }
}
