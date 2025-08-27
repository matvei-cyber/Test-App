import Foundation
import SwiftUI

struct ReleaseNotesView: View {
    var onClose: () -> Void
    
    private let notes: [(version: String, items: [String])] = [
        ("versionHeading", [
            "releaseNotes",
        ]),
        ("versionHeading2", [
            "releaseNotes",
        ])
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button(action: { onClose() }) {
                    Label("Back", systemImage: "chevron.left")
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                Text("Release Notes")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Link(destination: URL(string: "https://github.com/matvei-cyber/Test-App/releases")!) {
                    Label("Open on GitHub", systemImage: "link")
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(notes, id: \.version) { block in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(block.version)
                                .font(.headline)
                            ForEach(block.items, id: \.self) { item in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("•")
                                    Text(item)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}
