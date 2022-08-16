//
//  ViewController.swift
//  SupNumberer
//
//  Created by cloud8 on 15.08.22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var wrongNumberTF: UITextField!
    
   
   
    @IBAction func button(_ sender: UIButton) {
        
        let example = "**80"
        var tfToString = wrongNumberTF.text!
        let nuberArr = tfToString.components(separatedBy: " ")
        
        if nuberArr.count <= 2 { return } else {
        
        let resultNum = "\(example) \(nuberArr[1]) \(nuberArr[2])"
        
        resultNumber.text = resultNum
        UIPasteboard.general.string = resultNum
            callNumber(phoneNumber: resultNum)
            
        }
    }
    
    @IBOutlet weak var resultNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        wrongNumberTF.clearButtonMode = .always
        
    }
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}

