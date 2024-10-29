//
//  colorsave.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 26/04/1446 AH.
//
import SwiftUI

struct color: View {
    
@AppStorage("backgroundColor2") private var backgroundColor2: String = "white" // القيمة الافتراضية
    
    var body: some View {
        VStack {
            Text("التقويم")
                .font(.largeTitle)
                .padding()

            // عرض التاريخ الحالي
            Text(getCurrentDate())
                .font(.largeTitle)
                .padding()
                .frame(width: 150, height: 150)
                .background(getColor(from: backgroundColor2))
                .clipShape(Circle())
                .padding()

            // أزرار اختيار اللون
            HStack {
                Button(action: {
                    backgroundColor2 = "orange"
                }) {
                    Text("برتقالي")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    backgroundColor2 = "blue"
                }) {
                    Text("أزرق")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .padding()
    }

    // دالة للحصول على التاريخ الحالي
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }

    // دالة لتحويل اسم اللون إلى Color
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
}

#Preview {
    color()
}

//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            color()
//        }
//    }
//}
