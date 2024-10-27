//
//  MVVMlastPage.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 24/04/1446 AH.
//

import SwiftUI

//// ViewModel for managing the state
//class LastPageViewModel: ObservableObject {
//    @Published var buttonTextColor1 = false
//    @Published var buttonTextColor2 = false
//    @Published var buttonTextColor3 = false
//    @Published var userInput: String = ""
//}

struct MVVMlastPage: View {
    
    @StateObject var viewModel = ContentViewModel() // Use StateObject for ViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                VStack(spacing: 40) {
                    HStack(spacing: 80) {
                        
                        Button(action: {}) {
                            Text("< Back")
                                .font(.headline)
                                .foregroundColor(.orange)
                        }
                        
                        Text("Learning goal")
                            .font(.headline)
                        
                        Button(action: {}) {
                            Text("Update")
                                .font(.headline)
                                .foregroundColor(.orange)
                        }
                    }
                    
                    VStack(spacing: 10) {
                        Text("I want to learn")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading, -190)
                        
                        TextField("Swift", text: $viewModel.userInput) // Bind to ViewModel
                        Divider()
                            .frame(height: 1)
                            .background(Color.gray.opacity(0.5))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .tint(.orange)
                    .onTapGesture {
                        hideKeyboard()
                    }
                }
                
                Text("I want to learn it in a")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, -190)
                
                HStack {
                    Button(action: {
                        viewModel.buttonTextColor1.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor(viewModel.buttonTextColor1 ? .orange : .gray.opacity(0.4))
                            .overlay(
                                Text("Week")
                                    .foregroundColor(viewModel.buttonTextColor1 ? .black : .orange)
                            )
                    }
                    
                    Button(action: {
                        viewModel.buttonTextColor2.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor(viewModel.buttonTextColor2 ? .orange : .gray.opacity(0.4))
                            .overlay(
                                Text("Month")
                                    .foregroundColor(viewModel.buttonTextColor2 ? .black : .orange)
                            )
                    }
                    
                    Button(action: {
                        viewModel.buttonTextColor3.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 37)
                            .foregroundColor(viewModel.buttonTextColor3 ? .orange : .gray.opacity(0.4))
                            .overlay(
                                Text("Year")
                                    .foregroundColor(viewModel.buttonTextColor3 ? .black : .orange)
                            )
                    }
                    
                }
                .padding(.leading, -170)
                Spacer()
            }
        }
    }
}


private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }



#Preview {
    MVVMlastPage()
}

//Preview {
//    MVVMlastPage()
//}
