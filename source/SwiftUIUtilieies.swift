import Foundation
import UIKit

struct SwiftUIUtilieies {
    static func setSwiftUIVcAsChild(_ vc: UIViewController, _ swiftVc: UIViewController) {
        guard let swiftuiView = swiftVc.view else { return }
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false

        vc.addChild(swiftVc)
        vc.view.addSubview(swiftuiView)

        NSLayoutConstraint.activate([
            swiftuiView.widthAnchor.constraint(equalTo: vc.view.widthAnchor),
            swiftuiView.heightAnchor.constraint(equalTo: vc.view.heightAnchor)
        ])

        swiftVc.didMove(toParent: vc)
    }
}
