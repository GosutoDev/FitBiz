//
//  CustomTextField.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 23.11.2023.
//

import Foundation
import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    let tag: Int
    let placeholder: String
    let returnType: UIReturnKeyType
    @Binding var isFocusable: [Bool]
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.returnKeyType = returnType
        textField.tag = tag
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.addKeyboardDoneButton()
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if isFocusable[tag] {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField
        
        init(_ parent: CustomTextField) {
            self.parent = parent
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            if parent.tag == 0 {
                parent.isFocusable = [false, true, false]
                parent.text = textField.text ?? ""
            } else if parent.tag == 1 {
                parent.isFocusable = [false, false, true]
                parent.text = textField.text ?? ""
            }
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.text = textField.text ?? ""
            parent.isFocusable = [false, false, false]
        }
        
    }
}
