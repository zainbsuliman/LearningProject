//
//  MVVM.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 24/04/1446 AH.

import SwiftUI

// نموذج البيانات
struct LearningDay {
    var streakCount: Int
    var freezeDayCount: Int
}

// ViewModel
class LearningViewModel: ObservableObject {
    
    @Published var learningDay: LearningDay {
        
        didSet {
            // تخزين القيم في @AppStorage
            UserDefaults.standard.set(learningDay.streakCount, forKey: "streakCount")
            UserDefaults.standard.set(learningDay.freezeDayCount, forKey: "freezeDayCount")
        }
    }
    @Published var currentDate2: Date {
        didSet {
            // تخزين التاريخ الحالي في @AppStorage
            UserDefaults.standard.set(currentDate2, forKey: "currentDate")
        }
    }

    init() {
        // ضبط قيم الستريك والفريز على صفر
        self.learningDay = LearningDay(streakCount: 0, freezeDayCount: 0)
        self.currentDate2 = UserDefaults.standard.object(forKey: "currentDate") as? Date ?? Date()
    }
    
    func incrementStreak() {
        if learningDay.streakCount < 10 {
            learningDay.streakCount += 1
        }
    }
    
    func incrementFreeze() {
        if learningDay.freezeDayCount < 3 {
            learningDay.freezeDayCount += 1
        }
    }
}

struct MVVMCALENDER: View {
    
    @StateObject private var viewModel = LearningViewModel() // استخدام ViewModel
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
        NavigationView{
            
            ZStack {
                backgraundColor
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 10) {
                    // عرض التاريخ
                    Text(currentDate)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, -190)
                    
                    HStack(alignment: .top, spacing: 190) {
                        Text(userInput)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.leading, -10)
                   
                            Button(action: {}) {
                                NavigationLink(destination: MVVMlastPage()) {
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
                            dateColor = .orange
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
                            dateColor = .blue
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

// عرض التطبيق
#Preview {
    MVVMCALENDER()
}
