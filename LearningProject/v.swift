//
//  v.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 25/04/1446 AH.
//
import SwiftUI

struct ContentView2: View {
    @StateObject private var viewModel = ContentViewModel2()
    
    var body: some View {
        NavigationView {
            NavigationView{
                ZStack {
                    viewModel.backgroundColor
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        VStack(spacing: 20) {
                            Text("🔥")
                                .font(.system(size: 50))
                                .background(
                                    Circle()
                                        .fill(Color.gray.opacity(0.6))
                                        .frame(width: 100, height: 100)
                                        .shadow(color: .black, radius: 3)
                                        .opacity(0.4)
                                )
                                .offset(y: -15)
                            
                            Text("Hello Learner!")
                                .font(.largeTitle)
                                .padding(.leading, -140)
                                .bold()
                            
                            Text("This app will help you learn everyday")
                                .padding(.leading, -90)
                                .opacity(0.5)
                            
                            Text("I want to learn")
                                .padding(.leading, -180)
                                .bold()
                            
                            VStack {
                                TextField("Swift", text: $viewModel.userInput)
                                    .padding(.bottom, -16)
                                    .padding(.leading, 12)
                                Rectangle()
                                    .frame(height: 0.9 )
                                    .foregroundColor(.gray)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                
                                Text("I want to learn it in a")
                                    .padding(.leading, -180)
                                    .bold()
                            }
                            .tint(.orange)
                        }
                        .foregroundColor(.white)
                        
                        HStack {
                            Button(action: {
                                viewModel.toggleButton1()
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
                                viewModel.toggleButton2()
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
                                viewModel.toggleButton3()
                            }) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 68, height: 37)
                                    .foregroundColor(viewModel.buttonTextColor3 ? .orange : .gray.opacity(0.4))
                                    .overlay(
                                        Text("Year")
                                            .foregroundColor(viewModel.buttonTextColor3 ? .black : .orange)
                                    )
                            }
                        }.padding(.leading,-170)
                        
                        NavigationLink(destination: MVVMCALENDER2()){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 151, height: 52)
                                .foregroundColor(.orange)
                                .overlay {
                                    Image(systemName: "arrow.forward")
                                        .foregroundColor(.black)
                                        .offset(x: 30)
                                        .bold()
                                    Text("Start")
                                        .foregroundColor(.black)
                                        .bold()
                                }
                        }
                    }
                    .padding(.bottom, 290)
                    .padding(.leading, 10)
                 
                }
            }
        }
    }
}
import SwiftUI


struct MVVMCALENDER2: View {
    
    @StateObject private var viewModel = LearningViewModel2()
    // استخدام ViewModel
    @State var backgraundColor: Color = Color.black
    @State var circleColor: Color = Color.orange
        
    @State var todayBackgroundColor: Color = Color.gray.opacity(0.3)
    @State var circleButtonText: String = "Log today as Learned"
    @State var dateColor: Color = Color.orange
    @State var textColor: Color = .black
    @State var isCirclePressed: Bool = false
    @State var isFreezePressed: Bool = false
    @AppStorage("userInput") var userInput: String = ""
    
    

    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                backgraundColor
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 10) {
                    // عرض التاريخ
                    Text(currentDate)
                        .font(.title3)
                        .foregroundColor(.gray.opacity(0.6))
                        .padding(.leading, -190)
                    
                    HStack(alignment: .top, spacing: 130) {
                        Text(userInput)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, -70)
                           
                   
                        Button(action: {}) {
                            NavigationLink(destination: MVVMlastPage2()) {
                                Text("🔥")
                                    .font(.system(size: 30))
                                    .background(
                                        Circle()
                                            .fill(Color.gray.opacity(0.9))
                                            .frame(width: 50, height: 100)
                                            .shadow(color: .black, radius: 3)
                                            .opacity(0.4)
                                    )
                                }
                        }
                    }
                    
                    // مستطيل يحتوي على عناصر التاريخ والتواريخ السابقة
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .frame(width: 380, height: 210)
                            .foregroundColor(.gray.opacity(0.6))
                        
                        VStack(spacing: 0) {
                            HStack(alignment: .center, spacing: 150) {
                                Text("\(viewModel.currentDate2, formatter: dateFormatter)")
                                    .font(.system(size: 20))
                                
                                HStack(alignment: .center, spacing: 20) {
                                    // زر الانتقال للتاريخ السابق
                                    Button(action: {
                                        viewModel.currentDate2 = Calendar.current.date(byAdding: .day, value: -7, to: viewModel.currentDate2)!
                                    }) {
                                        Text("<")
                                            .font(.title)
                                            .padding()
                                            .foregroundColor(.orange)
                                            .bold()
                                    }
                                    
                                    // زر الانتقال للتاريخ التالي
                                    Button(action: {
                                        viewModel.currentDate2 = Calendar.current.date(byAdding: .day, value: 7, to: viewModel.currentDate2)!
                                    }) {
                                        Text(">")
                                            .font(.title)
                                            .foregroundColor(.orange)
                                            .bold()
                                    }
                                }
                            }
                            
                            // عرض التواريخ بشكل أفقي
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(0..<7) { index in
                                        let date = Calendar.current.date(byAdding: .day, value: index - 3, to: viewModel.currentDate2)!
                                        
                                        VStack {
                                            Text("\(date, formatter: dateFormatterWeekdayShort)")
                                                .font(.headline)
                                                .foregroundColor(isToday(date) ? .white : .gray)
                                            
                                            Text("\(date, formatter: dateFormatterShort)")
                                                .frame(width: 44, height: 44)
                                                .foregroundColor(isToday(date) ? dateColor : .white)
                                                .background(isToday(date) ? todayBackgroundColor : .gray.opacity(0.3))
                                                .cornerRadius(40)
                                                .padding(0.2)
                                        }
                                    }
                                }.padding(.leading, 20)
                            }
                            
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(width: 350, height: 1)
                                .padding(2)
                            
                            // عداد الستريك والتجميد
                            HStack(spacing: 50) {
                                VStack {
                                    Text("\(viewModel.learningDay.streakCount)🔥")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text("Day streak")
                                        .font(.headline)
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                                
                                Rectangle()
                                    .frame(width: 1, height: 60)
                                    .foregroundColor(.gray.opacity(0.5))
                                
                                VStack {
                                    Text("\(viewModel.learningDay.freezeDayCount)🧊") // إضافة عدد الفريز بجانب الثلج
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text("Day freezed")
                                        .font(.headline)
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                            }
                        }
                    }
                    
                    // زر دائري كبير
                    Button(action: {
                        viewModel.incrementStreak() // زيادة الستريك من ViewModel
                        if viewModel.learningDay.streakCount < 10 {
                            circleColor = Color.orange.opacity(0.5)
                            todayBackgroundColor = Color.orange.opacity(0.3)
                            circleButtonText = "Learned Today"
                            textColor = .orange
                            dateColor = .white
                            isFreezePressed = true
                            isCirclePressed = true
                        }
                    }) {
                        Circle()
                            .frame(width: 320, height: 320)
                            .foregroundColor(circleColor)
                            .overlay(
                                Text(circleButtonText)
                                    .font(.largeTitle)
                                    .foregroundColor(textColor)
                                    .bold()
                            )
                    }
                    
                    // زر تجميد اليوم
                    Button(action: {
                        viewModel.incrementFreeze() // زيادة التجميد من ViewModel
                        if viewModel.learningDay.freezeDayCount < 3 {
                            textColor = .blue
                            isFreezePressed = true
                            isCirclePressed = true
                            dateColor = .white
                            circleColor = Color.blue.opacity(0.2)
                            todayBackgroundColor = Color.blue.opacity(0.5)
                            circleButtonText = "Day Freezed"
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 162, height: 52)
                                .foregroundColor(isFreezePressed ? Color.gray.opacity(0.5) : Color.babyblue.opacity(0.9))
                            
                            Text("Freeze day")
                                .foregroundColor(isFreezePressed ? Color.gray.opacity(0.5) : Color.blue)
                        }
                    }
                    .disabled(viewModel.learningDay.freezeDayCount >= 3)  // تعطيل الزر إذا كان مضغوطًا أو تم الوصول للحد الأقصى
                    
                    Text("\(viewModel.learningDay.freezeDayCount) out of 3 freezes used")
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func isToday(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: Date())
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = " MMMM, YYYY" // تغيير التنسيق ليشمل الشهر والسنة
        return formatter
    }()
    
    let dateFormatterWeekdayShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    let dateFormatterShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
}

private func getColor(from colorName: String) -> Color {
    switch colorName {
    case "orange":
        return .orange
    case "blue":
        return .blue
    default:
        return .white
    }
}




struct MVVMlastPage2: View {
    
    @StateObject var viewModel = ContentViewModel2() // Use StateObject for ViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    VStack(spacing: 40) {
                        HStack(spacing: 80) {
                            
                            Button(action: {}) {
                                NavigationLink(destination: MVVMCALENDER2()) {
                                    Text("< Back")
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                }
                            }
                            
                            Text("Learning goal")
                                .font(.headline)
                            
                            Button(action: {}) {
                                NavigationLink(destination: MVVMCALENDER2()) {
                                    Text("Update")
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                }
                            }
                        }
                        
                        VStack(spacing: 10) {
                            Text("I want to learn")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.leading, -190)
                            
                            TextField("Swift", text: $viewModel.userInput) // Bind to ViewModel
                                .foregroundColor(.white)
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
        }.navigationBarBackButtonHidden(true)
    }
}

private func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}



#Preview {
    ContentView2()
}
