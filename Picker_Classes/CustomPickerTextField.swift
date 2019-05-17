//
//  CustomPickerTextField.swift
//  CustomPickerView
//
//  Created by Varender Singh on 17/05/19.
//  Copyright © 2019 Varender Singh. All rights reserved.
//

import UIKit

@objc protocol CustomDelegateToSendValue:class {
    func sendValueForTextFieldWithTag(string:String,tag:Int);
}



@IBDesignable
class CustomPickerTextField: UITextField,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var customDelegate:CustomDelegateToSendValue? = nil;
    var arrayPickerValues:Array<String>? = nil
    var pickerView:UIPickerView? = nil;
    var toolBar:UIToolbar? = nil;
    var newTag:Int = 0;
    
    override func becomeFirstResponder() -> Bool {
        self.toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 42));
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClicked))
        toolBar?.items = [doneButton]
        self.pickerView = UIPickerView()
        self.pickerView?.delegate = self;
        self.pickerView?.dataSource = self;
        self.inputView = self.pickerView;
        self.inputAccessoryView = toolBar;
        if(self.text?.count != 0) {
            if let index = self.arrayPickerValues?.index(of: self.text!) {
                self.pickerView?.selectRow(index, inComponent: 0, animated: false)
            }
        }
        self.pickerView?.reloadComponent(0)
        super.becomeFirstResponder()
        return true;
    }
    
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.pickerView?.dataSource = nil
        self.pickerView?.dataSource = nil
        self.pickerView?.removeFromSuperview()
        self.pickerView = nil;
        self.toolBar?.removeFromSuperview()
        self.toolBar = nil;
        return true;
    }
    
    func setUpWithValuesCell(arrayString:Array<String>,tag:Int) {
        self.arrayPickerValues = arrayString;
        self.newTag = tag;
        
    }
    
    @objc func doneBtnClicked() {
        self.text = self.arrayPickerValues?[(self.pickerView?.selectedRow(inComponent: 0))!]
        self.customDelegate?.sendValueForTextFieldWithTag(string: self.text!, tag: self.newTag)
        let _ = self.resignFirstResponder()
    }
    
    //MARK:- <UIPickerViewDataSource>
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (arrayPickerValues?.count)!;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPickerValues?[row];
    }
    
    //MARK:- <UIPickerViewDelegate>
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = arrayPickerValues?[row];
    }
}
