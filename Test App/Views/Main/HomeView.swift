import SwiftUI

struct HomeView: View {
    
    @AppStorage("isSecretSetting1Enabled") var isSecretSetting1Enabled: Bool = false
    @State private var isButtonClicked1: Bool = false
    @State private var isButtonClicked2: Bool = false
    @State private var isButtonClicked3: Bool = false
    @State private var isButtonClicked4: Bool = false
    @State private var isButtonClicked5: Bool = false
    @State private var isButtonClicked6: Bool = false
    @State private var button6SecretCount: Int = 0
    @State private var isButtonClicked7: Bool = false
    
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
            
            if isButtonClicked6 {
                
                SecretAlert6View(isShown: $isButtonClicked6)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
            if isButtonClicked7 {
                
                SecretAlert7View(isShown: $isButtonClicked7)
                    .frame(minWidth: 700)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                
            }
            
        }
        .overlay(
            
            VersionView()
                .padding(.bottom, 20),
            
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
                    
                    Text("helloSwiftUI")
                        .font(.custom("SF Pro", size: 32))
                    
                    Image(systemName: "swift")
                        .font(.custom("SF Pro", size: 32))
                    
                    Text("UI!")
                        .font(.custom("SF Pro", size: 32))
                    
                }
                .multilineTextAlignment(.center)
                .padding()
                    
                HStack(spacing: 15) {
                    
                    Button("1") {
                        
                        withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                            
                            isButtonClicked1 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                    )
                    
                    Button("2") {
                        
                        withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                            
                            isButtonClicked2 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                    )
                    
                    Button("3") {
                        
                        withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                            
                            isButtonClicked3 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                    )
                    
                    Button("4") {
                        
                        withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                            
                            isButtonClicked4 = true
                            
                        }
                        
                    }
                    .buttonStyle(.bordered)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                    )
                    
                    Button("5") {
                        
                        withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                            
                            isButtonClicked5 = true
                            
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                    )
                    
                    if isSecretSetting1Enabled == true {
                        
                        Button("6") {
                            
                            withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                                
                                isButtonClicked6 = true
                                
                            }
                            
                            button6SecretCount += 1
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5)
                            
                        )
                        
                    }
                    
                    if button6SecretCount == 10 {
                        
                        Button("7") {
                            
                            withAnimation(.spring(response: 0.2, dampingFraction: 1)) {
                                
                                isButtonClicked7 = true
                                
                            }
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5)
                            
                        )
                        
                    }
                    
                }
                .frame(minWidth: 300, minHeight: 40)
                .background(.background)
                .cornerRadius(16)
                .padding()
                
                HStack {
                    
                    Text("closePop-upWindowInstruction")
                        .font(.custom("SF Pro", size: 13))
                    
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
                
                HStack(spacing: 16) {
                    
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
                    
                    HStack {
                        
                        Image(systemName: "network")
                            .font(.custom("SF Pro", size: 22))
                        
                        Link("releasesLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App/releases")!)
                            .font(.custom("SF Pro", size: 16))
                        
                    }
                    
                    HStack {
                        
                        Image(systemName: "tray.full.fill")
                            .font(.custom("SF Pro", size: 22))
                        
                        Link("repoLink", destination: URL(string: "https://github.com/matvei-cyber/Test-App")!)
                            .font(.custom("SF Pro", size: 16))
                        
                    }
                    .padding(.leading)
                    
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding()
                
            }
            
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
        .padding(.bottom, 10)
        
    }
}
