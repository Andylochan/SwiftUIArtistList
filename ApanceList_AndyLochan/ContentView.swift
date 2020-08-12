//
//  ContentView.swift
//  ApanceList_AndyLochan
//
//  Created by Andy Lochan on 8/11/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var addItemName: String = ""
    @State var addItem = false
    
    @ObservedObject var itemStore = ItemStore()
    @Environment(\.presentationMode) var presentationMode //dismiss modal
    
    var body: some View {

        ZStack {
            NavigationView {
                List {
                    ForEach(self.itemStore.items, id: \.self) { item in
                        VStack {
                            Text(item.name)
                                .font(.system(size: 20))
                        }
                    }
                    .onMove(perform: move)
                }
                .navigationBarTitle("Artist List")
                    
                    //Nav bar buttons to enable add / edit functions
                    .navigationBarItems(
                        leading: Button(action:
                        {
                            self.addItem.toggle()
                        })
                        {
                            Image(systemName: "plus")
                        },
                        trailing: EditButton()
                )
                
            }.sheet(isPresented: $addItem) {
                VStack {
                    HStack {
                        Text("Add Artist: ")
                        TextField("Enter artist info", text: self.$addItemName)
                    }
                    Button(action: {
                        self.itemStore.items.append(Item(name: self.addItemName))
                        self.addItem.toggle() //Toggle off
                        self.addItemName = ""
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Add")
                    })
                }.padding(100)
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        itemStore.items.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




