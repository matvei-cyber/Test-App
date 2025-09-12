import SwiftUI

struct HomeView: View {
    
    @State private var isButtonClicked1: Bool = false
    @State private var isButtonClicked2: Bool = false
    @State private var isButtonClicked3: Bool = false
    @State private var isButtonClicked4: Bool = false
    @State private var isButtonClicked5: Bool = false
    
    var body: some View {
        
        ZStack {
            
            mainContent
                .allowsHitTesting(!(isButtonClicked5))
                .frame(minWidth: 700)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if isButtonClicked1 {
                
                Alert1View(isShown: $isButtonClicked1)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked2 {
                
                Alert2View(isShown: $isButtonClicked2)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked3 {
                
                Alert3View(isShown: $isButtonClicked3)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked4 {
                
                Alert4View(isShown: $isButtonClicked4)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked5 {
                
                Alert5View(isShown: $isButtonClicked5)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
        }
        .overlay(
            
            InfoView()
                .padding(.bottom, 12),
            
            alignment: .bottom
            
        )
        
    }
    
    var mainContent: some View {
        
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Image("Logo")
                    .padding()
                
                HStack {
                    
                    Text("helloText")
                        .font(.custom("SF Pro", size: 32))
                    
                    Image(systemName: "swift")
                        .font(.custom("SF Pro", size: 32))
                    
                    Text("UI!")
                        .font(.custom("SF Pro", size: 32))
                    
                }
                .multilineTextAlignment(.center)
                .padding()
                
                HStack(spacing: 15) {
                    
                    Button("1") { isButtonClicked1 = true }.buttonStyle(.bordered).cornerRadius(6)
                    Button("2") { isButtonClicked2 = true }.buttonStyle(.bordered).cornerRadius(6)
                    Button("3") { isButtonClicked3 = true }.buttonStyle(.bordered).cornerRadius(6)
                    Button("4") { isButtonClicked4 = true }.buttonStyle(.bordered).cornerRadius(6)
                    Button("5") {
                        
                        withAnimation(.spring(response: 0.25, dampingFraction: 1.0)) {
                            
                            isButtonClicked5 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    Text("closePop-upWindowInstruction")
                        .font(.custom("SF Pro", size: 12))
                    
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
        .padding(.bottom, 10)
        
    }
}
