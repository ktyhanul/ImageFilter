//
//  ViewController.swift
//  ImageFilter
//
//  Created by 김태영 on 2017. 6. 15..
//  Copyright © 2017년 kty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImageDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var imageButton: UIBarButtonItem!
    let imagePicker = UIImagePickerController()
    var filterCollection: FilterCollectionViewController?
    var filterDelegate: FilterDelegate?
    
    @IBAction func imageButtonAction(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func filterButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            filterDelegate?.reloadCollection()
        }
        dismiss(animated: true, completion: nil)

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FilterCollection" {
            filterCollection = segue.destination as? FilterCollectionViewController
            filterCollection?.imageDelegate = self
            filterDelegate = filterCollection
        }
    }
    
    func getImage() -> UIImage? {
        return imageView.image
    }
}

