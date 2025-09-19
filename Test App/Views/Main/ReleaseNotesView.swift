import SwiftUI

private struct ReleaseNote: Identifiable {
    
    let id = UUID()
    let version: String
    let items: [String]
    let urlString: String?
    
}

struct ReleaseNotesView: View {
    
    private let rawNotesRu: [(version: String, items: [String])] = [
        
        ("1.0 Бета 3 (5b6c1)", [
            
            "Добавлен символ в строку с заголовком навигационного меню.",
            "Изменена подпись приложения. Но запускается все равно только с включенным SIP, потому что у меня нет акаунта разработчика App Store :(",
            "Теперь на странице \"Настройки\" можно выбрать цвет оформления навигационного меню из 7-ми вариантов.",
            "Добавлена скругленная подложка под кнопки 1, 2, 3, 4.",
            "Добавлена обводка кнопкам 1, 2, 3, 4. Раньше ее не было из-за бага со скруглением углов.",
            "Кнопка 5 удалена. Ее контент перенесен на отдельную страницу \"О приложении\".",
            "Теперь заголовки версии, даты выпуска и описания приложения выделены жирным.",
            "Раньше особая анимация появления всплывающих окон была привязана только к кнопке 5. Теперь ко всем.",
            "Немного изменены отступы между корневой стопкой элементов и краем навигационного меню. Преимущественно на странице \"Что нового?\".",
            "Исправлена ошибка: я забыл вписать ссылку на версию 1.0 Бета 2.",
            "Много мелких изменений в коде."
            
        ]),
        
        ("1.0 Бета 2 (a49b7)", [
            
            "Теперь переключение между главной страницей и экраном \"Что нового?\" реализовано через навигационное меню слева.",
            "Исправлена проблема: не на Retina-мониторах и мониторах с разрешением 1920x1080p и меньше, приложение было неприемлемо большим. Теперь окно стало меньше и отображается нормально.",
            "Исправлена проблема со ссылкой на тег GitHub версии 1.0 Бета 1 и ее номером сборки.",
            "Немного увеличен размер заголовка версии и текста примечаний к выпуску на экране \"Что нового?\".",
            "Добавлена вкладка настроек. Пока что там ничего нет, но скоро появится!",
            "Много мелких изменений в коде. Также был заменен символ для иконки экрана \"Что нового?\"."
            
        ]),
        
        ("1.0 Бета 1 (e5fb8)", [
            
            "Релиз уже близко! Новая система весрий: Бета, кандидат в релиз и т. д.",
            "Теперь при нажатии на кнопки: 1, 2, 3, 4, 5, текст появляется в полупрозрачном всплывающем окне.",
            "Добавлена кнопка 5, отображающая информацию о приложении во всплывающем окне.",
            "Изменен радиус скругления всех кнопок в приложении. Они стали более округлыми.",
            "Добавлено размытие основного контента в анимации перехода на экран \"Что нового?\".",
            "Ссылка на репозиторий приложения была перенесена в строку с остальными ссылками.",
            "Шрифты всего текста в приложении явно заданы как \"SF Pro\". Также, немного изменены размеры некоторых тесктов.",
            "Отступы в приложении доведены до идеала.",
            "Мелкие исправления в коде."
            
        ]),
        
        ("0.5 (afa92)", [
            
            "Изменена анимация перехода на экран \"Что нового?\". Она оптимизирована и меньше нагружает графику macOS.",
            "На экран \"Что нового?\" добавлена кнопка \"Открыть на GitHub\", ведущая на соответствующий версии тег GitHub. (локализована на Русский и Английский языки).",
            "Изменены отступы между ссылками на репозиторий GitHub и релизы приложения на главном экране.",
            "Исправлены мелкие ошибки и улучшена читаемость кода."
            
        ]),
        
        ("0.4 (5a717)", [
            
            "Исправлено много мелких недочетов.",
            "Экран \"Что нового?\" доработан и теперь отображает примечания к выпуску всех версий приложения. Они локализованы на Русский и Английский языки.",
            "Исправлено кривое выравнивание надписи \"Что нового?\".",
            "Кнопка \"Назад\" локализована на Русский и Английский языки.",
            "Теперь кнопка \"Что нового?\", надпись с версией и сборкой и иконка вопроса красиво \"уезжает\" вниз с красивой анимацией при переходе на экран \"Что нового?\"."
            
        ]),
        
        ("0.3 (358c1)", [
            
            "Добавлена ​​кнопка \"Что нового?\", которая отображает примечания к выпуску с приятной анимацией. (В разработке)",
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
        
        ("1.0 Beta 3 (5b6c1)", [
            
            "Added a symbol to the navigation menu title line.",
            "The application signature has been changed. But it still only runs with SIP enabled because I don't have an App Store developer account :(",
            "Now on the \"Settings\" page you can choose the color of the Navigation Menu from 7 options.",
            "Added rounded padding for buttons 1, 2, 3, 4.",
            "Added outline to 1, 2, 3, 4 buttons. Previously it was missing due to a bug with corner rounding.",
            "Button 5 has been removed. Its content has been moved to a separate \"About Test App\" page.",
            "The version, release date and description headings of the application are now highlighted in bold.",
            "Previously, the special animation for pop-up windows was tied only to button 5. Now to all.",
            "The indents between the root stack of elements and the edge of the navigation menu have been slightly changed. Mainly on the \"What's New?\".",
            "Fixed a mistake: I forgot to include the link to version 1.0 Beta 2.",
            "Minor changes in the code."
            
        ]),
        
        ("1.0 Beta 2 (a49b7)", [
            
            "Switching between the main page and the \"What's New?\" screen is now implemented via the navigation menu on the left.",
            "Fixed issue: On non-Retina monitors and monitors with a resolution of 1920x1080p and lower, the app window was unacceptably large. The window is now smaller and displays normally.",
            "Fixed an issue with the GitHub tag reference for version 1.0 Beta 1 and its build number.",
            "Slightly increased the size of the version title and release notes text on the \"What's New\" screen.",
            "Added settings tab. There is nothing there yet, but it will be soon!",
            "Many minor changes in the code. Also the symbol for \"What's New?\" screen icon was replaced."
            
        ]),
        
        ("1.0 Beta 1 (e5fb8)", [
            
            "The release is coming! New version system: Beta, release candidate, etc.",
            "Now when you click on buttons: 1, 2, 3, 4, 5, the text appears in a translucent pop-up window.",
            "Added a 5 button that displays information about the app in pop-up window.",
            "The radius of rounding of all buttons in the app has been changed. They have become more rounded.",
            "Added blurring of the main content in the transition animation to the \"What's New?\" screen.",
            "The link to the app repository has been moved to the line with the other links.",
            "The fonts of all text in the app are explicitly set to \"SF Pro\". Also, the sizes of some texts have been slightly changed.",
            "The indents in the app have been brought to perfection.",
            "Minor fixes in the code."
            
        ]),
        
        ("0.5 (afa92)", [
            
            "The animation for the transition to the \"What's New?\" screen has been changed. It is optimized and puts less load on the macOS graphics.",
            "Added an \"Open on GitHub\" button to the \"What's New?\" screen, which links to the corresponding GitHub tag. (Localized into Russian and English).",
            "Changed the spacing between links to the GitHub repository and app releases on the main screen.",
            "Minor bugs have been fixed and code readability has been improved."
            
        ]),
        
        ("0.4 (5a717)", [
            
            "Many minor bugs have been fixed.",
            "\"What's New?\" screen has been improved and now displays release notes for all versions of the app. They are localized into Russian and English.",
            "Fixed the crooked alignment of the \"What's New?\" inscription.",
            "Back button is localized into Russian and English.",
            "Now the \"What's New?\" button, the text with the version and build, and the question mark icon moves down with nice animation, when you go to the \"What's New?\" screen."
            
        ]),
        
        ("0.3 (358c1)", [
            
            "Added a \"What's New?\" button that shows the Release Notes with a nice animation. (In development).",
            "A lot of work has been done on the icons. They have become more attractive.",
            "Added links to the app's GitHub repository and releases section.",
            "Added link to SwiftUI website.",
            "Minor fixes, work on errors and code readability."
            
        ]),
        
        ("0.2.1 (34bdf)", [
            
            "Drawn the app icons instead of using the original Swift ones.",
            "Localized the inscription with the version and build number of the app into Russian and English."
            
        ]),
        
        ("0.2 (b3165)", [
            
            "Added app icon.",
            "Added button 4, which displays text.",
            "The globe icon has been changed to greater than and less than signs.",
            "Refreshed the code and made it more readable.",
            "There is now a new app icon above the greater than and less than signs.",
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
        
        "1.0 Бета 3 (5b6c1)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta3",
        "1.0 Beta 3 (5b6c1)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta3",
        "1.0 Бета 2 (a49b7)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta2",
        "1.0 Beta 2 (a49b7)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta2",
        "1.0 Бета 1 (e5fb8)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta1",
        "1.0 Beta 1 (e5fb8)": "https://github.com/matvei-cyber/Test-App/releases/tag/1.0Beta1",
        "0.6 ()": "https://github.com/matvei-cyber/Test-App/releases/tag/0.6",
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
        
        VStack {
            
            HStack {
                
                Image(systemName: "newspaper.fill")
                    .font(.custom("SF Pro", size: 25))
                    .padding(.trailing, 2)
                
                Text("newCase")
                    .font(.custom("SF Pro", size: 25))
                    .bold()
                
            }
            .multilineTextAlignment(.center)
            .padding(.top, 26)
            .padding(.bottom, 17)
            
            Divider()
            
        }
        
        VStack(spacing: 12) {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    ForEach(notes) { note in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack {
                                
                                Text(note.version)
                                    .font(.custom("SF Pro", size: 18))
                                    .bold()
                                
                                if let urlStr = note.urlString, let url = URL(string: urlStr) {
                                    
                                    Link(destination: url) {
                                        
                                        Text("openOnGitHubLink")
                                            .font(.custom("SF Pro", size: 14))
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "arrow.up.right.square")
                                            .font(.custom("SF Pro", size: 16))
                                            .foregroundColor(.blue)
                                        
                                    }
                                    .padding(.leading, 5)
                                    
                                }
                                
                            }
                            
                            ForEach(note.items, id: \.self) { item in
                                
                                HStack(alignment: .top, spacing: 8) {
                                    
                                    Text("•")
                                        .font(.custom("SF Pro", size: 14))
                                        .bold()
                                    
                                    Text(item)
                                        .font(.custom("SF Pro", size: 14))
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                }
                                .padding(.top, 4)
                                
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
        .padding(.leading)
        
    }
    
}
