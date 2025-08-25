import SwiftUI

struct ContentView: View {
    @State private var Button1: Bool = false
    @State private var Button2: Bool = false
    @State private var Button3: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(spacing: 14) {
                    Image(systemName: "globe")
                        .font(.system(size: 45))
                        .foregroundColor(.blue)
                        .padding()
                    Text("helloText")
                        .font(.system(size: 30))
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
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    HStack(spacing: 14) {
                        Link("Apple", destination: URL(string: "https://apple.com")!)
                        Link("Google", destination: URL(string: "https://google.com")!)
                        Link("Microsoft", destination: URL(string: "https://microsoft.com")!)
                        Link("Samsung", destination: URL(string: "https://samsung.com")!)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
                    .padding()
                    VStack(spacing: 14) {
                        if Button1 == true {
                            Text("writtenText")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                        }
                        if Button2 == true {
                            Text("interfaceText")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                        }
                        if Button3 == true {
                            Text("byClickingText")
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                        }
                    }
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
        .frame(minWidth: 500, minHeight: 750)
    }
}
