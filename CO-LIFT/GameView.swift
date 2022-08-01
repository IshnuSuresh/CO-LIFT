//
//  GameView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-27.
//

import Foundation

import SwiftUI

struct GameView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var appViewModel: AppViewModel
    
    var body: some View {
        
        GeometryReader{geometry in
            
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Image("weather")
                            .padding(.leading)
                            .padding(.bottom)
                        Spacer()
                        Button {
                            appViewModel.signOut()
                            viewRouter.currentPage = .Login
                        } label: {
                            Image("profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.trailing)
                                .padding(.bottom)
                        }
                    }
                    Spacer()
                    Text("CO-LIFT")
                        .foregroundColor(.black)
                        .font(.custom("RobotoSlab-Bold", size: 60.0))
                        .multilineTextAlignment(.center)
                    
                    Text("Grow Your Tree By Completing Your Tasks. Don't Let Your Tree Die.")
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0)
                    Spacer()
                    Image("tree")
                        .resizable()
                        .scaledToFit()
                        .position(x: 190, y: 280)
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewRouter: ViewRouter(), appViewModel: AppViewModel())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage:Page
    let width,height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top)
            Text(tabName)
                .font(.custom("RobotoSlab-Bold", size: 13.0))
            Spacer()
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color(.black): .gray)
    }
}
