//
//  SignupView.swift
//  SpotifyUI
//
//  Created by Kwabena Berko on 1/13/24.
//

import SwiftUI


private enum Destination: Hashable {
    case email
    case password
    case gender
    case name
    case artists
    case podcasts
}

struct SignupState: Equatable {
    var email: String = ""
    var password: String = ""
    var name: String = ""
    var sendNewsAndOffers: Bool = false
    var shareRegistrationData: Bool = false
    var artistSearchText: String = ""
    var artists: [Artist] = []
    var podcastSearchText: String = ""
    var podcasts: [Podcast] = []
}

let mockSignupState = SignupState(
    email: "eobardthawne@gmail.com",
    password: "12345678",
    name: "Eobard Thawne",
    sendNewsAndOffers: false,
    shareRegistrationData: false,
    artistSearchText: "",
    artists:mockArtists,
    podcastSearchText: "",
    podcasts: mockPodcasts
)

struct SignupView: View {
    @EnvironmentObject private var navigator: AuthNavigator
    @State private var state = mockSignupState
    @State private var destinations: [Destination] = [.email]
    @State private var isForwardTransition: Bool = false
    private let isUserLoggedIn = IsUserLoggedIn.shared
    
    var body: some View {
        SignupContentView(
            destination: $destinations.last!,
            isForwardTransition: $isForwardTransition,
            state: $state,
            onBackTapped: back,
            onNextTapped: next,
            onArtistTapped: { artist in
                if let index = state.artists.firstIndex(of: artist) {
                    state.artists[index].isSelected.toggle()
                }
            },
            onPodcastTapped: { podcast in
                if let index = state.podcasts.firstIndex(of: podcast) {
                    state.podcasts[index].isSelected.toggle()
                }
            },
            onSignupCompleteTapped: {
                isUserLoggedIn.subject.send(true)
            }
        )
    }
    
    private func back() {
        isForwardTransition = false
        
        withAnimation(.linear(duration: 0.25)) {
            if destinations.count == 1 {
                navigator.pop()
            } else {
                destinations.removeLast()
            }
        }
    }
    
    private func next(_ destination: Destination) {
        isForwardTransition = true
        
        withAnimation(.linear(duration: 0.25)) {
            if !destinations.contains(destination) {
                destinations.append(destination)
            }
        }
    }
}

private struct SignupContentView: View {
    
    @Binding var destination: Destination
    @Binding var isForwardTransition: Bool
    @Binding var state: SignupState
    let onBackTapped: () -> Void
    let onNextTapped: (Destination) -> Void
    let onArtistTapped: (Artist) -> Void
    let onPodcastTapped: (Podcast) -> Void
    let onSignupCompleteTapped: () -> Void
    
    
    var body: some View {
        
        let transition = AnyTransition.asymmetric(
            insertion: .move(edge: isForwardTransition ? .trailing : .leading),
            removal: .move(edge: isForwardTransition ? .leading : .trailing)
        )
        
        GeometryReader { _ in
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                switch destination {
                    
                case .email: EmailView(
                    email: $state.email,
                    onNextTapped: {
                        onNextTapped(.password)
                    }
                )
                .transition(transition)
                    
                case .password: PasswordView(
                    password: $state.password,
                    onNextTapped: {
                        onNextTapped(.gender)
                    }
                )
                .transition(transition)
                    
                case .gender: GenderView(
                    onNextTapped: {
                        onNextTapped(.name)
                    }
                )
                .transition(transition)
                    
                case .name: NameView(
                    name: $state.name,
                    sendNewsAndOffers: $state.sendNewsAndOffers,
                    shareRegistrationData: $state.shareRegistrationData,
                    onNextTapped: {
                        onNextTapped(.artists)
                    }
                )
                .transition(transition)
                    
                case .artists: ArtistListView(
                    searchText: $state.artistSearchText,
                    artists: $state.artists,
                    onArtistTapped: onArtistTapped,
                    onDoneTapped: {
                        onNextTapped(.podcasts)
                    }
                )
                .transition(transition)
                    
                default: PodcastListView(
                    searchText: $state.podcastSearchText,
                    podcasts: $state.podcasts,
                    onPodcastTapped: onPodcastTapped,
                    onDoneTapped: onSignupCompleteTapped
                )
                .transition(transition)
                    
                }
            }
            
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView(onTapped: onBackTapped)
            }
            
            ToolbarItem(placement: .principal) {
                Text(destinationTitle)
                    .font(Font.style.caption)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
                    .animation(nil)
            }
        }
    }
    
}


private extension SignupContentView {
    var destinationTitle: String {
        let text: String
        
        switch destination {
        case .artists:
            text = String(localized: "Choose 3 or more artists you like.")
        case .podcasts:
            text = ""
        default:
            text = String(localized: "Create account")
        }
        
        return text
    }
    
    var selectedArtists: Int {
        return state.artists
            .filter { $0.isSelected }
            .count
    }
}


struct TextFieldView<Content: View>: View {
    private var footnote: String? = nil
    private let content: () -> Content
    
    init(
        footnote: String? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.footnote = footnote
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            content()
                .frame(height: 20)
                .padding(15)
                .tint(Color.white)
                .font(Font.style.caption2)
                .fontWeight(.bold)
                .textInputAutocapitalization(.never)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color.theme.neutral)
                )
            
            Spacer().frame(height: 10)
            
            HStack {
                if let footnote = footnote {
                    Text(footnote)
                        .font(Font.style.footnote2)
                        .fontWeight(.bold)
                }
            }
            .frame(height: 10)
            .opacity(footnote == nil ? 0 : 1)
        }
    }
}

struct SignupLayoutModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 24)
            .padding(.top, 28)
            .background(Color.theme.background)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        SignupContentView(
            destination: .constant(.email),
            isForwardTransition: .constant(true),
            state: .constant(mockSignupState),
            onBackTapped: { },
            onNextTapped: { _ in },
            onArtistTapped: { _ in },
            onPodcastTapped: { _ in },
            onSignupCompleteTapped: { }
        )
    }
}

