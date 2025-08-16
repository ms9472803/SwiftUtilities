extension UIViewController {
    /// Remove a viewcontroller from navigationController
    /// - Parameter toRemoveVc: ViewController.self
    func removeVcFromNavStack(_ toRemoveVc: AnyClass) {
        if let nav = navigationController {
            let vcArray = nav.viewControllers
            var newVCs = [UIViewController]()

            for vc in vcArray {
                if !vc.isKind(of: toRemoveVc) {
                    newVCs.append(vc)
                }
            }

            nav.setViewControllers(newVCs, animated: false)
        }
    }

    func removeVcsFromNavStack(_ toRemoveVcs: [AnyClass]) {
        if let nav = navigationController {
            let vcArray = nav.viewControllers
            var newVCs = [UIViewController]()

            for vc in vcArray {
                if !toRemoveVcs.contains(where: { vc.isKind(of: $0) }) {
                    newVCs.append(vc)
                }
            }

            nav.setViewControllers(newVCs, animated: false)
        }
    }
}
