//
//  SettingsView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    @State private var selectedLanguage = "Türkçe"
    
    let languages = ["Türkçe", "English", "Español"]
    
    var body: some View {
        Form {
            Section(header: Text("General Settings")) {
                Toggle("Dark Mode", isOn: $isDarkMode)
                Toggle("Notifications", isOn: $notificationsEnabled)
                
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
            }
            
            Section(header: Text("Account")) {
                Button("View Profile") {
                    router.navigate(to: .profile(username: "currentUser"))
                }
                
                Button("Sign Out") {
                    router.navigateToRoot()
                }
            }
            
            Section(header: Text("Account Information")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.gray)
                }
                
                NavigationLink("Privacy Policy") {
                    PrivacyPolicyView()
                }
                
                NavigationLink("Terms of Use") {
                    TermsOfServiceView()
                }
            }
            
            Section {
                Button("Return to Home") {
                    router.navigateToRoot()
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            Text("Privacy Policy content...")
                .padding()
        }
        .navigationTitle("Privacy Policy")
    }
}

struct TermsOfServiceView: View {
    var body: some View {
        ScrollView {
            Text("Terms of Use content...")
                .padding()
        }
        .navigationTitle("Terms of Use")
    }
}
