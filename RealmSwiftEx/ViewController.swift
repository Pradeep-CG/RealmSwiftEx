//
//  ViewController.swift
//  RealmSwiftEx
//
//  Created by Pradeep on 09/07/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Saving data to realm
        let note = Note()
        note.id = 2
        note.title = "Remember the milk!"
        note.text = "Mom asked if I could bring a gallon of milk home."
        
        let note1 = Note()
        note1.id = 3
        note1.title = "Remember the Pepsi"
        note1.text = "Mom asked if I could bring a gallon of Pepsi home."
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(note)
                realm.add(note1)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        // retrieving data from realm
        let realm = try? Realm()
        let notes = realm!.objects(Note.self)
        
        for note in notes
        {
            print(note.text)
        }
        
    }
}

