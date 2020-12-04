import UIKit

public extension UIViewController {
    func showConfirmationAlert(title: String?, message: String?, buttonTitle: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showDialog(
        title: String? = nil,
        message: String? = nil,
        positiveButtonTitle: String,
        negativeButtonTitle: String? = nil,
        style: UIAlertController.Style,
        positiveActionHandler: ((UIAlertAction) -> Void)? = nil,
        negativeActionHandler: ((UIAlertAction) -> Void)? = nil
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        
        let okAction = UIAlertAction(
            title: positiveButtonTitle,
            style: .default,
            handler: positiveActionHandler
        )
        
        alertController.addAction(okAction)
        
        if let negativeButtonTitle = negativeButtonTitle {
            let cancelAction = UIAlertAction(
                title: negativeButtonTitle,
                style: .cancel,
                handler: negativeActionHandler
            )
            
            alertController.addAction(cancelAction)
        }
        
        if style == .actionSheet {
            alertController.modalPresentationStyle = .formSheet
            
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.sourceView = view
                popoverPresentationController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.maxY, width: 0, height: 0)
                popoverPresentationController.permittedArrowDirections = []
            }
        }

        present(alertController, animated: true, completion: nil)
    }
    
    func showConfirmationActionSheet(
        title: String?,
        message: String?,
        positiveButtonTitle: String,
        cancelButtonTitle: String,
        positiveActionHandler: ((UIAlertAction) -> Void)?
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet
        )

        let cancelAction = UIAlertAction(
            title: cancelButtonTitle,
            style: .cancel,
            handler: nil
        )
        
        let okAction = UIAlertAction(title: positiveButtonTitle, style: .default, handler: positiveActionHandler)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
    func showChoiceConfirmationActionSheet(
        title: String?,
        message: String? = nil,
        primaryButtonTitle: String,
        secondaryButtonTitle: String,
        cancelButtonTitle: String,
        primaryActionHandler: ((UIAlertAction) -> Void)?,
        secondaryActionHandler: ((UIAlertAction) -> Void)?
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet
        )

        let cancelAction = UIAlertAction(
            title: cancelButtonTitle,
            style: .cancel,
            handler: nil
        )
        
        let primaryAction = UIAlertAction(title: primaryButtonTitle, style: .default, handler: primaryActionHandler)
        let secondaryAction = UIAlertAction(title: secondaryButtonTitle, style: .destructive, handler: secondaryActionHandler)

        alertController.addAction(primaryAction)
        alertController.addAction(secondaryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
