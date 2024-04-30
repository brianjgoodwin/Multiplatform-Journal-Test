//
//  CreateNewJournalView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/28/24.
//

import SwiftUI

struct CreateNewJournalView: View {
	@Environment(\.presentationMode) var presentationMode
	@State private var journalName = ""
	@State private var selectedCoverPhoto = "DefaultCover"
	let coverPhotos = ["motorcycles", "yoga", "books", "DefaultCover"] // Assuming these are in your assets
	
	var body: some View {
		NavigationView {
			Form {
				TextField("Journal Name", text: $journalName)
				Picker("Cover Photo", selection: $selectedCoverPhoto) {
					ForEach(coverPhotos, id: \.self) { photo in
						Text(photo).tag(photo)
					}
				}
				Button("Create Journal") {
					// Handle the creation of the journal
					// Add the new journal to your journals array or database
					presentationMode.wrappedValue.dismiss()
				}
			}
			.navigationBarTitle("New Journal", displayMode: .inline)
			.navigationBarItems(trailing: Button("Cancel") {
				presentationMode.wrappedValue.dismiss()
			})
		}
	}
}

#Preview {
	CreateNewJournalView()
}
