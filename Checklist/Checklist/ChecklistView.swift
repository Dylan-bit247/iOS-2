//
//  ContentView.swift
//  Checklist
//
//  Created by Dylan Macdonald on 10/5/21.
//

import SwiftUI


struct ChecklistView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    //interface-
    var body: some View {
      NavigationView {
        List {
          ForEach(checklist.items) { index in
            RowView(checklistItem: self.$checklist.items[index])
          }
          .onDelete(perform: checklist.deleteListItem)
          .onMove(perform: checklist.moveListItem)
        }
        .navigationBarItems(
          leading: Button(action: { self.newChecklistItemViewIsVisible = true
          }) {
            HStack {
              Image(systemName: "plus.circle.fill")
              Text("Add item")
            }
          },
          trailing: EditButton()
        )
        .navigationBarTitle("Checklist", displayMode: .inline)
        .onAppear() {
          self.checklist.printChecklistContents()
          self.checklist.saveListItems()
        }
      }
      .sheet(isPresented: $newChecklistItemViewIsVisible) {
        NewChecklistItemView(checklist: self.checklist)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
