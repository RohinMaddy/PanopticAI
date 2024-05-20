//
//  ViewController.swift
//  PanopticAI
//
//  Created by Rohin Madhavan on 10/05/2024.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    let networkManager = NetworkManager()
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage {
            imageView.image = pickedImage
            
            guard let ciimage = CIImage(image: pickedImage) else { fatalError("Cannot convert to ciimage") }
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        let defaultConfig = MLModelConfiguration()
        
        guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: defaultConfig).model) else { fatalError("Loading coreML model failed") }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else { fatalError("Classification failed") }
            if let classifiedItem = results.first?.identifier {
                print(classifiedItem)
                if let itemName = classifiedItem.components(separatedBy: ",").last {
                    self.networkManager.requestInfo(itemName) { model in
                        DispatchQueue.main.async {
                            self.title = model.title
                            self.textView.text = model.summary
                        }
                    }
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            fatalError("failed to perform request!")
        }
    }

    @IBAction func cameraButtonClicked(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

