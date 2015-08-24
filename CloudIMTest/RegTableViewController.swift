//
//  RegTableViewController.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/31.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {

    // logic judgement
//    var (userOk,passOk,mailOk) = (false,false,false)
    var possibleInputs :Inputs = []
    
    var doneButton :UIBarButtonItem?
    
    @IBOutlet var loginTextFields: [UITextField]!
    @IBOutlet weak var answer: UITextBox!
    @IBOutlet weak var question: UITextBox!
    @IBOutlet weak var region: UITextBox!
    @IBOutlet weak var mail: UITextBox!
    @IBOutlet weak var pass: UITextBox!
    @IBOutlet weak var user: UITextBox!
    
    //检查必填项
    func checkRequiredField(){
//        for cell in tableView.visibleCells{
//            for subview in cell.subviews{
//                print(subview)
//                if let textFiled = subview as? UITextField{
//                    if textFiled.text!.isEmpty{
//                        let alert = UIAlertController(title: "必须全部填写", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//                        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
//                        alert.addAction(action)
//                        self.presentViewController(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
        
        // 引用第三方框架
//        self.view.runBlockOnAllSubviews { (subview) -> Void in
//            if let subview = subview as? UITextField{
//                if subview.text!.isEmpty{
//                    print("文本框为空")
//                }
//            }
//        }
        for textField in loginTextFields{
            if textField.text!.isEmpty{
//                self.successNotice("必填项为空")
                self.errorNotice("必填项目为空")
                
            }
        }
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        guard predicate.evaluateWithObject(mail.text) else{
            self.errorNotice("E-mail格式不正确")
            return
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        self.title = "新用户注册"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButtonTap")
        
        self.navigationItem.rightBarButtonItem?.enabled = false
        doneButton = self.navigationItem.rightBarButtonItem
        
//        let rightLabel = UILabel(frame: CGRectMake(0, 0, 100, 30))
//        rightLabel.text = user.placeholder
//        user.rightView = rightLabel
//        user.rightViewMode = UITextFieldViewMode.Always
        
      // use AJWValidator initializer
        let validator = AJWValidator(type: AJWValidatorType.String)
        validator.addValidationToEnsureMinimumLength(3, invalidMessage: "用户名至少3位")
        validator.addValidationToEnsureMaximumLength(15, invalidMessage: "用户名最大15位")
        self.user.ajw_attachValidator(validator)
        validator.validatorStateChangedHandler = {(newState:AJWValidatorState) -> Void in
            switch newState{
            case AJWValidatorState.ValidationStateValid:
                self.user.highlightState = UITextBoxHighlightState.Default
//                self.userOk = true
                self.possibleInputs.unionInPlace(Inputs.user)
            case AJWValidatorState.ValidationStateInvalid:
                let errorMsg = validator.errorMessages.first as? String
                self.user.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
//                self.userOk = false
                self.possibleInputs.subtractInPlace(Inputs.user)
            default:
                self.user.highlightState = UITextBoxHighlightState.Warning("Warning")
            }
//            doneButton?.enabled = self.userOk && self.passOk && self.mailOk
            self.doneButton?.enabled = self.possibleInputs.boolValue
        }
        
        let v2 = AJWValidator(type: AJWValidatorType.String)
        v2.addValidationToEnsureMinimumLength(6, invalidMessage: "密码至少6位")
        v2.addValidationToEnsureMaximumLength(15, invalidMessage: "密码至少15位")
        self.pass.ajw_attachValidator(v2)
        v2.validatorStateChangedHandler = {(newState:AJWValidatorState) -> Void in
            switch newState {
            case AJWValidatorState.ValidationStateValid:
                self.pass.highlightState = UITextBoxHighlightState.Default
//                self.passOk = true
                self.possibleInputs.unionInPlace(Inputs.pass)
            default:
                let errorMsg = v2.errorMessages.first as? String
                self.pass.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
//                self.passOk = false
                self.possibleInputs.subtractInPlace(Inputs.pass)
            }
//            doneButton?.enabled = self.userOk && self.passOk && self.mailOk
            self.doneButton?.enabled = self.possibleInputs ? true :false
        }
        
        let v3 = AJWValidator(type: AJWValidatorType.String)
        v3.addValidationToEnsureValidEmailWithInvalidMessage("Email格式不对")
        self.mail.ajw_attachValidator(v3)
        v3.validatorStateChangedHandler = {(newState:AJWValidatorState) -> Void in
            switch newState {
            case AJWValidatorState.ValidationStateValid:
                self.mail.highlightState = UITextBoxHighlightState.Default
//                self.mailOk = true
                self.possibleInputs.unionInPlace(Inputs.mail)
            default:
                let errorMsg = v3.errorMessages.first as? String
                self.mail.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
//                self.mailOk = false
                self.possibleInputs.subtractInPlace(Inputs.mail)
            }
//            doneButton?.enabled = self.userOk && self.passOk && self.mailOk
             self.doneButton?.enabled = self.possibleInputs.isAllOK()
        }
        
    }
    
    // 注册新用户
    func doneButtonTap(){
//       checkRequiredField()
        // 显示载入提示
        self.pleaseWait();
        // 建立用户的AVobject
         let user = AVObject(className: "XBUser")
        // 把输入的文本框的值，设置到对象中
        user["user"] = self.user.text
        user["pass"] = self.pass.text
        user["mail"] = self.mail.text
        user["region"] = self.region.text
        user["question"] = self.question.text
        user["answer"] = self.answer.text
        
        //查询用户是否已经注册
        let query = AVQuery(className: "XBUser")
        query.whereKey("user", equalTo: self.user.text)
        // 执行查询
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            
            self.clearAllNotice()
            // 查询到相关用户
            if object != nil{

                self.errorNotice(" 该用户已经注册")
                // 改变光标焦点
                self.user.becomeFirstResponder()
                self.doneButton?.enabled = false
            }else{
                //self.successNotice("用户未注册")
                user.saveInBackgroundWithBlock({ (succeed, e) -> Void in
                    if succeed {
                        self.successNotice("注册成功")
                        self.navigationController?.popViewControllerAnimated(true)
                    }else{
                        self.errorNotice(e.localizedDescription)
                    }
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
