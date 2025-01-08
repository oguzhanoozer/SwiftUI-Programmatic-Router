//
//  ProfileView.swift
//  ProgrammaticRouter
//
//  Created by oguzhan on 7.01.2025.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading = false
    @Published var error: Error?
    
    func loadUserProfile(username: String) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.user = User(
                username: username,
                email: "\(username)@example.com",
                fullName: "John Doe",
                joinDate: Date(),
                bio: "iOS Developer",
                avatarURL: "avatar_url"
            )
            self.isLoading = false
        }
    }
}

struct ProfileView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel = ProfileViewModel()
    
    let username: String
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let user = viewModel.user {
                ScrollView {
                    VStack(spacing: 20) {
                        ProfileHeader(user: user)
                        
                        UserInfoSection(user: user)
                        
                        ActionButtons()
                        
                        StatisticsView()
                    }
                    .padding()
                }
            } else if viewModel.error != nil {
                ErrorView()
            }
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                }
            }
        }
        .onAppear {
            viewModel.loadUserProfile(username: username)
        }
    }
}

struct ProfileHeader: View {
    let user: User
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(user.fullName)
                .font(.title2)
                .bold()
            
            Text("@\(user.username)")
                .foregroundColor(.gray)
            
            Text(user.bio)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
        }
    }
}

struct UserInfoSection: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            InfoRow(title: "E-mail", value: user.email)
            InfoRow(title: "Join Date", value: user.joinDate.formatted())
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}

struct ActionButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                Label("Message", systemImage: "message")
            }
            .buttonStyle(.bordered)
            
            Button(action: {}) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.bordered)
        }
    }
}

struct StatisticsView: View {
    var body: some View {
        HStack(spacing: 30) {
            StatItem(title: "Posts", value: "156")
            StatItem(title: "Follower", value: "2.3K")
            StatItem(title: "Following", value: "1.1K")
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct StatItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct ErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
            Text("An error occured")
                .padding()
            Button("Try Again") {
            }
        }
    }
}
