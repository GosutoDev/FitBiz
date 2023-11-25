//
//  AddClientView.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import SwiftUI
import SwiftData

struct AddClientView: View {
    
    //
    @Environment(\.colorScheme) private var colorScheme
    
    // SwiftData context
    @Environment(\.modelContext) private var context
    
    // Fields state properties
    @State private var firstName: String = ""
    @State private var secondName: String = ""
    @State private var comment: String = ""
    @State private var paymentMethod: Client.PaymentMethod = .card
    
    // Close the sheet
    @Binding var isPresented: Bool
    
    // Handling focus to each fields
    @State private var focused: [Bool] = [true, false, false]
    
    var body: some View {
        NavigationStack {
            
            Form {
                CustomTextField(
                    tag: 0,
                    placeholder: "First name",
                    returnType: .next,
                    isFocusable: $focused,
                    text: $firstName)
                .listRowBackground(Color.sheetRowBackground)
                .padding(.leading, 5)
                
                CustomTextField(
                    tag: 1,
                    placeholder: "Second name",
                    returnType: .next,
                    isFocusable: $focused,
                    text: $secondName)
                .listRowBackground(Color.sheetRowBackground)
                .padding(.leading, 5)
                
                
                Picker("Payment method:", selection: $paymentMethod) {
                    ForEach(Client.PaymentMethod.allCases, id: \.self) { paymentMethod in
                        Text(paymentMethod.rawValue.capitalized).tag(paymentMethod)
                    }
                }
                .listRowBackground(Color.sheetRowBackground)
                .padding(.leading, 5)
                
                
                // Editor with placeholder
                ZStack(alignment: .topLeading) {
                    if comment.isEmpty {
                        Text("Write some comment..")
                            .padding(.leading, 5)
                            .padding(.top, 8)
                            .foregroundStyle(.primary.opacity(0.25))
                    }
                    
                    CustomEditor(text: $comment, isFocusable: $focused, tag: 2)
                }
                .listRowBackground(Color.sheetRowBackground)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Add client")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        withAnimation {
                            addClient()
                            isPresented = false
                        }
                    }.bold()
                        .disabled(checkEmptyFields() ? false : true)
                }
            }
        }
        
    }
}


//MARK: Functions

extension AddClientView {
    private func addClient() {
        if checkEmptyFields() {
            getClient()
        }
    }
    
    private func getClient() {
        let client = Client(firstName: firstName, secondName: secondName, comment: comment, paymentMethod: paymentMethod)
        context.insert(client)
    }
    
    private func checkEmptyFields() -> Bool {
        guard !firstName.isEmpty && !secondName.isEmpty else { return false }
        return true
    }
}


//MARK: Preview
#Preview {
    AddClientView(isPresented: .constant(false))
        .modelContainer(for: Client.self, inMemory: true)
}

