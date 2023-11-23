//
//  Color.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 23.11.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let rowBackgroundLight: Color = Color(#colorLiteral(red: 0.9490135312, green: 0.9490135312, blue: 0.9694761634, alpha: 1))
    static let rowBackgroundDark: Color = Color(#colorLiteral(red: 0.1083279178, green: 0.1083279178, blue: 0.1185233369, alpha: 1))
    static let banknote: Color = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
    static let creditCard: Color = Color(#colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1))
    
    static func getRowBackground(_ colorScheme: ColorScheme) -> Color {    
        return colorScheme == .light ? rowBackgroundLight : rowBackgroundDark
    }
}
