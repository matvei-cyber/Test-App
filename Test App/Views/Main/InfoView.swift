import SwiftUI

struct InfoView: View {

    var body: some View {
        
        HStack {
            
            Image(systemName: "arrow.down.doc.fill")
                .font(.custom("SF Pro", size: 20))
            
            Text("versionText")
                .font(.custom("SF Pro", size: 14))
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .padding()
        
    }
    
}
