//
//  UIAlertController+.swift
//  RespectU
//
//  Created by Presto on 2018. 6. 28..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

extension UIAlertController {
    //alert
    static func alert(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return alert
    }
    
    //action
    @discardableResult
    func action(_ style: UIAlertActionStyle = .default, title: String?, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let action = UIAlertAction(title: title, style: style) { (action) in
            handler?(action)
        }
        self.addAction(action)
        return self
    }
    
    @discardableResult
    func textField(handler: @escaping ((UITextField) -> Void)) -> UIAlertController {
        self.addTextField { (textField) in
            handler(textField)
        }
        return self
    }
    
    //present
    func present(to viewController: UIViewController?) {
        viewController?.present(self, animated: true, completion: nil)
    }
}
