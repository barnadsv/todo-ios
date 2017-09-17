//
//  ViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 16/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var tarefas : [NSManagedObject] = []
    
    var indice = 0;
    var uuid: String! = ""
    var strDataCriacao: String! = ""
    var dataCriacao: NSDate = NSDate()
    var titulo: String! = ""
    var descricao: String! = ""
    var strDataLimite: String! = ""
    var dataLimite: NSDate = NSDate()
    var responsavel: String! = ""
    var tarefa: Tarefa!
    
    var currentItem: UITableViewCell!
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var criarTarefaButton: UIButton!
    
    @IBAction func addItem(_ sender: Any) {
        if (input.text != "") {
            uuid = UUID().uuidString
            dataCriacao = NSDate()
            dataLimite = NSDate()
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid, dataCriacao: dataCriacao, titulo: input.text!, descricao: "", dataLimite: dataLimite, responsavel: "")
            
            indice = Tarefas.sharedInstance.retornaTarefasCount() - 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
            
            strDataCriacao = dateFormatter.string(from: dataCriacao as Date)
            titulo = input.text!
            descricao = ""
            strDataLimite = dateFormatter.string(from: dataLimite as Date)
            responsavel = ""
            performSegue(withIdentifier: "segueToDetailView", sender: self)
            input.text = ""
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tarefas.sharedInstance.tarefas.count
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        
        let item = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "item")
        item.textLabel?.text = Tarefas.sharedInstance.tarefas[indexPath.row].titulo
        item.detailTextLabel?.text = dateFormatter.string(from: Tarefas.sharedInstance.tarefas[indexPath.row].dataCriacao! as Date)
        item.accessoryType = .disclosureIndicator
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        item.selectedBackgroundView = bgColorView
        
        return(item)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            Tarefas.sharedInstance.apagaTarefa(uuid: Tarefas.sharedInstance.tarefas[indexPath.row].uuid!)
            tarefas = Tarefas.sharedInstance.getTarefas()
            todoTableView.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        indice = row
        print("Row: \(row)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        uuid = Tarefas.sharedInstance.tarefas[row].uuid
        dataCriacao = Tarefas.sharedInstance.tarefas[row].dataCriacao!
        titulo = Tarefas.sharedInstance.tarefas[row].titulo
        descricao = Tarefas.sharedInstance.tarefas[row].descricao
        dataLimite = Tarefas.sharedInstance.tarefas[row].dataLimite!
        responsavel = Tarefas.sharedInstance.tarefas[row].responsavel
        performSegue(withIdentifier: "segueToDetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToDetailView") {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.uuid = uuid
            detailViewController.indice = indice
            detailViewController.dataCriacao = dataCriacao
            detailViewController.titulo = titulo
            detailViewController.descricao = descricao
            detailViewController.dataLimite = dataLimite
            detailViewController.responsavel = responsavel
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        todoTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let borderColor = UIColor.lightGray
        input.layer.borderColor = borderColor.cgColor
        input.layer.borderWidth = 1.0
        input.layer.cornerRadius = 5
        criarTarefaButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tarefas = Tarefas.sharedInstance.getTarefas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

