//
//  ViewController.swift
//  pryanikyTest
//
//  Created by Илья Новиков on 27.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var data: JsonModel? = nil

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        DataParsing().parsingData { [self] (jsonModel) in
            guard let jsonModel = jsonModel else { return }
            data = jsonModel
            tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = data?.data[indexPath.item].name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.data?.data[indexPath.item].data)
        let currentData = (data?.data[indexPath.row])!
        let secondVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.setCurrentData(currentData)
        self.present(secondVC, animated: true, completion: nil)
    }    
}

