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
        UIView.animate(withDuration: 0.4,
                       animations: {
                            self.criarTarefaButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       },
                       completion: { _ in
                            UIView.animate(withDuration: 0.2) {
                                self.criarTarefaButton.transform = CGAffineTransform.identity
                                if (self.input.text != "") {
                                    self.uuid = UUID().uuidString
                                    self.dataCriacao = NSDate()
                                    self.dataLimite = NSDate()
                                    Tarefas.sharedInstance.adicionarTarefa(uuid: self.uuid, dataCriacao: self.dataCriacao, titulo: self.input.text!, descricao: "", dataLimite: self.dataLimite, responsavel: "")
                                    
                                    self.indice = Tarefas.sharedInstance.retornaTarefasCount() - 1
                                    let dateFormatter = DateFormatter()
                                    dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
                                    
                                    self.strDataCriacao = dateFormatter.string(from: self.dataCriacao as Date)
                                    self.titulo = self.input.text!
                                    self.descricao = ""
                                    self.strDataLimite = dateFormatter.string(from: self.dataLimite as Date)
                                    self.responsavel = ""
                                    self.performSegue(withIdentifier: "segueToDetailView", sender: self)
                                    self.input.text = ""
                                }

                            }
                        })
        
 
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tarefas.sharedInstance.tarefas.count
    }
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
        
        let item = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "item")
        item.textLabel?.text = Tarefas.sharedInstance.tarefas[indexPath.row].titulo
        item.detailTextLabel?.text = dateFormatter.string(from: Tarefas.sharedInstance.tarefas[indexPath.row].dataCriacao! as Date)
        item.accessoryType = .disclosureIndicator
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        item.selectedBackgroundView = bgColorView
    
        UIView.animate(withDuration: 1.5, delay: 0.05, options: UIViewAnimationOptions.curveEaseOut, animations: {
            item.transform = CGAffineTransform(translationX: 0, y: 0);
        }, completion: nil)
        
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
        animateTable()
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
        todoTableView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func animateTable() {
        
        let cells = todoTableView.visibleCells
        let tableHeight: CGFloat = todoTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                self.todoTableView.alpha = 1
            }, completion: nil)
            let borderColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1)
            cell.layer.borderColor = borderColor.cgColor
            cell.layer.borderWidth = 1.0

            index += 1
        }
    }

}

