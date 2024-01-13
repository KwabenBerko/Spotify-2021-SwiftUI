//
//  ContentView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject private var navigator: AuthNavigator
    
    var body: some View {
         StartContentView(
            onSignupTapped: {
                navigator.push(.signup)
            }
         )
    }
}

private struct StartContentView: View {
    
    let onSignupTapped: () -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.theme.background
                .ignoresSafeArea()
                
            backgroundImage
            
            VStack {
                Spacer()
                
                logoAndText
                
                Spacer().frame(height: 30)
                
                buttons
            }
            .padding(.horizontal, 24)
        }
    }
}

private extension StartContentView {
    private var backgroundImage: some View {
        Image("BackgroundImage")
            .resizable()
            .scaledToFit()
            .ignoresSafeArea()
    }
    
    private var logoAndText: some View {
        VStack {
            Image("Logo")
            Spacer().frame(height: 12)
            Text(String(localized: "Millions of Songs.\nFree on Spotify."))
                .font(Font.style.title)
                .fontWeight(.heavy)
                .lineSpacing(8.0)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
        }
    }
    
    private var buttons: some View {
        VStack(spacing: 12) {
            PrimaryButtonView(
                text: String(localized: "Sign up free"),
                onTap: onSignupTapped
            )
            
            SocialButtonView(
                image: Image("GoogleIcon"),
                text: String(localized: "Continue with Google"),
                onTap: {}
            )
            
            SocialButtonView(
                image: Image("FacebookIcon"),
                text: String(localized: "Continue with Facebook"),
                onTap: {}
            )
            
            SocialButtonView(
                image: Image("AppleIcon"),
                text: String(localized: "Continue with Apple"),
                onTap: {}
            )
            
            FlatButtonView(
                text: String(localized: "Log in"),
                onTap: {}
            )
            
            Spacer().frame(height: 16)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StartContentView(
        onSignupTapped: {}
    )
}

