//
//  ViewController.swift
//  FoodTracker
//
//  Created by 韩少林 on 2018/1/17.
//  Copyright © 2018年 MrHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    //MARK: Properties-命名并且链接xib
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: UITextFieldDelegate-输入框代理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.此方法返回一个布尔值，指示系统是否应处理按下Return键。在这种情况下，您总是想要按下回车键来回应用户，所以只需返回即可true。
        textField.resignFirstResponder()
        print("我第二个执行")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //该textFieldDidEndEditing(_:)方法使您有机会阅读输入到文本字段中的信息并对其进行处理。就你而言，你将采取文本字段中的文本，并使用它来更改标签的值。
        mealNameLabel.text=textField.text
        print("我第一个执行")
    }
    
//MARK: Actions-按钮
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

