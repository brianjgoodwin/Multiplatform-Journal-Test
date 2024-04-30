//
//  JournalDetailView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/28/24.
//

import SwiftUI


// Ensure you have a sample Journal object
let sampleJournal = Journal(id: 1, name: "Sample Journal", coverPhoto: "defaultCover", entries: [
	JournalEntry(title: "Sample Entry 1", content: "This is the content of the first entry."),
	JournalEntry(title: "Sample Entry 2", content: "This is the content of the second entry.")
])

struct JournalDetailView: View {
	var journal: Journal
	@State private var showingAddNewEntry = false
	
	var body: some View {
		ScrollView {
			VStack {
				Image(journal.coverPhoto) // Displaying the cover photo
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: 200) // Makes the image take full width of the view
					.overlay(Rectangle().stroke(Color.gray, lineWidth: 1)) // Optional: adds a border
					.padding(.bottom, 20)
				
				// Displaying the journal entries below the cover photo
				ForEach(journal.entries, id: \.title) { entry in
					VStack(alignment: .leading) {
						Text(entry.title).font(.headline)
						Text(entry.content).font(.body)
					}
					.padding()
				}
			}
		}
		.navigationTitle(journal.name)
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button("Add New Entry") {
					showingAddNewEntry = true
				}
				.sheet(isPresented: $showingAddNewEntry) {
					AddNewEntryView()
				}
			}
		}
	}
}

#Preview {
	JournalDetailView(journal: sampleJournal)
}
