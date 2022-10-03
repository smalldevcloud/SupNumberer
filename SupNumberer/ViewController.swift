//
//  ViewController.swift
//  SupNumberer
//
//  Created by cloud8 on 15.08.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wrongNumberTF: UITextField!
    @IBOutlet weak var resultNumber: UITextField!
    
    @IBAction func button(_ sender: UIButton) {

        var tfToString = wrongNumberTF.text!
        resultNumber.text = trimTrash(str: tfToString)
        callNumber(phoneNumber: trimTrash(str: tfToString))
        
    }
    
    func trimTrash(str: String) -> String {
        

        var str1 = str.replacingOccurrences(of: "+", with: "", options: NSString.CompareOptions.literal, range: nil)
        var str2 = str1.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        var str3 = str2.replacingOccurrences(of: "(", with: "", options: NSString.CompareOptions.literal, range: nil)
        var str4 = str3.replacingOccurrences(of: ")", with: "", options: NSString.CompareOptions.literal, range: nil)
        var str5 = str4.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        let str6 = String(str5.dropFirst(3))
        let result = "**80\(str6)"
        
        return result
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        wrongNumberTF.clearButtonMode = .always
        
    }
    
    private func callNumber(phoneNumber: String) {
        UIApplication.shared.open(NSURL(string: "tel://\(phoneNumber)") as! URL)
    }
}
