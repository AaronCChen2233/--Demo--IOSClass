//
//  NotesViewController.swift
//  ProtocolPersistence
//
//  Created by Aaron Chen on 2020-05-05.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

struct Note : Codable{
    let title:String
    let text :String
    let timestamp:Data
}

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let newNote = Note(title: "Grocery Run", text: "Pick up some coconut water", timestamp: Data())
        
        let propertyListEncoder = PropertyListEncoder()
        if let encodeNote = try? propertyListEncoder.encode(newNote){
            print(encodeNote)
            /**1. Access to Documents directory using FileManager*/
            /**Singleton*/
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
            
            try? encodeNote.write(to: archiveURL, options: .noFileProtection)
            
            let propertyListDecoder = PropertyListDecoder()
            if let retrievedNote = try? Data(contentsOf: archiveURL){
                if let decodeNote = try? propertyListDecoder.decode(Note.self, from: retrievedNote){
                    print(decodeNote)
                }
            }
            
//            let propertyListDecoder = PropertyListDecoder()
//            if let decodeNote = try?propertyListDecoder.decode(Note.self, from: encodeNote){
//                print(decodeNote)
//            }
        }
    }
}
