import Foundation
import SwiftUI

struct VersionView: View {
    var body: some View {
        Text("Version: 0.0.3 (0a7fc)")
            .font(.system(size: 12))
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
}
