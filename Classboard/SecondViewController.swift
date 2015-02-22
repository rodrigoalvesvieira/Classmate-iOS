//
//  SecondViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/22/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    var classes = ["1 Período", "2 Período", "3 Período", "4 Período", "5 Período"]
    
    var coursesInfo = [
        0: ["Cálculo I", "Matemática Discreta", "Int. a Computação"],
        1: ["Lógica", "Algoritmos", "Estatística"],
        2: ["Infra de Comunicação", "Infra de Software"],
        3: ["Info. Teórica", "Inter. Usuário-Máquina"],
        4: ["Int. Multimídia", "Compiladores"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return classes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        var disciplines = coursesInfo[indexPath.section]
        var id = calculateIndex(indexPath.section, index: indexPath.row)
        
        println("celula eh \(indexPath.row) e id eh \(id)")
        
        cell.textLabel?.text = disciplines?[0]
        
        return cell
    }
    
    func calculateIndex(section: Int, index: Int) -> Int {
        var total = 0
        
        for i in 0..<(section + 1) {
            total = (coursesInfo[i]?.count)!
        }
        
        return total
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return classes[section]
    }

}

