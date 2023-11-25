//
//  ClientListView.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import SwiftUI
import SwiftData

struct ClientListView: View {
    
    // SwiftData
    @Environment(\.modelContext) var context
    @Query(sort: \Client.secondName) private var clients: [Client]
    
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
                .listRowBackground(Color.rowBackground)
            }
            .onDelete(perform: deleteClient)
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Clients")
        .navigationDestination(for: Client.self, destination: ClientDetailView.init)
        
        // Toolbar buttons
        .toolbar {
            ToolbarItemGroup {
                Button {
                    addSampleData()
                } label: {
                    Image(systemName: "plus.forwardslash.minus")
                }
                
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
    
    private func addSampleData() {
        for client in Client.clients {
            context.insert(client)
        }
    }
}

#Preview {
    NavigationStack {
        ClientListView()
            .modelContainer(for: Client.self, inMemory: true)
    }
}
