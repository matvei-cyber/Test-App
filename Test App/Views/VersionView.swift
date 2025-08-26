import Foundation
import SwiftUI

struct VersionView: View {
    var body: some View {
        Text("versionText")
            .font(.system(size: 12))
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
}
