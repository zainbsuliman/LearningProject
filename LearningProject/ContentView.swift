//
//  ContentView.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 16/04/1446 AH.
//

//
 // FirstPage.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 19/04/1446 AH.
//

//import SwiftUI
//
//struct ContentView: View {
//    
//    @State var backgraundColor: Color = Color.black
//    
//    @State  var buttenTextColor1 = false
//    @State  var buttenTextColor2 = false
//    @State  var buttenTextColor3 = false
//   
//
//    
//   // @State private var buttenColor: Color = Color.gray.opacity(0.5)
//    @State var userinput: String = ""
//    var body: some View {
//        ZStack {
//            
//            backgraundColor
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .ignoresSafeArea()
//            
//            VStack(spacing:30) {
//                VStack(spacing:30){
//                    
//                    Text("🔥")
//                        .font(.system(size: 50))
//                        .background(
//                            Circle()
//                                .fill(Color.gray.opacity(0.6))
//                                .frame(width: 100, height: 100)
//                                .shadow(color: .black, radius: 3)
//                                .opacity(0.4)
//                        )
//                        .offset(y:-15)
//                    
//                    Text("Hello Learner!")
//                        .font(.largeTitle)
//                        .padding(.leading, -140)
//                        .bold()
//                    
//                    Text("This app will help you learn everyday")
//                        .padding(.leading, -90)
//                        .opacity(0.5)
//                    
//                    Text("I want to learn")
//                        .padding(.leading, -180)
//                        .bold()
//                    
//                    VStack {
//                        
//                        TextField("Swift", text: $userinput)
//                        Divider()
//                            .frame(height: 1)
//                            .background(Color.gray.opacity(0.5))
//                        
//                        Text("I want to learn it in a")
//                            .padding(.leading, -180)
//                        
//                            .bold()
//                    }
//                    
//                    .tint(.orange)
//                    
//                    
//                }.foregroundColor(.white)
//                
//                
//                
//                HStack{
//                    
//                    Button(action: {
//                        buttenTextColor1.toggle()
//                        
//                    }){
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 100, height: 40)
//                            .foregroundColor((buttenTextColor1 ? .orangeC : .gray.opacity(0.4)))
//                        
//                        //.foregroundColor(buttenColor)
//                            .overlay(
//                                Text("Week")
//                                    .foregroundColor(buttenTextColor1 ?.black : .orangeC)
//                                
//                                
//                            )
//                        
//                        
//                    }
//                    
//                    
//                    
//                    Button(action: {
//                        
//                        buttenTextColor2.toggle()
//                    }){
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 100, height: 40)
//                            .foregroundColor((buttenTextColor2 ? .orangeC : .gray.opacity(0.4)))
//                        
//                        //.foregroundColor(buttenColor)
//                            .overlay(
//                                Text("Month")
//                                
//                                    .foregroundColor(buttenTextColor2 ?.black :.orangeC)
//                            )
//                        
//                        
//                    }
//                    
//                    Button(action: {
//                        
//                        buttenTextColor3.toggle()
//                        
//                    }){
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 100, height: 40)
//                            .foregroundColor((buttenTextColor3 ? .orangeC : .gray.opacity(0.4)))
//                        
//                        //  .foregroundColor(buttenColor)
//                            .overlay(
//                                Text("Year")
//                                    .foregroundColor(buttenTextColor3 ?.black : .orangeC)
//                            )
//                        
//                        
//                    }
//                    
//                    
//                    
//                    
//                    
//                }
//                
//                Button(action: {
//                    
//                    //
//                }){
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 151, height: 52)
//                        .foregroundColor(.orangeC)
//                    
//                        .overlay(){
//                            Image(systemName: "arrow.forward")
//                                .foregroundColor(.black)
//                                .offset(x:30)
//                                .bold()
//                            
//                            Text("Start")
//                                .foregroundColor(.black)
//                                .bold()
//                        }
//                    
//                }
//                
//            }.padding(.bottom,240)
//            
//        }
//        
//    }
//    
//    
//}
//
//
//#Preview {
//    ContentView()
//}
