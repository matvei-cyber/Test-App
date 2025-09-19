import SwiftUI

struct VersionView: View {

    var body: some View {
        
        HStack {
            
            Image(systemName: "arrow.down.doc.fill")
                .font(.custom("SF Pro", size: 20))
            
            HStack {
                
                Text("versionTitle")
                    .font(.custom("SF Pro", size: 14))
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("version")
                    .font(.custom("SF Pro", size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        
    }
    
}
