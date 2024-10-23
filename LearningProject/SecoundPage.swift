//
//  SecoundPage.swift
//  LearningProject
//
//  Created by Zainab Alatwi  on 20/04/1446 AH.
//

import SwiftUI

struct SecoundPage: View {
    
    @State var backgraundColor: Color = Color.black

   
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
            
            
            Text(currentDate)
                .font(.caption)
                .foregroundColor(.gray)
                .offset(x: -130, y: -350)
            
            
            
            
    
            
            
        }
    }
    
        
    }


#Preview {
    SecoundPage()
}
