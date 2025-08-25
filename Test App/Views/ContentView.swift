import SwiftUI

struct ContentView: View {
    
    @State private var Button1: Bool = false
    @State private var Button2: Bool = false
    @State private var Button3: Bool = false
    @State private var Button4: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 14) {
                    
                    Image("Logo")
                        .padding()
                    
                    HStack(spacing: 15) {
                        
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
                    
                    HStack(spacing: 14) {
                        
                        Button("1") {
                            Button1 = true
                        }
                        
                        Button("2") {
                            Button2 = true
                        }
                        
                        Button("3") {
                            Button3 = true
                        }
                        
                        Button("4") {
                            Button4 = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.bordered)
                    .padding()
                    
                    HStack(spacing: 14) {
                        Link("Apple", destination: URL(string: "https://apple.com")!)
                        Link("Apple Developer", destination: URL(string: "https://developer.apple.com")!)
                        Link("Google", destination: URL(string: "https://google.com")!)
                        Link("Microsoft", destination: URL(string: "https://microsoft.com")!)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    VStack(spacing: 14) {
                        
                        if Button1 == true {
                            Text("writtenText")
                                .font(.system(size: 14))
                        }
                        
                        if Button2 == true {
                            Text("interfaceText")
                                .font(.system(size: 14))
                        }
                        
                        if Button3 == true {
                            Text("byClickingText")
                                .font(.system(size: 14))
                        }
                        
                        if Button4 == true {
                            Text("buildNumberSecret")
                                .font(.system(size: 14))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                }
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .overlay(
            VersionView()
                .padding(.bottom, 18),
            alignment: .bottom
        )
        .frame(minWidth: 550, minHeight: 800)
    }
}
