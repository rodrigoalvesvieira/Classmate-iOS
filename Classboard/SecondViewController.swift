//
//  SecondViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/22/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    var disciplines: [Discipline] = []
    
    var classes = ["Cálculo I", "Matemática Discreta", "Int. a Computação", "Lógica", "Algoritmos", "Estatística", "Infra de Comunicação", "Infra de Software", "Info. Teórica", "Inter. Usuário-Máquina", "Int. Multimídia", "Compiladores"]
    
    var coursesInfo = [
        0: ["Cálculo I", "Matemática Discreta", "Int. a Computação"],
        1: ["Lógica", "Algoritmos", "Estatística"],
        2: ["Infra de Comunicação", "Infra de Software"],
        3: ["Info. Teórica", "Inter. Usuário-Máquina"],
        4: ["Int. Multimídia", "Compiladores"]
    ]
    
    var classTime = "13h - 15h"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.title = "Disciplinas"
        
        // Do any additional setup after loading the view, typically from a nib.        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return classes.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        var disciplines = coursesInfo[indexPath.section]
        
        cell.textLabel?.text = "Aula \(indexPath.section + 1)"
        cell.detailTextLabel?.text = classTime
        
        var lectureImage = UIImage(named: "Lectures")
        cell.imageView?.image = lectureImage
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return classes[section]
    }

}

