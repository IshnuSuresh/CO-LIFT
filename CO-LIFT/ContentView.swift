//
//  ContentView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var appViewModel: AppViewModel

    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View{
        NavigationView{
            if appViewModel.signedIn{
                if isActive{
                    GameView(viewRouter: viewRouter, appViewModel: appViewModel)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                } else{
                    splash
                }
            } else {
                if isActive{
                    content
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                } else {
                    splash
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            appViewModel.signedIn = appViewModel.userIsLoggedIn
        }
    }
    
    var splash: some View{
        ZStack {
            Color("Turquoise").ignoresSafeArea()
            VStack{
                VStack{
                    Image("logo")
                        .onAppear{
                            withAnimation(.easeIn(duration: 2.0)) {
                                self.size = 2.0
                                self.opacity = 1.0
                        }
                    }
                }
                .scaleEffect(size)
                .opacity(opacity)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                }
            }
        }
    }
}
    
    var content: some View {
        ZStack{
            Color("Turquoise").ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("CO-LIFT")
                    .foregroundColor(.white)
                    .font(.custom("RobotoSlab-Bold", size: 60.0))
                Spacer()
                Image("LandingPageIllustration").resizable().scaledToFit()
                Spacer()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .foregroundColor(.white)
                    .font(.custom("RobotoSlab-Regular", size: 25.0))
                    .frame(width: 350.0)
                Spacer()
                
                Button {
                    viewRouter.currentPage = .SignUp
                } label: {
                    Text("Get Started")
                        .foregroundColor(Color("Turquoise"))
                        .font(.custom("RobotoSlab-Bold", size: 25.0))
                        .padding(.all, 20.0)
                        .padding(.horizontal, 30.0)
                        .background(Color.white).cornerRadius(25.0)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), appViewModel: AppViewModel())
    }
}
