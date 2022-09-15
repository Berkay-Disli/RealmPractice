//
//  AddShoppingListView.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import SwiftUI
import RealmSwift

struct AddShoppingListView: View {
    @State private var title = ""
    @State private var address = ""
    @Environment(\.dismiss) var dismiss
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter address", text: $address)
                
                Button {
                    let newShoppingList = ShoppingList()
                    newShoppingList.title = title
                    newShoppingList.address = address
                    $shoppingLists.append(newShoppingList)
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("New List")
    }
}

struct AddShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddShoppingListView()
        }
    }
}
