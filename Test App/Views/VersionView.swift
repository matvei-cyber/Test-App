import Foundation
import SwiftUI

struct VersionView: View {
    var body: some View {
        Text("Version: 0.0.2 (fc730)")
            .font(.system(size: 12))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
}
