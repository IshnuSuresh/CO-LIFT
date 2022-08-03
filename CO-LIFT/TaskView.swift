//
//  TaskView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-28.
//

import SwiftUI

struct TaskView: View {
    
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var Information: userInformation
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Image("profile")
                            .resizable()
                            .padding(.trailing)
                            .frame(width: geometry.size.width/7, height: geometry.size.height/20)
                    }
                    Text("CO-LIFT")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Bold", size: 60.0))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 1.0)
                    
                    Text("Your Tasks For The Day!")
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0)
                        .font(.custom("RobotoSlab-Regular", size: 15.0))
                    HStack{
                        Image("TaskViewImage")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                        Spacer()
                        VStack{
                            Spacer()
                            Text("Today's Goals")
                                .font(.custom("RobotoSlab-Bold", size: 15.0))
                            ZStack{
                                Circle()
                                    .stroke(.white, lineWidth: 10.0)
                                    .frame(width: geometry.size.width/4, height: geometry.size.height/9)
                                
                                Circle()
                                    .trim(from: 0.0, to: Information.circleProgress)
                                    .stroke(.black, lineWidth: 10.0)
                                    .frame(width: geometry.size.width/4, height: geometry.size.height/9)
                                    .rotationEffect(Angle(degrees: -90))
                                
                                Text("\(Int(self.Information.circleProgress*100))%")
                                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(width: geometry.size.width/1.1, height: geometry.size.height/5)
                    .background(Rectangle().foregroundColor(Color("Turquoise")))
                    .cornerRadius(30.0)
                    
                    HStack{
                        VStack{
                           Text("Exercise For 30 Minutes")
                                .font(.custom("RobotoSlab-Regular", size: 20.0))
                                .multilineTextAlignment(.center)
                            
                            
                            if Information.didUserExercise == false{
                                Button {
                                    Information.numberOfTasksCompleted += 1
                                    viewRouter.currentPage = .Timer
                                    Information.didUserExercise = true
                                    Information.circleProgress = CGFloat(Information.numberOfTasksCompleted / 4)
                                } label: {
                                    Text("Start!")
                                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 40)
                                        .background(Color.white)
                                        .foregroundColor(Color("Turquoise"))
                                        .cornerRadius(20)
                                }
                            } else {
                                Text("Completed!")
                                    .font(.custom("RobotoSlab-Regular", size: 18.0))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                            }

                        }
                        .frame(width: geometry.size.width/2.2, height: geometry.size.height/5)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        
                        VStack{
                            Text("Meditate For 10 Minutes")
                                 .font(.custom("RobotoSlab-Regular", size: 18.0))
                                 .multilineTextAlignment(.center)
                             
                            if Information.didUserMeditate == false{
                                Button {
                                    viewRouter.currentPage = .Timer
                                    Information.numberOfTasksCompleted += 1
                                    Information.didUserMeditate = true
                                    Information.circleProgress = CGFloat(Information.numberOfTasksCompleted / 4)
                                } label: {
                                    Text("Start!")
                                        .font(.custom("RobotoSlab-Regular", size: 20.0))
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 40)
                                        .background(Color.white)
                                        .foregroundColor(Color("Turquoise"))
                                        .cornerRadius(20)
                                }
                            } else{
                                Text("Completed!")
                                    .font(.custom("RobotoSlab-Regular", size: 18.0))
                                    .padding(.vertical, 10)
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: geometry.size.width/2.2, height: geometry.size.height/5)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                    }
                    
                    HStack{
                        VStack{
                           Text("Visit Your Local Park!")
                                .font(.custom("RobotoSlab-Regular", size: 20.0))
                                .multilineTextAlignment(.center)
                            
                            Button {
                                print("")
                            } label: {
                                Text("Let's Go!")
                                    .font(.custom("RobotoSlab-Regular", size: 20.0))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 40)
                                    .background(Color.white)
                                    .foregroundColor(Color("Turquoise"))
                                    .cornerRadius(20)
                            }

                        }
                        .frame(width: geometry.size.width/2.2, height: geometry.size.height/5)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                        
                        VStack{
                            Text("Reach Out To A Family Member!")
                                 .font(.custom("RobotoSlab-Regular", size: 20.0))
                                 .multilineTextAlignment(.center)
                             
                             Button {
                                 print("")
                             } label: {
                                 Text("Call Someone!")
                                     .font(.custom("RobotoSlab-Regular", size: 20.0))
                                     .padding(.vertical, 10)
                                     .padding(.horizontal, 15)
                                     .background(Color.white)
                                     .foregroundColor(Color("Turquoise"))
                                     .cornerRadius(20)
                             }
                        }
                        .frame(width: geometry.size.width/2.2, height: geometry.size.height/5)
                        .background(Rectangle().foregroundColor(Color("Turquoise")))
                        .cornerRadius(30.0)
                    }

                    
                    Spacer()
                    HStack{
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .Progression, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "arrow.up.arrow.down", tabName: "Progression")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .MyJourney, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "figure.walk", tabName: "My Journey")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .Tasks, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "list.bullet", tabName: "Tasks")
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("TabBackgroundColour"))
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(viewRouter: ViewRouter(), Information: userInformation())
    }
}
