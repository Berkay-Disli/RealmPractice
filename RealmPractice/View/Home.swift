//
//  Home.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import SwiftUI
import RealmSwift

struct Home: View {
    @State private var isPresented = false
    @ObservedResults(ShoppingList.self) var shoppingLists
    var body: some View {
        NavigationView {
            
            VStack {
                if !shoppingLists.isEmpty {
                    List {
                        ForEach(shoppingLists, id:\.self) { shoppingList in
                            NavigationLink {
                                ShoppingListItemsView(shoppingList: shoppingList)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(shoppingList.title)
                                    Text(shoppingList.address)
                                        .font(.callout)
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                        .onDelete(perform: $shoppingLists.remove)
                    }
                } else {
                    Text("No shopping list item")
                        .font(.title3)
                }
            }
            .navigationTitle("Grocery App")
            .sheet(isPresented: $isPresented, content: {
                AddShoppingListView()
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
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
