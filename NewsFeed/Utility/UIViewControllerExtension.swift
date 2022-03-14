
import Foundation
import SafariServices
import MessageUI
//import SideMenu

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message : String?) {
        Utility.showAlertWithOkButton(controller: self, title: title, message: message)
    }
    
    func removeNavigationBarTitle () {
        self.navigationItem.title = ""
    }
    
    func setNavigationBarTitle(title : String) {
        self.navigationItem.title = title
    }
    
    func showNavigationBar () {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavigationBar () {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func showAlert(title: String, message: String?, listener: UIAlertAction, listener2 : UIAlertAction? = nil) {
        Utility.showAlterWithListenerBack(controller: self, title: title, message: message, listener: listener, listener2: listener2)
    }
    
    static func instantiate() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: self), bundle: nil)
        }

        return instanceFromNib()
    }
}
