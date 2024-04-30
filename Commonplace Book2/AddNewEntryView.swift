//
//  AddNewEntryView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/28/24.
//

import SwiftUI

struct AddNewEntryView: View {
	@Environment(\.presentationMode) var presentationMode
	@State private var entryTitle = ""
	@State private var entryContent = ""
	
	var body: some View {
		NavigationView {
			Form {
				TextField("Entry Title", text: $entryTitle)
				TextEditor(text: $entryContent)
					.frame(minHeight: 300) // Adjust the height as needed
				Button("Add Entry") {
					// Handle the addition of the new entry
					// Save the entry data to your journal model
					presentationMode.wrappedValue.dismiss()
				}
			}
			.navigationBarTitle("New Entry", displayMode: .inline)
			.navigationBarItems(trailing: Button("Cancel") {
				presentationMode.wrappedValue.dismiss()
			})
		}
	}
}

#Preview {
	AddNewEntryView()
}
