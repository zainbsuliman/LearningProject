//
//  vm.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 25/04/1446 AH.




import SwiftUI

class ContentViewModel2: ObservableObject {
    @Published var backgroundColor: Color = Color.black
    @AppStorage("userInput") var userInput: String = ""
    @AppStorage("buttonTextColor1") var buttonTextColor1: Bool = true
    @AppStorage("buttonTextColor2") var buttonTextColor2: Bool = true
    @AppStorage("buttonTextColor3") var buttonTextColor3: Bool = true

    func toggleButton1() {
        buttonTextColor1.toggle()
    }
    
    func toggleButton2() {
        buttonTextColor2.toggle()
    }
    
    func toggleButton3() {
        buttonTextColor3.toggle()
    }
}
import SwiftUI

class LearningViewModel2: ObservableObject {
    @Published var learningDay: LearningDay2{
        didSet {
            UserDefaults.standard.set(learningDay.streakCount, forKey: "streakCount")
            UserDefaults.standard.set(learningDay.freezeDayCount, forKey: "freezeDayCount")
        }
    }
    
    @Published var currentDate2: Date {
        didSet {
            UserDefaults.standard.set(currentDate2, forKey: "currentDate")
        }
    }

    init() {
        self.learningDay = LearningDay2(streakCount: 0, freezeDayCount: 0)
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
