//
//  ViewController.swift
//  ProtocolPersistence
//
//  Created by Aaron Chen on 2020-05-05.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import UIKit

//struct Address {
//    var street:String
//}

struct Student:Equatable,Comparable,CustomStringConvertible, Codable {
    var firstName:String
    var lastName:String
    
    
    //    var addr:Address
    //    init(from decoder: Decoder) throws {
    //        <#code#>
    //    }
    //
    //    func encode(to encoder: Encoder) throws {
    //        <#code#>
    //    }
    
    var description: String{
        return "\(firstName) \(lastName)"
    }
    static func == (l:Student,r:Student)-> Bool {
        return l.firstName == r.firstName && l.lastName == r.lastName
    }
    static func < (l:Student,r:Student)-> Bool {
        return l.lastName < r.lastName
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        let s1 = Student(firstName: "Andre", lastName: "Mejia")
        //        let s2 = Student(firstName: "Aaron", lastName: "Chen")
        //        let s3 = Student(firstName: "Derrick", lastName: "Park")
        //        let s4 = Student(firstName: "Kaden", lastName: "Kim")
        //        let s5 = Student(firstName: "Aaron", lastName: "Huang")
        //        let s6 = Student(firstName: "Richard", lastName: "Cho")
        //
        //        var studnts = [s1,s2,s3,s4,s5,s6]
        //        print(s1 == s2)
        //
        //        studnts.sorted(by: <)
        //        print(studnts)
        
        /**Encode s1 into JSON*/
        /**1. Creat an encoder*/
        //        let jsonEncoder = JSONEncoder()
        
        /**2.Encode if is nil encoded will ble nil*/
        //        if  let encoded = try?  jsonEncoder.encode(s1){
        //            print(String(data: encoded, encoding: .utf8)!)
        
        
        /**Decode encodedJson into Student object*/
        /**1. create a decoder*/
        //            let jsonDecode = JSONDecoder()
        
        /**2. decode if*/
        //            do{
        //                let obj = try jsonDecode.decode(Student.self, from: encoded)
        //                print(obj)
        //            }catch{
        //                print(error.localizedDescription)
        //            }
        //        }
        
        //        do{
        //            jsonEncoder.encode(s1)
        //
        //        }catch{
        //
        //        }
        
        /**get API Data*/
//        fetchStartwarsCharacter("https://swapi.dev/api/people/1/")

    }
    
    private func fetchStartwarsCharacter(_ urlString:String){
        /**1. create an url object*/
        guard let url = URL(string: urlString) else {return}
        /**2. URLSession*/
        let session = URLSession(configuration: .default)
        /**3. create a task*/
        session.dataTask(with: url){(data,res,err) in
            guard err == nil else {return}
            guard let data = data else {return}
            if let stChar = try? JSONDecoder().decode(StartWarsChar.self, from: data){
                print(stChar)
            }
        }.resume()
    }
}

struct StartWarsChar:Codable,CustomStringConvertible {
    let name:String
    let eye_color:String
    let gender:String
    var description:String{
        return "\(name)"
    }
}

