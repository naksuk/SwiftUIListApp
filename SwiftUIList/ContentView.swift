//
//  ContentView.swift
//  SwiftUITableView
//
//  Created by naksuk on 2021/12/02.
//

import SwiftUI

struct Drink: Identifiable {
    var id: Int
    let name: String
    let image: Image
}

struct ContentView: View {
    let drinks: [[Drink]] = [
        [.init(id: 0, name: "enegy", image: Image("enegy")),
        .init(id: 1, name: "khaos", image: Image("khaos")),
        .init(id: 2, name: "absolute_zero", image: Image("absolute_zero"))],
        
        [.init(id: 0, name: "ultra", image: Image("ultra")),
        .init(id: 1, name: "m3", image: Image("m3")),
        .init(id: 2, name: "rosi", image: Image("rosi"))],
        
        [.init(id: 0, name: "big_enegy", image: Image("big_enegy")),
        .init(id: 2, name: "cuba_libre", image: Image("cuba_libre")),
        .init(id: 3, name: "pipeline_punch", image: Image("pipeline_punch")),
        .init(id: 4, name: "super_cola", image: Image("super_cola"))],
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(drinks.startIndex...(drinks.endIndex - 1), id: \.self) { section in
                    Section(header: Text(self.switchHeaderTitle(section: section))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)) {
                    ForEach(drinks[section]) { drink in
                        DrinkRow(drink: drink, generation: self.switchHeaderTitle(section: section))
                        }
                    }.frame(height: 70)
                }
            }.navigationTitle(Text("NavigationView"))
        }
    }
    
    private func switchHeaderTitle(section: Int) -> String {
        switch section {
        case 0:
            return "Legend"
        case 1:
            return "Older"
        case 2:
            return "Newer"
        default:
            return ""
        }
        
    }
}

struct DrinkRow: View {
    
    let drink: Drink
    let generation: String
    
    var body: some View {
        HStack {
            NavigationLink(destination: DrinkDetail(drink: drink, generation: generation)) {
                drink.image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                Text(drink.name)
                    .font(.headline)
                    .padding(.leading, 20)
            }
        }
    }
}

struct DrinkDetail: View {
    let drink: Drink
    let generation: String
    
    var body: some View {
        NavigationView {
            VStack {
                drink.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400, alignment: .top)
                    .border(.black, width: 0.5)
                    .padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))
                HStack {
                    Text(drink.name)
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(.gray)
                }
                .frame(width: 400, height: 40, alignment: .trailing)
                .padding(.trailing, 60)
                HStack {
                    Text(generation)
                        .font(.system(size: 40, weight: .heavy))
                        .padding(.leading, 30)
                }
                .frame(width: 400, height: 40, alignment: .leading)
                .padding(.leading, 60)
            }.padding(.top, -200)
        }.navigationBarTitle(Text("Drinlk"), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
