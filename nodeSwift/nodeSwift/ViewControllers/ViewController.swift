//
//  ViewController.swift
//  nodeSwift
//
//  Created by Булат Габдуллин on 05.03.2023.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var nodeData : [Node] = []
    var nodeData : Results<Node>!
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        nodeData = Storage().getData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIdentifier") as! CustomCellTableViewCell
        cell.configureCell(with: nodeData[indexPath.row]) // загрузка ячейки с данными модели
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nodeData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // замыкание вызывается при переходе по ячейке
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController else { return }
        detailViewController.onUpdateNewNode = { [self] detailText in// замыкание для обновления данных в realm
            let nodes = realm.objects(Node.self) // вызывается при нажатии кнопки готово в detail vc
                try! self.realm.write {
                    nodes[indexPath.row].specification = detailText! // обновление данных
                }
                
            tableView.reloadData() // обновляем таблицу после возвращения со 2 экрана
        }
        detailViewController.detailText = nodeData[indexPath.row].specification // заполнение данных во 2 контроллере из realm
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // метод удаления учейки свайпом
            if let node = nodeData?[indexPath.row] { // удаляем данные из realm
                try! realm.write {
                    realm.delete(node)
                }
                tableView.deleteRows(at: [indexPath], with: .fade) // удаляем ячейку из таблицы
            }
        }
    }
    
    @IBAction func addNewNode(_ sender: UIBarButtonItem) { // кнопка перехода с первого экрана на 2
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController else { return }
        detailViewController.onAddNewNode = { [self] detailText in // замыкание вызывается при нажатии кнопки готово
            
                try! self.realm.write {
                let node = Node()
                    node.specification = detailText!
                    realm.add(node)
                }
                
            tableView.reloadData()
        }
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

