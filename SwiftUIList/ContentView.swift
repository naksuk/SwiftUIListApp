//
//  ContentView.swift
//  SwiftUITableView
//
//  Created by naksuk on 2021/12/02.
//

import SwiftUI

struct Icon: Identifiable {
    var id: Int
    let name: String
    let image: Image
}

struct ContentView: View {
    let icons: [[Icon]] = [
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
                ForEach(icons.startIndex...(icons.endIndex - 1), id: \.self) { section in
                    Section(header: Text(self.switchHeaderTitle(section: section))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)) {
                    ForEach(icons[section]) { icon in
                            HStack {
                                icon.image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                Text(icon.name)
                                    .font(.headline)
                                    .padding(.leading, 20)
                            }
                        }
                    }.frame(height: 70)
                }
            }.navigationTitle(Text("NavigationView"))
        }
    }
    
    private func switchHeaderTitle(section: Int) -> String {
        switch section {
        case 0:
            return "legend"
        case 1:
            return "older"
        case 2:
            return "newer"
        default:
            return ""
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
