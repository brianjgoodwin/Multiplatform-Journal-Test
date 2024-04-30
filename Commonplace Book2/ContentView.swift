//
//  ContentView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/25/24.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
#if os(iOS)
		TabView {
			NavigationView {
				JournalsGridView()
			}
			.tabItem {
				Label("Journals", systemImage: "book.closed")
			}
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gear")
				}
		}
#else
		NavigationView {
			List {
				NavigationLink(destination: JournalsGridView()) {
					Label("Journals", systemImage: "book.closed")
				}
				NavigationLink(destination: SettingsView()) {
					Label("Settings", systemImage: "gear")
				}
			}
			.listStyle(SidebarListStyle())
			.navigationTitle("Categories")
			
			JournalsGridView()
		}
#endif
	}
}

struct Journal: Identifiable {
	var id: Int
	var name: String
	var coverPhoto: String
	var entries: [JournalEntry]
}

struct JournalEntry {
	var title: String
	var content: String
}

#Preview {
	ContentView()
}
