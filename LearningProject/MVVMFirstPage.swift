//import SwiftUI
////import Combine
//
//// ViewModel
//class ContentViewModel: ObservableObject {
//    @Published var backgroundColor: Color = Color.black
//    @AppStorage("userInput") var userInput: String = ""
//    @Published var buttonTextColor1: Bool = false
//    @Published var buttonTextColor2: Bool = false
//    @Published var buttonTextColor3: Bool = false
//    
//    func toggleButton1() {
//        buttonTextColor1.toggle()
//    }
//    
//    func toggleButton2() {
//        buttonTextColor2.toggle()
//    }
//    
//    func toggleButton3() {
//        buttonTextColor3.toggle()
//    }
//}
//
//// ContentView
//struct ContentView: View {
//    
//    @StateObject private var viewModel = ContentViewModel()
//    
//    var body: some View {
//        NavigationView{
//            ZStack {
//                viewModel.backgroundColor
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 20) {
//                    VStack(spacing: 20) {
//                        Text("🔥")
//                            .font(.system(size: 50))
//                            .background(
//                                Circle()
//                                    .fill(Color.gray.opacity(0.6))
//                                    .frame(width: 100, height: 100)
//                                    .shadow(color: .black, radius: 3)
//                                    .opacity(0.4)
//                            )
//                            .offset(y: -15)
//                        
//                        Text("Hello Learner!")
//                            .font(.largeTitle)
//                            .padding(.leading, -140)
//                            .bold()
//                        
//                        Text("This app will help you learn everyday")
//                            .padding(.leading, -90)
//                            .opacity(0.5)
//                        
//                        Text("I want to learn")
//                            .padding(.leading, -180)
//                            .bold()
//                        
//                        VStack {
//                            TextField("Swift", text: $viewModel.userInput)
//                                .padding(.bottom, -16)
//                                .padding(.leading, 1)
//                            Rectangle()
//                                .frame(height: 0.3 )
//                                .background(Color.gray.opacity(0.5))
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            
//                            
//                            
//                            Text("I want to learn it in a")
//                                .padding(.leading, -180)
//                                .bold()
//                        }
//                        .tint(.orange)
//                    }
//                    .foregroundColor(.white)
//                    
//                    HStack {
//                        Button(action: {
//                            viewModel.toggleButton1()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)                            .foregroundColor(viewModel.buttonTextColor1 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Week")
//                                        .foregroundColor(viewModel.buttonTextColor1 ? .black : .orange)
//                                )
//                        }
//                        
//                        Button(action: {
//                            viewModel.toggleButton2()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)                            .foregroundColor(viewModel.buttonTextColor2 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Month")
//                                        .foregroundColor(viewModel.buttonTextColor2 ? .black : .orange)
//                                )
//                        }
//                        
//                        Button(action: {
//                            viewModel.toggleButton3()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)                            .foregroundColor(viewModel.buttonTextColor3 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Year")
//                                        .foregroundColor(viewModel.buttonTextColor3 ? .black : .orange)
//                                )
//                        }
//                    }.padding(.leading,-170)
//                    
//            NavigationLink(destination: MVVMCALENDER()){
//                
//                        Button(action: {
//                            // Action for the start button
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 151, height: 52)
//                                .foregroundColor(.orange)
//                                .overlay {
//                                    Image(systemName: "arrow.forward")
//                                        .foregroundColor(.black)
//                                        .offset(x: 30)
//                                        .bold()
//                                    NavigationLink(destination: MVVMCALENDER()){
//                                        
//                                        Text("Start")
//                                            .foregroundColor(.black)
//                                            .bold()
//                                    }
//                                }
//                        }
//                    }
//                    
//                }
//                
//                .padding(.bottom, 200)
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//import SwiftUI
//
//// ViewModel
//class ContentViewModel: ObservableObject {
//    @Published var backgroundColor: Color = Color.black
//    @AppStorage("userInput") var userInput: String = ""
//    @AppStorage("buttonTextColor1") var buttonTextColor1: Bool = false
//    @AppStorage("buttonTextColor2") var buttonTextColor2: Bool = false
//    @AppStorage("buttonTextColor3") var buttonTextColor3: Bool = false
//    
//    func toggleButton1() {
//        buttonTextColor1.toggle()
//    }
//    
//    func toggleButton2() {
//        buttonTextColor2.toggle()
//    }
//    
//    func toggleButton3() {
//        buttonTextColor3.toggle()
//    }
//}
//
//// ContentView
//struct ContentView: View {
//    
//    @StateObject private var viewModel = ContentViewModel()
//    
//    var body: some View {
//        NavigationView{
//            ZStack {
//                viewModel.backgroundColor
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 20) {
//                    VStack(spacing: 20) {
//                        Text("🔥")
//                            .font(.system(size: 50))
//                            .background(
//                                Circle()
//                                    .fill(Color.gray.opacity(0.6))
//                                    .frame(width: 100, height: 100)
//                                    .shadow(color: .black, radius: 3)
//                                    .opacity(0.4)
//                            )
//                            .offset(y: -15)
//                        
//                        Text("Hello Learner!")
//                            .font(.largeTitle)
//                            .padding(.leading, -140)
//                            .bold()
//                        
//                        Text("This app will help you learn everyday")
//                            .padding(.leading, -90)
//                            .opacity(0.5)
//                        
//                        Text("I want to learn")
//                            .padding(.leading, -180)
//                            .bold()
//                        
//                        VStack {
//                            TextField("Swift", text: $viewModel.userInput)
//                                .padding(.bottom, -16)
//                                .padding(.leading, 1)
//                            Rectangle()
//                                .frame(height: 0.3 )
//                                .background(Color.gray.opacity(0.5))
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            
//                            Text("I want to learn it in a")
//                                .padding(.leading, -180)
//                                .bold()
//                        }
//                        .tint(.orange)
//                    }
//                    .foregroundColor(.white)
//                    
//                    HStack {
//                        Button(action: {
//                            viewModel.toggleButton1()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)
//                                .foregroundColor(viewModel.buttonTextColor1 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Week")
//                                        .foregroundColor(viewModel.buttonTextColor1 ? .black : .orange)
//                                )
//                        }
//                        
//                        Button(action: {
//                            viewModel.toggleButton2()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)
//                                .foregroundColor(viewModel.buttonTextColor2 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Month")
//                                        .foregroundColor(viewModel.buttonTextColor2 ? .black : .orange)
//                                )
//                        }
//                        
//                        Button(action: {
//                            viewModel.toggleButton3()
//                        }) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 68, height: 37)
//                                .foregroundColor(viewModel.buttonTextColor3 ? .orange : .gray.opacity(0.4))
//                                .overlay(
//                                    Text("Year")
//                                        .foregroundColor(viewModel.buttonTextColor3 ? .black : .orange)
//                                )
//                        }
//                    }.padding(.leading,-170)
//                    
//                    NavigationLink(destination: MVVMCALENDER()){
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 151, height: 52)
//                            .foregroundColor(.orange)
//                            .overlay {
//                                Image(systemName: "arrow.forward")
//                                    .foregroundColor(.black)
//                                    .offset(x: 30)
//                                    .bold()
//                                Text("Start")
//                                    .foregroundColor(.black)
//                                    .bold()
//                            }
//                    }
//                }
//                .padding(.bottom, 200)
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
