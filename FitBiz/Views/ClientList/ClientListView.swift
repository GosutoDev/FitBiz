//
//  ClientListView.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import SwiftUI
import SwiftData

struct ClientListView: View {
    
    // COlorScheme
    @Environment(\.colorScheme) var colorScheme
    
    // SwiftData
    @Environment(\.modelContext) var context
    @Query(sort: \Client.firstName) private var clients: [Client]
    
    // Handle the sheet
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(clients) { client in
                NavigationLink(value: client) {
                    ClientCell(
                        firstName: client.firstName,
                        secondName: client.secondName,
                        paymentMethod: client.paymentMethod)
                }
                .listRowBackground(Color.getRowBackground(colorScheme))
            }
            .onDelete(perform: deleteClient)
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Clients")
        .navigationDestination(for: Client.self, destination: ClientDetailView.init)
        
        // Toolbar buttons
        .toolbar {
            ToolbarItem {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        //Sheet add client
        .sheet(isPresented: $isPresented, content: {
            AddClientView(isPresented: $isPresented)
                .presentationDetents([.medium])
               
        })
    }
}

//MARK: Functions
extension ClientListView {
    private func deleteClient(indexSet: IndexSet) {
        for index in indexSet {
            context.delete(clients[index])
        }
    }
}

#Preview {
    NavigationStack {
        ClientListView()
            .modelContainer(for: Client.self, inMemory: true)
    }
}
