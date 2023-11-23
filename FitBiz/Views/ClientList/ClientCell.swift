//
//  ClientCell.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 23.11.2023.
//

import SwiftUI

struct ClientCell: View {
    
    let firstName: String
    let secondName: String
    let paymentMethod: Client.PaymentMethod
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack(spacing: 3) {
                Text(firstName)
                Text(secondName)
            }
            .font(.headline)
            
            HStack(spacing: 3) {
                Text("Payment by")
                Text(paymentMethod.rawValue)
                Image(systemName: paymentMethod == .cash ? "banknote.fill" : "creditcard.fill")
                    .font(.caption)
                    .foregroundStyle(paymentMethod == .cash ? Color.banknote : Color.creditCard)
            }
            .font(.caption2)
        }
    }
}

#Preview {
    ClientCell(firstName: "Tom", secondName: "Duchoslav", paymentMethod: Client.PaymentMethod.cash)
}
