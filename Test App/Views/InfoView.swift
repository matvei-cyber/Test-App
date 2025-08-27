import Foundation
import SwiftUI

struct InfoView: View {
    // callback, который вызывается при нажатии "что нового"
    var onShowReleaseNotes: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "questionmark.bubble.fill")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
                
                Button("newText") {
                    onShowReleaseNotes()
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
    }
}
