//
//  CustomTextView.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 23.11.2023.
//

import SwiftUI

struct CustomEditor: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var isFocusable: [Bool]
    let tag: Int
    
    func makeUIView(context: Context) -> UITextView {
        let editor = UITextView()
        editor.text = text
        editor.font = .systemFont(ofSize: 17)

        editor.backgroundColor = .clear
        editor.isEditable = true
        editor.isScrollEnabled = false
        editor.addKeyboardDoneButton()
        
        
        editor.delegate = context.coordinator
        return editor
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        uiView.text = text
        
        if isFocusable[tag] {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject ,UITextViewDelegate {
        var parent: CustomEditor
        
        init(_ parent: CustomEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            parent.isFocusable = [false, false, false]
        }
    }
}
