//
//  ContentView.swift
//  ExploringTipKit
//
//  Created by Viennarz Curtiz on 7/8/23.
//

import SwiftUI
import TipKit

// Define your tip's content.
struct HomeTip: Tip {
    var title: Text {
        Text("The title here")
            .font(.largeTitle.bold())
            .foregroundStyle(Color.green)
    }
    
    
    var message: Text? {
        Text("Some Message here")
            .foregroundStyle(Color.red)
    }
    
    
    var asset: Image? {
        Image(systemName: "star")
    }

}

struct DynamicHomeTip: Tip {
    
    var title: Text {
        Text("Hi \(name)")
    }
    
    var message: Text? {
        Text("Some message or useful information here")
    }
    
    var value: Int = 0
    var name: String = ""
    
}

struct ActionableTip: Tip {
    
    
    let onTapAction: () -> Void
    
    var title: Text {
        Text("Some useful title").foregroundColor(.indigo)
    }
    
    var message: Text? {
        Text("Some useful message")
    }
    
    var asset: Image? {
        Image(systemName: "exclamationmark.shield")
    }
    
    var actions: [Action] {
        [
            Tip.Action(
                id: "action",
                title: "Action",
                perform: executeAction
            )
        ]
    }
    
    @Sendable
    func executeAction() {
        onTapAction()
    }
}

struct ContentView: View {
    let homeTip = HomeTip()
    let dynamicHomeTip = DynamicHomeTip(value: 4, name: "John")
    let actionableTip = ActionableTip {
        debugPrint("Tap")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Divider()
                
                Section {
                    TipView(homeTip)
                    
                } header: {
                    Text("Regular Tip")
                        .sectionTitle()
                }
                
                Section {
                    TipView(dynamicHomeTip)
                    
                } header: {
                    Text("Customized Text Tip")
                        .sectionTitle()
                }

                    
                Section {
                    TipView(actionableTip)
                    
                } header: {
                    Text("Tip with Action")
                        .sectionTitle()
                }

                
                Spacer(minLength: 32)
                
            }
            .padding()
            
            
                        
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func sectionTitle() -> some View {
        frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3.bold())
    }
}
