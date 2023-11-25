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

extension Client {
    static let clients: [Client] = [
        Client(firstName: "Tomas", secondName: "Duchoslav", comment: "jeden", paymentMethod: .cash),
        Client(firstName: "Lukas", secondName: "Cakora", comment: "dva", paymentMethod: .cash),
        Client(firstName: "Michal", secondName: "Cimbora", comment: "tri", paymentMethod: .card),
        Client(firstName: "Milan", secondName: "Konecny", comment: "ctyri", paymentMethod: .card),
        Client(firstName: "Jan", secondName: "Vejmelka", comment: "pet", paymentMethod: .cash),
        Client(firstName: "Lubomir", secondName: "Rujbr", comment: "sest", paymentMethod: .cash),
        Client(firstName: "Patrik", secondName: "Kalivoda", comment: "sedm", paymentMethod: .card),
        Client(firstName: "Petr", secondName: "Oslejsek", comment: "osm", paymentMethod: .cash),
        Client(firstName: "Ondra", secondName: "Vacek", comment: "devet", paymentMethod: .card),
        Client(firstName: "Michal", secondName: "Svetlik", comment: "deset", paymentMethod: .cash)
        
    ]
}
