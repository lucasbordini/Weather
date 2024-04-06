//
//  CustomTextFieldStyle.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.all, 12)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
