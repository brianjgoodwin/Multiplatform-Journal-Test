//
//  SettingsView.swift
//  Commonplace Book2
//
//  Created by Brian on 4/28/24.
//

import SwiftUI

struct SettingsView: View {
	@State private var notificationsEnabled = true
	@State private var locationServicesEnabled = false
	@State private var darkModeEnabled = false
	@State private var selectedColor = "Blue"
	@State private var volume: Double = 50
	
	let themeColors = ["Blue", "Green", "Red", "Purple"]
	
	var body: some View {
		Form {
			Toggle("Enable Notifications", isOn: $notificationsEnabled)
			Toggle("Enable Location Services", isOn: $locationServicesEnabled)
			Toggle("Dark Mode", isOn: $darkModeEnabled)
			Picker("Theme Color", selection: $selectedColor) {
				ForEach(themeColors, id: \.self) {
					Text($0)
				}
			}
			Slider(value: $volume, in: 0...100, step: 1)
			Text("Volume: \(Int(volume))%")
			Section(header: Text("About")) {
				Text("Explore a wide range of settings to customize the app according to your preferences. This includes adjusting notifications, location services, theme colors, and more. This is a dummy settings view filled with various controls to simulate potential settings in a real app.")
					.padding()
			}
		}
	}
}

#Preview {
	SettingsView()
}
