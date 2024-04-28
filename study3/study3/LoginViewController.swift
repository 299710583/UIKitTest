//
//  LoginViewController.swift
//  study3
//
//  Created by 曾卫 on 2024/4/23.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber{
    func validatesPhoneNumber(_ phoneNumber:String) -> Bool
}

protocol ValidatesPassword{
    func vaidatePassword(_ password:String) ->Bool
}

extension ValidatesPhoneNumber{
    func validatesPhoneNumber(_ phoneNumber:String) -> Bool{
        if phoneNumber.count == 11{
            return true
        }
        return false
    }
}

extension ValidatesPassword{
    func vaidatePassword(_ password:String) ->Bool{
        if password.count < 6 || password.count > 12{
            return false
        }
        return true
        
    }
}

class LoginViewController: BaseViewController,ValidatesPhoneNumber,ValidatesPassword {
    
    var phoneTextField:UITextField!
    var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        let passwordIconView = UIImageView(image: R.image.icon_pwd ())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        guard let superview = passwordTextField.superview else {
            print("Superview is nil")
            return
        }
            passwordTextField.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(20)
            make.right.equalTo(superview).offset(-20)
            make.top.equalTo(phoneTextField.snp.bottom).offset(15)
            make.height.equalTo(50)
        }

        
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        loginButton.backgroundColor = UIColor.hexColor(0xf8892e)
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
    }
    
    func showToast(){
        let alsertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alsertVC,animated:true,completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            alsertVC.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func didClickLoginButton(){
        if validatesPhoneNumber(phoneTextField.text ?? "") && vaidatePassword(passwordTextField.text ?? ""){
            
        }else{
            self.showToast()
        }
    }
}
