//
//  SecoundPage.swift
//  LearningProject
//
//  Created by Zainab Alatwi on 20/04/1446 AH.
//

import SwiftUI

struct r: View {
    @State var backgraundColor: Color = Color.black
    // @Binding var userinput: String
    @State var currentDate2 = Date()
    @State var streakCount: Int = 0
    @State var freezeDayCount: Int = 0
    @State var circleColor: Color = Color.orange
    @State var isCirclePressed: Bool = false
    @State var isFreezePressed: Bool = false
    @State var todayBackgroundColor: Color = Color.gray.opacity(0.3)
    @State var circleButtonText: String = "Log today as Learned"
    @State var dateColor: Color = Color.orange
    @State var textColor: Color = .black //
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM"
        return dateFormatter.string(from: Date())
    }
    
    var body: some View {
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
                
                HStack(alignment: .top, spacing: 100) {
                    Text("Learning Swift")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Button(action: {}) {
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
                
                // مستطيل يحتوي على عناصر التاريخ والتواريخ السابقة
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 380, height: 210)
                        .foregroundColor(.gray.opacity(0.6))
                    
                    VStack(spacing:0) {
                        HStack(alignment: .center, spacing: 150) {
                            Text("\(currentDate2, formatter: dateFormatter)")
                                .font(.system(size: 20))
                            
                            HStack(alignment: .center, spacing: 20) {
                                // زر الانتقال للتاريخ السابق
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: -7, to: currentDate2)!
                                }) {
                                    Text("<")
                                        .font(.title)
                                        .padding()
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                                
                                // زر الانتقال للتاريخ التالي
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: 7, to: currentDate2)!
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
                                    let date = Calendar.current.date(byAdding: .day, value: index - 3, to: currentDate2)!
                                    
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
                                Text("\(streakCount)🔥")
                                    .font(.title2)
                                    .bold()
                                Text("Day streak")
                                    .font(.headline)
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            
                            Rectangle()
                                .frame(width: 1, height: 60)
                                .foregroundColor(.gray.opacity(0.5))
                            
                            VStack {
                                Text("\(freezeDayCount)🧊")
                                    .font(.title2)
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
                    if streakCount < 10 {
                        streakCount += 1
                        isCirclePressed = true
                        isFreezePressed = true
                        dateColor = .orange
                        circleColor = Color.orange.opacity(0.5)
                        todayBackgroundColor = Color.orange.opacity(0.3)
                        circleButtonText = "Learned Today"
                        textColor = .orange  // تغيير لون النص إلى برتقالي
                    }
                }) {
                    Circle()
                        .frame(width: 320, height: 320)
                        .foregroundColor(circleColor)
                        .overlay(
                            Text(circleButtonText)
                                .font(.largeTitle)
                                .foregroundColor(textColor)  // استخدام النص الديناميكي
                                .bold()
                        )
                }
                
                // زر تجميد اليوم
                
                Button(action: {
                    if freezeDayCount < 3 {
                        freezeDayCount += 1
                        isFreezePressed = true
                        dateColor = .blue
                        isCirclePressed = false
                        circleColor = Color.blue.opacity(0.2)
                        todayBackgroundColor = Color.blue.opacity(0.2)
                        circleButtonText = "Day Freezed"
                        textColor = .blue  // تغيير لون النص إلى أزرق
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 162, height: 52)
                            .foregroundColor(isFreezePressed ? Color.gray.opacity(0.5) : Color.babyblue)
                        
                        Text("Freeze day")
                            .foregroundColor(isFreezePressed ? Color.gray.opacity(0.9) : Color.blue)
                    }
                }
                .disabled(isFreezePressed || freezeDayCount >= 3)  // تعطيل الزر إذا كان مضغوطًا أو تم الوصول للحد الأقصى
                
                Text("\(freezeDayCount) out of 3 freezes used")
                    .font(.caption)
                    .foregroundColor(.gray.opacity(0.6))
                    .bold()
                
            }
        }
    }
    
    func isToday(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: Date())
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM,YYYY"
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

#Preview {
    r()
}

