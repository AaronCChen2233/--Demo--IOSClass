//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Aaron Chen on 2020-05-06.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func shareBtnTap(_ sender: UIButton) {
        guard let image = imageView.image else {return}
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariBtnTap(_ sender: UIButton) {
        /**1. url*/
        if let url = URL(string: "https://www.google.ca"){
            /**2. create safari view controller*/
            let safariVC = SFSafariViewController(url: url)
            present(safariVC,animated: true,completion: nil)
        }
    }
    @IBAction func cameraBtnTap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let camaraAction = UIAlertAction(title: "Camera", style: .default, handler: {(action) in
            })
            alertController.addAction(camaraAction)
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {(action) in
                
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
 
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImg = info[.originalImage] as? UIImage else {return}
        imageView.image = selectedImg
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emailBtnTap(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail(){
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(["ixdezbtoeck@gmail.com"])
            mailComposer.setSubject("Hellow")
            mailComposer.setMessageBody("test", isHTML: false)
            present(mailComposer, animated: true, completion: nil)
            
        }else{
            print("You need login at less on email account")
            return
        }
    }
}

