//
//  PaymentMethodImage.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 25.11.2023.
//

import SwiftUI

struct PaymentMethodImage: View {
    
    let paymentMethod: Client.PaymentMethod
    
    var body: some View {
        Image(systemName: paymentMethod == .cash ? "banknote.fill" : "creditcard.fill")
            .foregroundStyle(paymentMethod == .cash ? Color.banknote : Color.creditCard)
    }
}

#Preview {
    PaymentMethodImage(paymentMethod: .cash)
}
