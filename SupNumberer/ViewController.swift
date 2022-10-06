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
        UIPasteboard.general.string = trimTrash(str: tfToString)
        callNumber(phoneNumber: trimTrash(str: tfToString))
        
        
    }
    
    func trimTrash(str: String) -> String {
        

        let unsafeChars = CharacterSet.alphanumerics.inverted
        let lowLetters = CharacterSet.lowercaseLetters
        let uppLetters = CharacterSet.uppercaseLetters

        let cleanChars  = str.components(separatedBy: unsafeChars).joined(separator: "")
        let cleanLowLett = cleanChars.components(separatedBy: lowLetters).joined(separator: "")
        let cleanUppLett = cleanLowLett.components(separatedBy: uppLetters).joined(separator: "")
        
        let dropFirst = String(cleanUppLett.dropFirst(3))
        let result = "**80\(dropFirst)"
        
        return result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let pasteboardString: String? = UIPasteboard.general.string
        if let theString = pasteboardString {
            wrongNumberTF.text = theString }
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
