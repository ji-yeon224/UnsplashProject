//
//  SignUpViewModel.swift
//  UnsplashProject
//
//  Created by 김지연 on 2023/09/18.
//

import Foundation


class SignUpViewModel {
    
    var email: Observable<String?> = Observable(nil)
    var password: Observable<String?> = Observable(nil)
    var nickname: Observable<String?> = Observable(nil)
    var location: Observable<String?> = Observable(nil)
    var recommend: Observable<String?> = Observable(nil)
    
    var emailInvalid: Observable<String?> = Observable("")
    var passwordInvalid: Observable<String?> = Observable("")
    var nicknameInvalid: Observable<String?> = Observable("")
    var locationInvalid: Observable<String?> = Observable("")
    var recommendInvalid: Observable<String?> = Observable("")
    
    
    func checkEmail() -> Bool{
        guard let text = email.value?.trimmingCharacters(in: .whitespaces) else {
            emailInvalid.value = "이메일을 입력해주세요."
            return false
        }
        if text.isEmpty {
            emailInvalid.value = "이메일을 입력해주세요."
            return false
        }
        guard text.contains("@") else {
            emailInvalid.value = "올바른 이메일 형식을 입력해주세요."
            return false
        }
        return true
    }
    
    func checkPassword() -> Bool{
        guard let text = password.value?.trimmingCharacters(in: .whitespaces) else {
            passwordInvalid.value = "비밀번호를 입력해주세요."
            return false
        }
        
        if text.isEmpty {
            passwordInvalid.value = "비밀번호를 입력해주세요."
            return false
        }
        
        guard text.count >= 6 && text.count <= 10 else {
            passwordInvalid.value = "6자리 이상 10자리 이하로 입력해주세요."
            return false
        }
        
        return true
    }
    
    func recommendCheck() -> Bool {
        
        guard let text = recommend.value?.trimmingCharacters(in: .whitespaces) else {
            recommendInvalid.value = "추천 코드를 입력해주세요."
            return false
        }
        
        if text.isEmpty {
            recommendInvalid.value = "추천 코드를 입력해주세요."
            return false
        }
        
        guard let num = Int(text) else {
            recommendInvalid.value = "숫자를 입력하세요."
            return false
        }
        
        guard String(num).count == 6 else {
            recommendInvalid.value = "추천코드는 6자리 입니다."
            return false
        }
        
        return true
        
    }
    
    func nickNameCheck() -> Bool {
        
        guard let text = nickname.value?.trimmingCharacters(in: .whitespaces) else {
            nicknameInvalid.value = "닉네임을 입력해주세요."
            return false
        }
        
        if text.isEmpty {
            nicknameInvalid.value = "닉네임을 입력해주세요."
            return false
        }
        return true
        
    }
    
    func locationCheck() -> Bool {
        guard let text = location.value?.trimmingCharacters(in: .whitespaces) else {
            locationInvalid.value = "위치를 입력해주세요."
            return false
        }
        
        if text.isEmpty {
            locationInvalid.value = "위치를 입력해주세요."
            return false
        }
        
        return true
    }
    
}
