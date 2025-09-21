import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "info.square.fill")
                    .font(.custom("SF Pro", size: 24))
                    .padding(.bottom, 1)
                    .padding(.trailing, 3)
                
                Text("aboutCase")
                    .font(.custom("SF Pro", size: 24))
                    .bold()
                
            }
            .multilineTextAlignment(.center)
            .padding(.top, 26)
            .padding(.bottom, 17)
            
            Divider()
            
        }
        
        VStack {
            
            Spacer()
            
            VStack {
                
                HStack {
                    
                    Text("versionTitle")
                        .font(.custom("SF Pro", size: 14))
                        .bold()
                    
                    Text("version")
                        .font(.custom("SF Pro", size: 14))
                    
                }
                
                HStack {
                    
                    Text("releaseDateTitle")
                        .font(.custom("SF Pro", size: 14))
                        .bold()
                    
                    Text("releaseDate")
                        .font(.custom("SF Pro", size: 14))
                    
                }
                .padding(.top, 1)
                
            }
            .padding(.top)
            
            VStack {
                
                Text("appDescriptionTitle")
                    .font(.custom("SF Pro", size: 16))
                    .bold()
                
                Text("appDescription")
                    .font(.custom("SF Pro", size: 14))
                    .padding(.top, 1)
                
            }
            .padding(.top)
            
            Spacer()
            
        }
        .frame(minWidth: 700)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)
        
    }
    
}
