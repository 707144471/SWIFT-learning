//
//  ViewController.swift
//  FoodTracker
//
//  Created by 韩少林 on 2018/1/17.
//  Copyright © 2018年 MrHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //MARK: Properties-命名并且链接xib
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate=self
        photoImageView.isUserInteractionEnabled=true;
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
    //MARK: UIImagePickerControllerDelegate 图片选择器
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.这段代码激发了图像采集器控制器的解雇
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }


    
//MARK: Actions-按钮
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"

    }
    //手势点击事件
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.此代码可确保如果用户在文本字段中键入图像视图时，键盘将被正确解除。
        nameTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.这一行代码设置图像选择器控制器的来源，或者获取图像的地方。该.photoLibrary选项使用模拟器的相机胶卷
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        /*
         present(_:animated:completion:)是一个被调用的方法ViewController。虽然没有明确写出，但是这个方法是在一个隐含的self对象上执行的。该方法要求ViewController呈现由定义的视图控制器imagePickerController。传递true给animated参数可激活图像采集器控制器的显示。该completion参数是指完成处理程序，即在该方法完成后执行的一段代码。因为你不需要做任何事情，所以你指出你不需要通过传入nil来执行完成处理程序。
         */
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
}

