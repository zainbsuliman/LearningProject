//
//  SecoundPage.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 20/04/1446 AH.
//

import SwiftUI

struct SecoundPage: View {
    
    @State var backgraundColor: Color = Color.black
    
    @State private var currentDate2 = Date()

    // لتاريخ
    var currentDate: String {
        
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "EEEE,dd MMM"
        return dateFormatter.string(from: Date())
        
    }
    
    var body: some View {
        
        ZStack {
            
            backgraundColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack(alignment:.center, spacing:10) {
                
                Text(currentDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, -190)
                
                HStack(alignment: .top, spacing: 100){
                    
                    Text("Learning Swift ")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    //                    .offset(x:-50,y:-310)
                    
                    Button(action: {
                        
                        
                    }){
                        
                        Text("🔥")
                            .font(.system(size: 30))
                            .background(
                                Circle()
                                    .fill(Color.gray.opacity(0.9))
                                    .frame(width: 50, height: 100)
                                    .shadow(color: .black, radius: 3)
                                    .opacity(0.4)
                            )
                        
                        //                        .offset(x:50,y:-310)
                    }
                }
                
                ZStack {
                    
                    
                    
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                    //.offset(x:0,y:-160)
                        .frame(width:367, height: 208)
                        .foregroundColor(.gray.opacity(0.6))
                    
                    
                    
                    VStack( spacing:1) {
                        
                        
                        
                        
                        HStack(alignment:.center,spacing: 150) {
                            
                            Text("\(currentDate2, formatter: dateFormatter)")// هذا تاريخ اليوم
                                .font(.title3)
                               
                            
                            
                            HStack(alignment: .center, spacing: 20){
                                // زر الذهاب إلى التاريخ السابق
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: -7, to: currentDate2)!
                                }) {
                                    Text("<")
                                        .font(.title2)
                                    
                                        .padding()
                                    //.background(Color.red)
                                        .foregroundColor(.orangeC)
                                        .cornerRadius(10)
                                        .bold()
                                }
                                
                                // زر الذهاب إلى التاريخ التالي
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: 7, to: currentDate2)!
                                }) {
                                    Text(">")
                                        .font(.title2)
                                    //.background(Color.green)
                                    
                                        .foregroundColor(.orangeC)
                                        .cornerRadius(10)
                                        .bold()
                                    
                                }
                            }
                        }
                        
                        // عرض أيام الأسبوع والتواريخ بشكل أفقي
                        ScrollView(.horizontal) {
                            HStack (){
                                
                                
                                ForEach(0..<7) { index in
                                    let date = Calendar.current.date(byAdding: .day, value: index - 3, to: currentDate2)!
                                        
                                        
                                    
                                        
                                    VStack {
                                        
                                        // عرض اسم اليوم بالأحرف المختصرة
                                        Text("\(date, formatter: dateFormatterWeekdayShort)")
                                            .font(.headline)
                                            .foregroundColor(isToday(date) ? .white : .gray)
                                        
                                        // عرض رقم اليوم
                                        Text("\(date, formatter: dateFormatterShort)")
                                            .frame(width: 44, height: 44)
                                        // .background(Color.blue.opacity(0.3))
                                        
                                            .foregroundColor(isToday(date) ? .orangeC : .white)
                                            .background(isToday(date) ? Color.gray.opacity(0.3) : Color.gray.opacity(0.3))
                                            .cornerRadius(40)
                                            .padding(0.2)
                                        
                                        
                                    }
                                }
                            }.padding(.leading, 20)
                        }//.offset(x:23,y:-170)
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.5))
                            .frame(width: 350,height: 1)
                        
                            .padding(2)
             
            
                        // هنا باقي اسوي كاونتر لعدد الستريك
                        
                        HStack( spacing: 50){
                            
                            VStack {
                                Text("10🔥")
                                    .font(.title2)
                                    .bold()
                                Text("Day streak")
                                    .font(.headline)
                                    .foregroundColor(.gray.opacity(0.5))
                                
                            }
                            Rectangle()
                                .frame(width:1,height:61)
                                .foregroundColor(.gray.opacity(0.5))
                            
                            
                            VStack {
                                Text("2🧊")
                                    .font(.title2)
                                    .bold()
                                Text("Day freezed")
                                    .font(.headline)
                                    .foregroundColor(.gray.opacity(0.5))
                                
                            }
                            
                            
                        }
                        
                    }
                
                }
                
                            
                                ZStack {
                                    Button(action: {
                
                
                                    }){
                                        Circle()
                                            .frame(width:320, height: 320)
                
                                            .foregroundColor(.orangeC)
                
                
                                    }
                                    .overlay(
                
                                        Text("Log today as Learned")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
                                            .bold()
                
                
                                    )
                
                                }
                
                                Button(action: {
                
                                }){
                
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width:162, height: 52)
                                            .foregroundColor(.babyblue)
                
                                        Text("Freeze day")
                                    }
                
                
                
                                }
                
                                Text("2 out of 6 freezes used")
                                    .font(.caption)
                                    .foregroundColor(.gray.opacity(0.6))
                                    .bold()
                                 
                
                            
                
                
            }
            
        }
    }
        
        
        func isToday(_ date: Date) -> Bool {
            let calendar = Calendar.current
            return calendar.isDate(date, inSameDayAs: Date())
        }
        
        // تنسيق التاريخ
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            
            formatter.dateFormat = "EEEE, d"
            
            
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
    SecoundPage()
}
