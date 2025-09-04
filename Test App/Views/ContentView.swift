import SwiftUI

struct ContentView: View {
    
    @State private var isButtonClicked1: Bool = false
    @State private var isButtonClicked2: Bool = false
    @State private var isButtonClicked3: Bool = false
    @State private var isButtonClicked4: Bool = false
    @State private var isButtonClicked5: Bool = false
    @State private var showReleaseNotes: Bool = false
    
    var body: some View {
        
        ZStack {
            
            mainContent
                .frame(minWidth: 1200, minHeight: 850)
                .opacity(showReleaseNotes ? 0 : 1)
                .blur(radius: showReleaseNotes ? 7 : 0)
                .allowsHitTesting(!(showReleaseNotes || isButtonClicked5))
            
            if showReleaseNotes {
                
                ReleaseNotesView {
                    
                    withAnimation(.easeOut(duration: 0.2)) {
                        
                        showReleaseNotes = false
                        
                    }
                    
                }
                .frame(minWidth: 1200, minHeight: 850)
                .transition(.opacity)
                
            }
            
            if isButtonClicked1 {
                
                Alert1View(isShown: $isButtonClicked1)
                    .frame(minWidth: 1200, minHeight: 850)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked2 {
                
                Alert2View(isShown: $isButtonClicked2)
                    .frame(minWidth: 1200, minHeight: 850)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked3 {
                
                Alert3View(isShown: $isButtonClicked3)
                    .frame(minWidth: 1200, minHeight: 850)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked4 {
                
                Alert4View(isShown: $isButtonClicked4)
                    .frame(minWidth: 1200, minHeight: 850)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked5 {
                
                Alert5View(isShown: $isButtonClicked5)
                    .frame(minWidth: 1200, minHeight: 850)
                    .transition(.opacity)
                
            }
            
        }
        .overlay(
            
            InfoView(showReleaseNotes: $showReleaseNotes)
                .padding(.bottom, 12),
            
            alignment: .bottom
            
        )
        
    }
    
    private var mainContent: some View {
        
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Image("Logo")
                    .padding()
                
                HStack(spacing: 16) {
                    
                    Image(systemName: "lessthan")
                        .font(.custom("SF Pro", size: 50))
                        .foregroundColor(.blue)
                    
                    Image(systemName: "greaterthan")
                        .font(.custom("SF Pro", size: 50))
                        .foregroundColor(.blue)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("helloText")
                    .font(.custom("SF Pro", size: 32))
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 16) {
                    
                    Button("1") { isButtonClicked1 = true }.buttonStyle(.bordered).cornerRadius(7)
                    Button("2") { isButtonClicked2 = true }.buttonStyle(.bordered).cornerRadius(7)
                    Button("3") { isButtonClicked3 = true }.buttonStyle(.bordered).cornerRadius(7)
                    Button("4") { isButtonClicked4 = true }.buttonStyle(.bordered).cornerRadius(7)
                    Button("5") {
                        
                        withAnimation(.spring(response: 0.25, dampingFraction: 1.0)) {
                            
                            isButtonClicked5 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .cornerRadius(7)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    Text("closePop-upWindowInstruction")
                        .font(.custom("SF Pro", size: 14))
                    
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
                
                HStack(spacing: 16) {
                    
                    Link("repoLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App")!)
                    Link("Apple", destination: URL(string: "https://apple.com")!)
                    Link("Apple Developer", destination: URL(string: "https://developer.apple.com")!)
                    Link("SwiftUI", destination: URL(string: "https://developer.apple.com/swiftui")!)
                    Link("Google", destination: URL(string: "https://google.com")!)
                    Link("Microsoft", destination: URL(string: "https://microsoft.com")!)
                    
                }
                .font(.custom("SF Pro", size: 14))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    Image(systemName: "network")
                        .font(.system(size: 22))
                    
                    Link("releasesLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App/releases")!)
                        .font(.custom("SF Pro", size: 16))
                    
                }
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding()
                
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 10)
        
    }
    
}

struct Alert1View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("writtenText")
                    .font(.custom("SF Pro", size: 14))
                
            }
            .padding(40)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 450)
        
    }
    
}

struct Alert2View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("interfaceText")
                    .font(.custom("SF Pro", size: 14))
                
            }
            .padding(40)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 450)
        
    }
    
}

struct Alert3View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("byClickingText")
                    .font(.custom("SF Pro", size: 14))
                
            }
            .padding(40)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 450)
        
    }
    
}

struct Alert4View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("buildNumberSecret")
                    .font(.custom("SF Pro", size: 14))
                
            }
            .padding(40)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 450)
        
    }
    
}

struct Alert5View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("aboutText")
                    .font(.custom("SF Pro", size: 24))
                    .bold()
                    .padding(.bottom)
                
                Text("versionText")
                    .font(.custom("SF Pro", size: 14))
                
                Text("releaseDateText")
                    .font(.custom("SF Pro", size: 14))
                
            }
            .padding(50)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 350)
        
    }
    
}
