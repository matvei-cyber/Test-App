import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "gearshape.fill")
                .font(.custom("SF Pro", size: 34))
                .padding()
            
            Text("settingsSoon")
                .font(.custom("SF Pro", size: 16))
                .padding(.top)
            
        }
        .frame(minWidth: 300)
        
    }
    
}
