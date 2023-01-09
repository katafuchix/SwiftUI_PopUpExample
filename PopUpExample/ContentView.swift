//
//  ContentView.swift
//  PopUpExample
//
//  Created by cano on 2023/01/09.
//

import SwiftUI

struct ContentView: View {
    @State var showPopup: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            Button("Show Popup"){
                withAnimation{
                    showPopup.toggle()
                }
            }
            .navigationTitle("SwiftUI Popup Example")
        }
        .popupNavigationView(horizontalPadding: 40, show: $showPopup) {
            
            // MARK: Your Popup content which will also performs navigations
            List{
                ForEach(tasks){task in
                    NavigationLink(task.taskTitle) {
                        Text(task.taskDescription)
                            .navigationTitle("Destination")
                    }
                }
            }
            .navigationTitle("Popup Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close"){
                        withAnimation {
                            showPopup.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
