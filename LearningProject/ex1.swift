
import SwiftUI

struct e: View {
    
    @State var backgraundColor: Color = .black
    @State private var currentDate2 = Date()
    @State var StreakCount: Int = 0
    @State var FrazedayCount: Int = 0
    
    @State var ColorOfStreakOrFreaaz: Color = .gray
    @State var ColorOfStreakOrFreaaz2: Color = .gray
    @State var circleColor: Color = .orange.opacity(0.5)
    @State var circleText: String = "Log today as Learned"

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
                
                Text(currentDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, -190)
                
                HStack(alignment: .top, spacing: 100) {
                    Text("Learning Swift ")
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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .frame(width: 367, height: 208)
                        .foregroundColor(.gray.opacity(0.6))
                    
                    VStack(spacing: 1) {
                        HStack(alignment: .center, spacing: 150) {
                            Text("\(currentDate2, formatter: dateFormatter)")
                                .font(.title3)
                            
                            HStack(alignment: .center, spacing: 20) {
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: -7, to: currentDate2)!
                                }) {
                                    Text("<")
                                        .font(.title2)
                                        .padding()
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                                
                                Button(action: {
                                    currentDate2 = Calendar.current.date(byAdding: .day, value: 7, to: currentDate2)!
                                }) {
                                    Text(">")
                                        .font(.title2)
                                        .foregroundColor(.orange)
                                        .bold()
                                }
                            }
                        }
                        
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
                                            .foregroundColor(isToday(date) ? .orangeC : .white)
                                            .background(isToday(date) ? ColorOfStreakOrFreaaz.opacity(0.3) : .gray.opacity(0.3))
                                            .cornerRadius(40)
                                    }
                                }.padding(.leading, 20)
                            }
                        }
                        
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.5))
                            .frame(width: 350, height: 1)
                            .padding(2)
                        
                        HStack(spacing: 50) {
                            VStack {
                                Text("\(StreakCount)🔥")
                                    .font(.title2)
                                    .bold()
                                Text("Day streak")
                                    .font(.headline)
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            
                            Rectangle()
                                .frame(width: 1, height: 61)
                                .foregroundColor(.gray.opacity(0.5))
                            
                            VStack {
                                Text("\(FrazedayCount)🧊")
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
                    Circle()
                        .frame(width: 320, height: 320)
                        .foregroundColor(circleColor)
                        .onTapGesture {
                            handleLearnAction()
                        }
                    Text(circleText)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                }
                
                Button(action: {
                    handleFreezeAction()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 162, height: 52)
                            .foregroundColor(.blue.opacity(0.5))
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
    
    func handleLearnAction() {
        circleColor = .orange.opacity(0.5)
        circleText = "تم الإضافة"
        ColorOfStreakOrFreaaz = .orange
        StreakCount += 1
    }
    
    func handleFreezeAction() {
        circleColor = .blue.opacity(0.5)
        circleText = "تم التفريز"
        ColorOfStreakOrFreaaz = .blue
        FrazedayCount += 1
    }
    
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
    e()
}
