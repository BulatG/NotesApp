//
//  DetailViewController.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 07.03.2023.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    let realm = try! Realm()
    
    var onUpdateNewNode: ((String?) -> Void)? // замыкание обновления данных
    var onAddNewNode: ((String?) -> Void)? // замыкание добавления данных
    
    @IBOutlet weak var detailTextView: UITextView!
    
    var detailText: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.text = detailText
}
    @IBAction func addNewNode(_ sender: Any) {
        onUpdateNewNode?(detailTextView.text!)
        onAddNewNode?(detailTextView.text!)
        navigationController?.popViewController(animated: true)
    }
}

