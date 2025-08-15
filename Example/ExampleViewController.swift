import SwiftUI
import UIKit

class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swiftVc = UIHostingController(rootView: ExampleView())
        SwiftUIUtilieies.setSwiftUIVcAsChild(self, swiftVc)
    }
}

struct ExampleView: View {
    var body: some View {
        Text("Example")
    }
}
