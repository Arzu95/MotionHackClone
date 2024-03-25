//
//  ImagePicker.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 25/03/24.
//

import SwiftUI
import UIKit



struct ImagePicker: UIViewControllerRepresentable {
    
    
    enum ImageQuality: CGFloat {
        case highest = 1 // default image size
        case high = 0.8
        case medium = 0.6
        case low = 0.4
        case lowest = 0.2
    }
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary //ndak punya ipon jadi test pakai galeri aja
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        // Select Image Quality!
        func withQuality(_ quality: ImageQuality) -> CGFloat {
            return quality.rawValue
        }
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: withQuality(.low)),
                      let compressedImage = UIImage(data: data) else {
                    print("something wrong while compressing...")
                    return
                }
                parent.selectedImage = compressedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
