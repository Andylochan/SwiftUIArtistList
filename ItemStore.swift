//
//  ItemStore.swift
//  ApanceList_AndyLochan
//
//  Created by Andy Lochan on 8/11/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import SwiftUI

struct Item : Hashable {
    var name = String()
}

class ItemStore : ObservableObject {
    @Published var items = [
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
}
