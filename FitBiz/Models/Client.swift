//
//  Client.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import Foundation
import SwiftData

@Model
final class Client {
    var firstName: String!
    var secondName: String!
    var comment: String!
    var paymentMethod: PaymentMethod!
    
    init(firstName: String, secondName: String, comment: String, paymentMethod: PaymentMethod) {
        self.firstName = firstName
        self.secondName = secondName
        self.comment = comment
        self.paymentMethod = paymentMethod
    }
}

extension Client {
    enum PaymentMethod: String, CaseIterable, Codable {
        case cash
        case card
    }
}
