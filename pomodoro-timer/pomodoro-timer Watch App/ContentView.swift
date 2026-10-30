//
//  ContentView.swift
//  pomodoro-timer Watch App
//
//  Created by Mia Gomez on 10/29/26.
//

import SwiftUI

struct ContentView: View {
    // Saved on the watch so it survives closing the app.
    @AppStorage("sessionsToday") private var sessionsToday = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 6) {
                Image("puppy")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                NavigationLink {
                    TimerOptionsView()
                } label: {
                    Text("Start")
                        .font(.system(.title3, design: .rounded).weight(.heavy))
                        .foregroundStyle(Color.pupInk)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.pupCyan, in: Capsule())
                        .overlay(Capsule().stroke(Color.pupInk, lineWidth: 2))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 8)
            .containerBackground(Color.pupBone, for: .navigation)
            .foregroundStyle(Color.black)
            .navigationTitle("pomodoro pup :3")
        }
        .tint(Color.pupCyan)
    }
}

// MARK: - Mascot

/// Dashed box standing in for the mascot art.
/// Later: add your drawing to Assets.xcassets (e.g. named "mascot")
/// and swap this view for `Image("mascot").resizable().scaledToFit()`.
struct MascotPlaceholder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color.white.opacity(0.08))
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [6, 4]))
            )
            .overlay {
                VStack(spacing: 4) {
                    Image(systemName: "pawprint.fill")
                        .font(.title2)
                    Text("Let's focus!")
                        .font(.system(.footnote, design: .rounded).weight(.bold))
                }
                .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Timer options (placeholder)

/// Temporary screen so the Start button has somewhere to go.
/// We'll replace this with the real 10 / 15 / 30 / 45 / Custom screen next.
struct TimerOptionsView: View {
    var body: some View {
        Text("Timer options coming next")
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.center)
            .navigationTitle("Pick a timer")
    }
}

// MARK: - Colors

extension Color {
    static let pupCyan = Color(red: 0.86, green: 0.98, blue: 1.0)   // #DCFAFE
    static let pupInk  = Color(red: 0.18, green: 0.16, blue: 0.16)  // #2E2A28
    static let pupBone = Color(red: 0.96, green: 0.97, blue: 0.98)  // #F5F8FA
    //static let textColor = Color(black: 0.24)
}

#Preview {
    ContentView()
}
