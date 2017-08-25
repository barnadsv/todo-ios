//
//  ViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 16/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit

var gt: GerenciadorTarefas! = GerenciadorTarefas()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let gerenciadorTarefas: GerenciadorTarefas
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

