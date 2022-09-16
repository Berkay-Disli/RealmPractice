//
//  ShoppingListItemsView.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import SwiftUI
import RealmSwift

struct ShoppingListItemsView: View {
    @ObservedRealmObject var shoppingList: ShoppingList
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            List {
                ForEach(shoppingList.items, id:\.self) { item in
                    Text(item.title)
                }
            }
        }
        .navigationTitle("Items")
        .sheet(isPresented: $isPresented, content: {
            AddShoppingListItemView(shoppingList: shoppingList)
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct ShoppingListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShoppingListItemsView(shoppingList: ShoppingList())
        }
    }
}
