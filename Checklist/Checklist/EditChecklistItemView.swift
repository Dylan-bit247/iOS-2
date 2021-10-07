//
//  EditChecklistItemView.swift
//  Checklist
//
//  Created by Dylan Macdonald on 10/5/21.
//

import SwiftUI

struct EditChecklistItemView: View {

  @Binding var checklistItem: ChecklistItem

  var body: some View {
    Form {
      TextField("Name", text: $checklistItem.name)
      Toggle("Completed", isOn: $checklistItem.isChecked)
    }
  }
}

struct EditChecklistItemView_Previews: PreviewProvider {
  static var previews: some View {
    EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
  }
}
