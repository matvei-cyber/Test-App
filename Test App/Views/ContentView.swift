import SwiftUI

struct ContentView: View {
    
    @State private var isButtonClicked1: Bool = false
    @State private var isButtonClicked2: Bool = false
    @State private var isButtonClicked3: Bool = false
    @State private var isButtonClicked4: Bool = false
    @State private var showReleaseNotes: Bool = false
    
    var body: some View {
        
        ZStack {
            
            if showReleaseNotes {
                
                ReleaseNotesView {
                    
                    withAnimation { showReleaseNotes = false }
                }
                .frame(minWidth: 1200, minHeight: 825)
                .transition(.move(edge: .trailing))
            } else {
                
                mainContent
                    .frame(minWidth: 1200, minHeight: 825)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.default, value: showReleaseNotes)
        .overlay(
            InfoView(showReleaseNotes: $showReleaseNotes)
                .padding(.bottom, 12),
            alignment: .bottom
        )
        .animation(.default, value: showReleaseNotes)
    }
    
    private var mainContent: some View {
        
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Image("Logo")
                    .padding()
                
                HStack(spacing: 16) {
                    
                    Image(systemName: "lessthan")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    Image(systemName: "greaterthan")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("helloText")
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 16) {
                    
                    Button("1") { isButtonClicked1 = true }
                    Button("2") { isButtonClicked2 = true }
                    Button("3") { isButtonClicked3 = true }
                    Button("4") { isButtonClicked4 = true }
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.bordered)
                .padding()
                
                HStack(spacing: 16) {
                    
                    Link("Apple", destination: URL(string: "https://apple.com")!)
                    Link("Apple Developer", destination: URL(string: "https://developer.apple.com")!)
                    Link("SwiftUI", destination: URL(string: "https://developer.apple.com/swiftui")!)
                    Link("Google", destination: URL(string: "https://google.com")!)
                    Link("Microsoft", destination: URL(string: "https://microsoft.com")!)
                }
                .font(.system(size: 14))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    HStack {
                        
                        Image(systemName: "tray.full.fill")
                            .font(.system(size: 20))
                        
                        Link("repoLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App")!)
                            .font(.system(size: 16))
                    }
                    .padding()
                    
                    HStack {
                        
                        Image(systemName: "network")
                            .font(.system(size: 22))
                        
                        Link("releasesLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App/releases")!)
                            .font(.system(size: 16))
                    }
                }
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 16) {
                    
                    if isButtonClicked1 {
                        Text("writtenText")
                            .font(.system(size: 14))
                    }
                    
                    if isButtonClicked2 {
                        Text("interfaceText")
                            .font(.system(size: 14))
                    }
                    
                    if isButtonClicked3 {
                        Text("byClickingText")
                            .font(.system(size: 14))
                    }
                    
                    if isButtonClicked4 {
                        Text("buildNumberSecret")
                            .font(.system(size: 14))
                    }
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
