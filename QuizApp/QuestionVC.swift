//
//  File.swift
//  QuizApp
//
//  Created by Mobarak Hossen on 9/10/22.
//

import Foundation
import UIKit
class QuestionVC:UIViewController{
    var headerLable:UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    var tableView:UITableView = {
        let tbl = UITableView()
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tbl
    }()
    
    private var question:String = ""
    private var options:[String] = []
    convenience init(question:String,option:[String]){
        self.init()
        self.question = question
        self.options = option
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerLable)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        headerLable.text = self.question
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerLable.heightAnchor.constraint(equalToConstant: 20),
            headerLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerLable.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension QuestionVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.options[indexPath.row]
        return cell
    }
    
    
}
