//
//  JournalsGridView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/28/24.
//

import SwiftUI

struct JournalsGridView: View {
	var journals = [
		Journal(id: 1, name: "Motorcycles", coverPhoto: "motorcycles", entries: [
			JournalEntry(title: "First Ride", content: "Today, I had my first ride on my new bike. It was exhilarating!"),
			JournalEntry(title: "Mountain Adventure", content: "Took the bike up to the mountains. The view was breathtaking.")
		]),
		Journal(id: 2, name: "Yoga", coverPhoto: "yoga", entries: [
			JournalEntry(title: "Morning Routine", content: "Started the day with a sun salutation. Felt very energized."),
			JournalEntry(title: "Yoga Retreat", content: "Attended a weekend yoga retreat. Learned some new poses and made new friends.")
		]),
		Journal(id: 3, name: "Books", coverPhoto: "books", entries: [
			JournalEntry(title: "Recent Reads", content: "Finished reading 'Dune'. What an epic tale!"),
			JournalEntry(title: "Book Club Meeting", content: "Discussed 'To Kill a Mockingbird' at book club. Great discussion.")
		])
	]
	
	@State private var showingCreateNewJournal = false
	
	var body: some View {
		let columns = [
			GridItem(.adaptive(minimum: 100))
		]
		
		ScrollView {
			LazyVGrid(columns: columns, spacing: 20) {
				ForEach(journals) { journal in
					NavigationLink(destination: JournalDetailView(journal: journal)) {
						VStack {
							Image(journal.coverPhoto)
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(height: 100)
								.cornerRadius(10)
								.clipped()
							Text(journal.name)
						}
					}
				}
				
				Button(action: {
					showingCreateNewJournal = true
				}) {
					VStack {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.scaledToFit()
							.frame(height: 100)
							.foregroundColor(.blue)
							.padding(.bottom, 4) // Adjust padding to align with other images if necessary
						Text("Add New Journal")
					}
				}
				.background(Color.gray.opacity(0.3))
				.cornerRadius(10)
				.sheet(isPresented: $showingCreateNewJournal) {
					CreateNewJournalView()
				}
			}
			.padding()
		}
	}
}

#Preview {
	JournalsGridView()
}
