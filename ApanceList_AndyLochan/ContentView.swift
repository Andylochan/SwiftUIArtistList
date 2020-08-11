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
    @State var items = [
        Item(name: "Vincent Van Gogh - 1853 - Zundert - The Netherlands"),
        Item(name: "Pablo Picasso - 1881 - Malaga - Spain"),
        Item(name: "Takashi Murakami - 1962 - Tokyo - Japan"),
        Item(name: "Claude Monet - 1840 - Paris - France"),
        Item(name: "Utamaro - 1736 - Edo - Japan"),
        Item(name: "Frida Kahlo - 1907 - Mexico City - Mexico"),
        Item(name: "Georgia O'Keeffe - 1887 - Sun Prairie - United States"),
        Item(name: "Hokusai - 1760 - Edo - Japan"),
        Item(name: "Paul Gauguin - 1848 - Paris - France"),
        Item(name: "Jean-Michel Basquiat - 1960 - Brooklyn - United States"),
        Item(name: "James Jean - 1979 - Taipei - Taiwan")
    ]
    
    var body: some View {

        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
                .onMove(perform: move)
            }
        .navigationBarTitle("Artist List")
        
        //Nav bar buttons to enable add / edit functions
        .navigationBarItems(leading: Button(action: 
            {
                self.addItem.toggle()
            })
            {
                Image(systemName: "plus")
            },
            trailing: EditButton())
            
        }.sheet(isPresented: $addItem) {
            VStack {
                HStack {
                    Text("Add Artist: ")
                    TextField("Enter artist info", text: self.$addItemName)
                }
                Button(action: {
                    self.items.append(Item(name: self.addItemName))
                    self.addItem.toggle() //Toggle off
                    self.addItemName = ""
                }, label: {
                    Text("Add")
                })
            }.padding(100)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct Item: Hashable {
    let name: String;
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




