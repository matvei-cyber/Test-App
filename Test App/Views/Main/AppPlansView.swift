import SwiftUI

private struct Plans: Identifiable {
    
    let id = UUID()
    let version: String
    let items: [String]
    
}

struct AppPlansView: View {
    
    private let rawPlansRu: [(version: String, items: [String])] = [
        
        ("1.0 Бета 3", [
            
            "Перенести меню с информацие о приложении из кнопки 5 в отдельную страницу приложения."
            
        ])
    
    ]
    private let rawPlansEn: [(version: String, items: [String])] = [
    
        ("1.0 Beta 3", [
            
            "Move the menu with information about the app from button 5 to a separate app page."
            
        ])
    
    ]
    
    private var notesRu: [Plans] {
        
        rawPlansRu.map { Plans(version: $0.version, items: $0.items) }
        
    }
    
    private var notesEn: [Plans] {
        
        rawPlansEn.map { Plans(version: $0.version, items: $0.items) }
        
    }
    
    private var useRussian: Bool {
        
        if let lang = Locale.preferredLanguages.first {
            
            return lang.starts(with: "ru")
            
        }
        
        return Locale.current.language.languageCode?.identifier == "ru"
        
    }
    
    private var plans: [Plans] { useRussian ? notesRu : notesEn }
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                
                Image(systemName: "clock.fill")
                    .font(.custom("SF Pro", size: 25))
                    .padding(.trailing, 2)
                
                Text("plansCase")
                    .font(.custom("SF Pro", size: 25))
                    .bold()
                
            }
            .multilineTextAlignment(.center)
            .padding(.top, 25)
            .padding(.bottom, 12)
            
            Divider()
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    ForEach(plans) { plan in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack {
                                
                                Text(plan.version)
                                    .font(.custom("SF Pro", size: 18))
                                    .bold()
                                
                            }
                            
                            ForEach(plan.items, id: \.self) { item in
                                
                                HStack(alignment: .top, spacing: 8) {
                                    
                                    Text("•")
                                        .font(.custom("SF Pro", size: 14))
                                        .bold()
                                    
                                    Text(item)
                                        .font(.custom("SF Pro", size: 14))
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                }
                                .padding(.top, 5)
                                
                            }
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .frame(minWidth: 700)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}
