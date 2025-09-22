//RELEASE

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("sidebarBackground") var sidebarBackground: String = "ultraThinMaterial"
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "gearshape.fill")
                    .font(.custom("SF Pro", size: 25))
                    .padding(.trailing, 3)
                
                Text("settingsCase")
                    .font(.custom("SF Pro", size: 25))
                    .bold()
                
            }
            .multilineTextAlignment(.center)
            .padding(.top, 26)
            .padding(.bottom, 17)
            
            Divider()
            
        }
        .frame(maxWidth: .infinity)
        
        VStack {
            
            Spacer()
            
            Text("sidebarSettingsHeading")
                .font(.custom("SF Pro", size: 24))
                .bold()
            
            HStack {
                
                Text("sidebarMaterialSetting")
                    .font(.custom("SF Pro", size: 14))
                    .bold()
                
                Picker(selection: $sidebarBackground, label: EmptyView()) {
                    
                    Text("sidebarInUltraThinMaterial").tag("ultraThinMaterial")
                    Text("sidebarInGray").tag("Gray")
                    Text("sidebarInBlack").tag("Black")
                    Text("sidebarInWhite").tag("White")
                    Text("sidebarInBackground").tag("Background")
                    Text("sidebarInMint").tag("Mint")
                    Text("sidebarInCyan").tag("Cyan")
                    Text("sidebarInBlue").tag("Blue")
                    
                }
                .pickerStyle(.menu)
                
            }
            .padding(.top, 2)
            
            Spacer()
            
        }
        .frame(minWidth: 480)
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 150)
        
    }
    
}
