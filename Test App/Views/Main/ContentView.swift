import SwiftUI

enum SidebarItems: Hashable {
    
    case home
    case new
    case plans
    case settings
    
}

struct ContentView: View {
    
    @State private var selection: SidebarItems? = .home
    
    var body: some View {
        
        NavigationSplitView {
            
            VStack {
                
                VStack {
                    
                    Text("navMenuText")
                        .font(.custom("SF Pro", size: 16))
                        .bold()
                        .padding(.horizontal)
                    
                    Divider()
                    
                    List(selection: $selection) {
                        
                        Label("homeCase", systemImage: "house.fill")
                            .tag(SidebarItems.home)
                        
                        Label("newCase", systemImage: "newspaper.fill")
                            .tag(SidebarItems.new)
                        
                        Label("plansCase", systemImage: "clock.fill")
                            .tag(SidebarItems.plans)
                        
                        Label("settingsCase", systemImage: "gearshape.fill")
                            .tag(SidebarItems.settings)
                        
                    }
                    .listStyle(.sidebar)
                    .frame(minWidth: 250)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                
                Spacer()
                
            }
            .background(.ultraThinMaterial)
            
        } detail: {
            
            switch selection {
                
            case .home:
                
                HomeView()
                
            case .new:
                
                ReleaseNotesView()
                
            case .settings:
                
                SettingsView()
                
            case .plans:
                
                AppPlansView()
                
            default:
                
                Text("selectMenuPage")
                
            }
            
        }
        .frame(minWidth: 1150, minHeight: 700)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}
