import Foundation
import SwiftUI

private struct ReleaseNote: Identifiable {
    
    let id = UUID()
    let version: String
    let items: [String]
    let urlString: String?
    
}

struct ReleaseNotesView: View {
    
    var onClose: () -> Void
    
    private let rawNotesRu: [(version: String, items: [String])] = [
        
        ("0.5 (afa92)", [
            
            "Изменена анимация перехода на экран \"Что нового\". Она оптимизирована и меньше нагружает графику macOS.",
            "На экран \"Что нового\" добавлена кнопка \"Открыть на GitHub\", ведущая на соостветствующий версии тег GitHub. (локализована на Русский и Английский языки).",
            "Изменены отступы между ссылками на репозиторий GitHub и релизы приложения на главном экране.",
            "Исправлены мелкие ошибки и улучшена читаемость кода."
            
        ]),
        
        ("0.4 (5a717)", [
            
            "Исправлено много мелких недочетов.",
            "Экран \"Что нового\" доработан и теперь отображает примечания к выпуску всех версий приложения. Они локализованы на Русский и Английский языки.",
            "Исправлено кривое выравнивание надписи \"Что нового\".",
            "Кнопка \"Назад\" локализована на Русский и Английский языки.",
            "Теперь кнопка \"Что нового\", надпись с версией и сборкой и иконка вопроса красиво \"уезжает\" вниз с красивой анимацией при переходе на экран \"Что нового\"."
            
        ]),
        
        ("0.3 (358c1)", [
            
            "Добавлена ​​кнопка \"Что нового\", которая отображает примечания к выпуску с приятной анимацией. (В разработке)",
            "Проделана огромная работа над иконками. Они стали симпатичнее.",
            "Добавлены ссылки на репозиторий GitHub и раздел релизов приложения.",
            "Добавлена ​​ссылка на сайт SwiftUI.",
            "Мелкие исправления, работа над ошибками и читаемостью кода."
            
        ]),
        
        ("0.2.1 (34bdf)", [
            
            "Нарисовал иконки приложения вместо использования оригинальных от Swift.",
            "Локализована надпись с версией и номером сборки приложения на Русский и Английский языки."
            
        ]),
        
        ("0.2 (b3165)", [
            
            "Добавлена иконка приложения.",
            "Добавлена ​​кнопка 4, отображающая текст.",
            "Значок глобуса был изменён на знаки «больше» и «меньше».",
            "Код обновлён и стал более читабельным.",
            "Над знаками \"больше\" и \"меньше\" теперь отображается новый значок приложения.",
            "Текст \"Hello, SwiftUI!\" (в английской локализации), кнопки 1, 2, 3, 4, ссылки, текст, отображаемый кнопками и другими блоками, теперь имеет бесконечную максимальную ширину для принудительного центрирования."
            
        ]),
        
        ("0.1 (6a135)", [
            
            "Добавлена ​​локализация на английский язык (основным языком стал русский).",
            "Убраны тени под кнопками 1, 2, 3."
            
        ]),
        
        ("0.0.3 (0a7fc)", [
            
            "Исправлена ​​проблема с принудительной чёрной заливкой текста."
            
        ])
        
    ]
    
    private let rawNotesEn: [(version: String, items: [String])] = [
        
        ("0.5 (afa92)", [
            
            "The animation for the transition to the \"What's new\" screen has been changed. It is optimized and puts less load on the macOS graphics.",
            "Added an \"Open on GitHub\" button to the \"What's new\" screen, which links to the corresponding GitHub tag. (Localized into Russian and English).",
            "Changed the spacing between links to the GitHub repository and app releases on the main screen.",
            "Minor bugs have been fixed and code readability has been improved."
            
        ]),
        
        ("0.4 (5a717)", [
            
            "Many minor bugs have been fixed.",
            "\"What's new\" screen has been improved and now displays release notes for all versions of the app. They are localized into Russian and English.",
            "Fixed the crooked alignment of the \"What's new\" inscription.",
            "Back button is localized into Russian and English.",
            "Now the \"What's new\" button, the text with the version and build, and the question mark icon moves down with nice animation, when you go to the \"What's new\" screen."
            
        ]),
        
        ("0.3 (358c1)", [
            
            "Added a \"What's new\" button that shows the Release Notes with a nice animation. (In development).",
            "A lot of work has been done on the icons. They have become more attractive.",
            "Added links to the application's GitHub repository and releases section.",
            "Added link to SwiftUI website.",
            "Minor fixes, work on errors and code readability."
            
        ]),
        
        ("0.2.1 (34bdf)", [
            
            "Drawn the app icons instead of using the original Swift ones.",
            "Localized the inscription with the version and build number of the application into Russian and English."
            
        ]),
        
        ("0.2 (b3165)", [
            
            "Added app icon.",
            "Added button 4, which displays text.",
            "The globe icon has been changed to greater than and less than signs.",
            "Refreshed the code and made it more readable.",
            "There is now a new application icon above the greater than and less than signs.",
            "The text \"Hello, SwiftUI!\" (in English localization), buttons 1, 2, 3, 4, links, text, displayed by buttons and other blocks got an infinite max-width to force centering."
            
        ]),
        
        ("0.1 (6a135)", [
            
            "Added localization into English (the main language became Russian).",
            "Removed shadows under buttons 1, 2, 3."
            
        ]),
        
        ("0.0.3 (0a7fc)", [
            
            "Fixed an issue with forced black text."
            
        ])
        
    ]
    
    private let releaseURLs: [String: String] = [
        
        "0.5 (afa92)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.5",
        "0.4 (5a717)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.4",
        "0.3 (358c1)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.3",
        "0.2.1 (34bdf)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.2.1",
        "0.2 (b3165)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.2",
        "0.1 (6a135)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.1",
        "0.0.3 (0a7fc)": "https://github.com/matvei-cyber/Test-App/releases/tag/0.0.3"
        
    ]
    
    private var notesRu: [ReleaseNote] {
        
        rawNotesRu.map { ReleaseNote(version: $0.version, items: $0.items, urlString: releaseURLs[$0.version]) }
        
    }
    private var notesEn: [ReleaseNote] {
        
        rawNotesEn.map { ReleaseNote(version: $0.version, items: $0.items, urlString: releaseURLs[$0.version]) }
        
    }
    
    private var useRussian: Bool {
        
        if let lang = Locale.preferredLanguages.first {
            
            return lang.starts(with: "ru")
            
        }
        
        return Locale.current.language.languageCode?.identifier == "ru"
        
    }
    
    private var notes: [ReleaseNote] { useRussian ? notesRu : notesEn }
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                
                Button(action: { withAnimation(.easeOut(duration: 0.16)) { onClose() } }) {
                    
                    Label("backText", systemImage: "chevron.left")
                    
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                Text("newText")
                    .font(.title2)
                    .bold()
                    .padding(.trailing, 65)
                
                Spacer()
                
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .padding(.bottom, 15)
            
            Divider()
            
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    
                    ForEach(notes) { note in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack {
                                
                                Text(note.version)
                                
                                    .font(.title2)
                                    .bold()
                                
                                if let urlStr = note.urlString, let url = URL(string: urlStr) {
                                    
                                    Link(destination: url) {
                                        
                                        Text("openOnGitHubText")
                                            .font(.system(size: 14))
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "arrow.up.right.square")
                                            .font(.system(size: 16))
                                            .foregroundColor(.blue)
                                        
                                    }
                                    .padding(.leading, 5)
                                    
                                }
                                
                            }
                            
                            ForEach(note.items, id: \.self) { item in
                                
                                HStack(alignment: .top, spacing: 8) {
                                    
                                    Text("•")
                                    
                                    Text(item)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                }
                                
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
}
