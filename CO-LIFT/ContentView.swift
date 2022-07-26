//
//  ContentView.swift
//  CO-LIFT
//
//  Created by Ishnu Suresh on 2022-07-26.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
        NavigationView{
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
                    NavigationLink(destination: Text("Second Page")){
                        Text("Get Started!")
                            .foregroundColor(Color("Turquoise"))
                            .font(.custom("RobotoSlab-Bold", size: 25.0))
                            .padding(.all, 20.0)
                            .padding(.horizontal, 30.0)
                            .background(Color.white).cornerRadius(25.0)
                    }
                    .navigationBarHidden(true)
                    Spacer()

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
