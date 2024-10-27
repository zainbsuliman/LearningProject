//
//  Model.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 24/04/1446 AH.
//

import SwiftUI

struct lastpage: View {
    
    @State  var buttenTextColor1 = false
    @State  var buttenTextColor2 = false
    @State  var buttenTextColor3 = false
    @State var userinput: String = ""
    
    var body: some View {
        
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            
            
            VStack(spacing:20) {
                
                VStack (spacing:40){
                    HStack(spacing:80){
                        
                        Button(action: {}) {
                            
                            Text("< Back")
                                .font(.headline)
                                .foregroundColor(.orangeC)
                            
                            
                        }
                        
                        Text("Learning goal")
                            .font(.headline)
                        
                        
                        
                        Button(action: {}) {
                            
                            Text("Update")
                                .font(.headline)
                                .foregroundColor(.orangeC)
                            
                        }
                        
                    }
                    
                    
                    VStack (spacing:15){
                        Text("I want to learn")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading, -190)
                        
                        
                        TextField("Swift", text: $userinput)
                        Divider()
                            .frame(height: 1)
                            .background(Color.gray.opacity(0.5))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.tint(.orange)
                        .onTapGesture {
                                    hideKeyboard()
                                }
                        
                }
                Text("I want to learn it in a")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, -190)
                
                
                
                HStack{
                    
                    Button(action: {
                        buttenTextColor1.toggle()
                        
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor((buttenTextColor1 ? .orangeC : .gray.opacity(0.4)))
                        
                        //.foregroundColor(buttenColor)
                            .overlay(
                                Text("Week")
                                    .foregroundColor(buttenTextColor1 ?.black : .orangeC)
                                
                                
                            )
                        
                        
                    }
                    
                    
                    
                    Button(action: {
                        
                        buttenTextColor2.toggle()
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor((buttenTextColor2 ? .orangeC : .gray.opacity(0.4)))
                        
                        //.foregroundColor(buttenColor)
                            .overlay(
                                Text("Month")
                                
                                    .foregroundColor(buttenTextColor2 ?.black :.orangeC)
                            )
                        
                        
                    }
                    
                    Button(action: {
                        
                        buttenTextColor3.toggle()
                        
                    }){
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor((buttenTextColor3 ? .orangeC : .gray.opacity(0.4)))
                        
                        //  .foregroundColor(buttenColor)
                            .overlay(
                                Text("Year")
                                    .foregroundColor(buttenTextColor3 ?.black : .orangeC)
                            )
                        
                        
                    }
                    
                    
                }.padding(.leading, -170)
                Spacer()

            }
            
            
            
            
            
            
        }
        
    }
    
}
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    lastpage()
}
