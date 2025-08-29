import Foundation
import SwiftUI

struct InfoView: View {
    
    @Binding var showReleaseNotes: Bool

    var body: some View {
        
        Group {
            
            if !showReleaseNotes {
                
                HStack {
                    
                    HStack {
                        
                        Image(systemName: "questionmark.bubble.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.blue)

                        Button("newText") {
                            
                            withAnimation {
                                
                                showReleaseNotes = true
                                
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        
                    }
                    .padding()

                    HStack {
                        
                        Text("versionText")
                            .font(.system(size: 12))
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}
