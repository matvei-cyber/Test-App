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
                            .font(.custom("SF Pro", size: 18))
                            .foregroundColor(.blue)
                            .padding(.trailing, 2)
                        
                        Button("newText") {
                            
                            withAnimation {
                                
                                showReleaseNotes = true
                                
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        .cornerRadius(8)
                        
                    }
                    
                    HStack {
                        
                        Text("versionText")
                            .font(.custom("SF Pro", size: 14))
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding(.leading, 10)
                    
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .padding()
                
            }
            
        }
        
    }
    
}
