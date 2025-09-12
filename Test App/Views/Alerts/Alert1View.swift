import SwiftUI

struct Alert1View: View {
    
    @Binding var isShown: Bool
    
    var body: some View {
        
        ZStack {
            
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
            
            VStack(spacing: 16) {
                
                Text("writtenText")
                    .font(.custom("SF Pro", size: 14))
                
                Button("closeButton") {
                    
                    withAnimation(.easeOut(duration: 0.15)) {
                        
                        isShown = false
                        
                    }
                    
                }
                .font(.custom("SF Pro", size: 14))
                .cornerRadius(7)
                .padding(.top)
                
            }
            .padding(50)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 4, y: 8)
            
        }
        .padding(.top, 400)
        
    }
    
}
