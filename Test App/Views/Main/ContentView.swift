import SwiftUI

enum SidebarItems: Hashable {
    
    case home, new, settings, about
    
}

struct ContentView: View {
    
    @State private var selection: SidebarItems? = .home
    @AppStorage("sidebarBackground") var sidebarBackground: String = "ultraThinMaterial"
    
    var body: some View {
        
        NavigationSplitView {
            
            if sidebarBackground == "ultraThinMaterial" {
                
                sidebarContent
                    .background(Material.ultraThinMaterial)
                
            } else if sidebarBackground == "Gray" {
                
                sidebarContent
                    .background(Color.gray)
                
            } else if sidebarBackground == "Black" {
                
                sidebarContent
                    .background(Color.black)
                    .foregroundColor(Color.white)
                
            } else if sidebarBackground == "White" {
                
                sidebarContent
                    .background(Color.white)
                    .foregroundColor(Color.black)
                
            } else if sidebarBackground == "Background" {
                
                sidebarContent
                    .background(.background)
                
            } else if sidebarBackground == "Mint" {
                
                sidebarContent
                    .background(Color.mint)
                
            } else if sidebarBackground == "Blue" {
                
                sidebarContent
                    .background(Color.cyan)
                
            }
            
        } detail: {
            
            switch selection {
                
            case .home:
                
                HomeView()
                
            case .new:
                
                ReleaseNotesView()
                
            case .settings:
                
                SettingsView()
                
            case .about:
                
                AboutView()
                
            default:
                
                Text("selectAppPage")
                    .font(.custom("SF Pro", size: 24))
                    .bold()
                
            }
            
        }
        .frame(minWidth: 1150, minHeight: 700)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    private var sidebarContent: some View {
        
        VStack {
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "list.bullet.rectangle.fill")
                        .font(.custom("SF Pro", size: 18))
                    
                    Text("appPages")
                        .font(.custom("SF Pro", size: 16))
                        .bold()
                    
                }
                .padding(.horizontal)
                
                Divider()
                
                List(selection: $selection) {
                    
                    Label("homeCase", systemImage: "house.fill")
                        .tag(SidebarItems.home)
                    
                    Label("newCase", systemImage: "newspaper.fill")
                        .tag(SidebarItems.new)
                    
                    Label("settingsCase", systemImage: "gearshape.fill")
                        .tag(SidebarItems.settings)
                    
                    Label("aboutCase", systemImage: "info.square.fill")
                        .tag(SidebarItems.about)
                    
                }
                .listStyle(.sidebar)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            
            Spacer()
            
        }
        .frame(minWidth: 270)
        
    }
    
}
