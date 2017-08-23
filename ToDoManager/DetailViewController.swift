//
//  DetailViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 19/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextView!
    @IBOutlet weak var dataLimiteTextField: UITextField!
    @IBOutlet weak var responsavelTextField: UITextField!
    @IBOutlet weak var dataCriacaoLabel: UILabel!
    
    
    var dataCriacao: String = ""
    var titulo: String! = ""
    var descricao: String = ""
    var dataLimite: String = ""
    var responsavel: String = ""
    
    //let gerenciadorTarefas: GerenciadorTarefas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataCriacaoLabel.text = dataCriacao
        tituloTextField.text = titulo
        descricaoTextField.text = descricao
        dataLimiteTextField.text = dataLimite
        responsavelTextField.text = responsavel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

