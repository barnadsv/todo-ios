//
//  ViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 16/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit

var gt: GerenciadorTarefasModel! = GerenciadorTarefasModel()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var indice = 0;
    var dataCriacao: String! = ""
    var titulo: String! = ""
    var descricao: String! = ""
    var dataLimite: String! = ""
    var responsavel: String! = ""
    var tarefa: Tarefa!
    
    var currentItem: UITableViewCell!
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var criarTarefaButton: UIButton!
    
    @IBAction func addItem(_ sender: Any) {
        if (input.text != "") {
            tarefa = Tarefa(titulo: input.text!, descricao: "", dataLimite: "", responsavel: "")
            gt.adicionarTarefa(tarefa: tarefa)
            indice = gt.retornaTarefasCount() - 1
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
            dataCriacao = dateFormatter.string(from: tarefa.dataCriacao)
            titulo = tarefa.titulo
            descricao = ""
            dataLimite = dateFormatter.string(from: tarefa.dataLimite)
            responsavel = ""
            performSegue(withIdentifier: "segueToDetailView", sender: self)
            input.text = ""
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (gt.listaTarefas.count)
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "item")
        item.textLabel?.text = gt.listaTarefas[indexPath.row].titulo
        item.accessoryType = .disclosureIndicator
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        item.selectedBackgroundView = bgColorView
        
        return(item)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            gt.listaTarefas.remove(at: indexPath.row)
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
        dataCriacao = dateFormatter.string(from: gt.listaTarefas[row].dataCriacao)
        titulo = gt.listaTarefas[row].titulo
        descricao = gt.listaTarefas[row].descricao
        dataLimite = dateFormatter.string(from: gt.listaTarefas[row].dataLimite)
        responsavel = gt.listaTarefas[row].responsavel
        performSegue(withIdentifier: "segueToDetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToDetailView") {
            let detailViewController = segue.destination as! DetailViewController
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

