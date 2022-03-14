
import Foundation
import  UIKit

class Utility: NSObject {
   
    class func showAlertWithOkButton(controller: UIViewController, title: String, message: String?, status:Int = 0) {
        
        let OKAction = UIAlertAction(title: Alerts.buttonLabels.ok.rawValue, style: .default) { (action:UIAlertAction!) in
            
        }
        
        Utility.showAlterWithListenerBack(controller: controller, title: title, message: message, listener: OKAction)
    }
    
    /**
     This method is to show the alert dialog with ok button and return click event back to the caller.
    */
    class func showAlterWithListenerBack(controller: UIViewController, title: String, message: String?, listener: UIAlertAction, listener2 : UIAlertAction? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let button1 = listener
        
        let button2 = listener2
        
        alertController.addAction(button1)
        
        if let nButton2 = button2 {
            alertController.addAction(nButton2)
        }
        
        // Present Dialog message
        controller.present(alertController, animated: true, completion:nil)
    }
}

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    
    #if DEBUG || STAGE || CR_STAGE || CR_UAT || CR
        Swift.print(items[0], separator:separator, terminator: terminator)
    #endif
}

