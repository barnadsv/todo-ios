//
//  DetailViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 19/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit

//var gt: GerenciadorTarefas! = GerenciadorTarefas()

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextView!
    @IBOutlet weak var dataLimiteTextField: UITextField!
    @IBOutlet weak var responsavelTextField: UITextField!
    @IBOutlet weak var dataCriacaoLabel: UILabel!
    
    var indice = 0
    var dataCriacao: String = ""
    var titulo: String! = ""
    var descricao: String = ""
    var dataLimite: String? = ""
    var responsavel: String = ""
    
    //let gerenciadorTarefas: GerenciadorTarefas
    @IBAction func saveTarefa(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        if (tituloTextField.text != "") {
            titulo = tituloTextField.text
            descricao = descricaoTextField.text
            dataLimite = dataLimiteTextField.text != "" ? dataLimiteTextField.text : dataCriacaoLabel.text
            if (dataLimite!.characters.count < 17) {
                dataLimite! += " 00:00:00"
            }
            responsavel = responsavelTextField.text!
            gt.listaTarefas[indice].titulo = titulo
            gt.listaTarefas[indice].descricao = descricao
            gt.listaTarefas[indice].dataLimite = dateFormatter.date(from: dataLimite!)!
            gt.listaTarefas[indice].responsavel = responsavel
        } else {
            let alertController = UIAlertController(title: "Atenção", message:
                "Título não pode ser vazio!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func dataLimiteEditing(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(DetailViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        dataLimiteTextField.text = dateFormatter.string(from: sender.date)
    }

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

