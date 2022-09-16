//
//  AddShoppingListItemView.swift
//  RealmPractice
//
//  Created by Berkay Disli on 15.09.2022.
//

import SwiftUI
import RealmSwift

struct AddShoppingListItemView: View {
    @ObservedRealmObject var shoppingList: ShoppingList
    @Environment(\.dismiss) var dismiss
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let data = ["Produce", "Fruits", "Meat", "Condiments", "Beverages","Snacks"]
    @State private var title = ""
    @State private var quantity = ""
    @State private var selectedCategory = ""
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .font(.callout)
                            .fontWeight(selectedCategory == item ? .medium:.regular)
                            .foregroundColor(.white)
                            .frame(width: selectedCategory != item && selectedCategory != "" ? 110:120, height: selectedCategory != item && selectedCategory != "" ? 40:45)
                            .background(selectedCategory == item ? .green:.orange)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedCategory = item
                                }
                            }
                    }
                }
                .padding(.bottom)
                
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                TextField("Quantity", text: $quantity)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    let newShoppingItem = ShoppingItem()
                    newShoppingItem.title = title
                    newShoppingItem.quantity = Int(quantity) ?? 1
                    newShoppingItem.category = selectedCategory
                    $shoppingList.items.append(newShoppingItem)
                    
                    isPresented = false
                    //dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .padding(.top)
                
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Item")
        }
    }
}

struct AddShoppingListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListItemView(shoppingList: ShoppingList())
    }
}
