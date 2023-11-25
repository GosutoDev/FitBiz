//
//  Color.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 23.11.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let banknote: Color = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
    static let creditCard: Color = Color(#colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1))
    
}

extension Image {
    static func getPaymentMethodImage(_ paymentMethod: Client.PaymentMethod) -> Image {
        return Image(systemName: paymentMethod == .cash ? "banknote.fill" : "creditcard.fill").font(.subheadline).foregroundStyle(paymentMethod == .cash ? Color.banknote : Color.creditCard) as! Image
    }
}
