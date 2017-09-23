//
//  DetailViewController.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 19/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import UIKit
import DateTimePicker

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextField: UITextView!
    @IBOutlet weak var dataLimiteTextField: UITextField!
    @IBOutlet weak var responsavelTextField: UITextField!
    @IBOutlet weak var dataCriacaoLabel: UILabel!
    @IBOutlet weak var salvarTarefaButton: UIButton!
    
    var indice = 0
    var uuid: String = ""
    var dataCriacao: NSDate!
    var strDataCriacao: String?
    var titulo: String! = ""
    var descricao: String = ""
    var dataLimite: NSDate!
    var strDataLimite: String?
    var responsavel: String = ""
    
    var dataLimiteValida: Bool = false
    
    @IBAction func saveTarefa(_ sender: Any) {
        if (tituloTextField.text != "") {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
            if let tempDataLimite = dateFormatter.date(from: dataLimiteTextField.text!) {
                titulo = tituloTextField.text
                descricao = descricaoTextField.text
                responsavel = responsavelTextField.text!
                dataLimite = tempDataLimite as NSDate
                dataLimiteValida = true
                Tarefas.sharedInstance.atualizaTarefa(uuid: uuid, titulo: titulo, descricao: descricao, dataLimite: dataLimite, responsavel: responsavel)
            } else {
                let alertController = UIAlertController(title: "Atenção", message:
                    "Formato da Data Limite está incorreto!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                dataLimiteValida = false
            }

        } else {
            let alertController = UIAlertController(title: "Atenção", message:
                "Título não pode ser vazio!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //if (identifier == "segueToListView" && (tituloTextField.text! == "" || (Tarefas.sharedInstance.validaDataHorario(dataHorario: dataLimiteTextField.text!) == false && dataLimiteTextField.text != ""))) {
        //    return false
        //} else {
            return dataLimiteValida
        //}
    }
 
    
    @IBAction func dataLimiteEditing(_ sender: UITextField) {
        
//        let datePickerView:UIDatePicker = UIDatePicker()
//        datePickerView.datePickerMode = UIDatePickerMode.date
//        sender.inputView = datePickerView
//        datePickerView.addTarget(self, action: #selector(DetailViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
        //formatter.dateFormat = "dd/MM/YYYY HH:mm:ss"
        let min = Date()
        let max = Date().addingTimeInterval(60 * 60 * 24 * 365)
        let picker = DateTimePicker.show(minimumDate: min, maximumDate: max)
        picker.highlightColor = UIColor(red: 15.0/255.0, green: 95.0/255.0, blue: 255.0/255.0, alpha: 1)
        picker.darkColor = UIColor.darkGray
        picker.doneButtonTitle = "OK"
        picker.todayButtonTitle = "Hoje"
        picker.cancelButtonTitle = "Cancelar"
        picker.is12HourFormat = false
        picker.dateFormat = "dd/MM/YYYY HH:mm:ss"
        // picker.isDatePickerOnly = true
        sender.inputView = picker
        picker.completionHandler = { date in
            self.dataLimiteTextField.text = formatter.string(from: date)
        }
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
        dataLimiteTextField.text = dateFormatter.string(from: sender.date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let borderColor = UIColor.lightGray
        tituloTextField.layer.borderColor = borderColor.cgColor
        tituloTextField.layer.borderWidth = 1.0
        tituloTextField.layer.cornerRadius = 5
        
        descricaoTextField.layer.borderColor = borderColor.cgColor
        descricaoTextField.layer.borderWidth = 1.0
        descricaoTextField.layer.cornerRadius = 5
        
        dataLimiteTextField.layer.borderColor = borderColor.cgColor
        dataLimiteTextField.layer.borderWidth = 1.0
        dataLimiteTextField.layer.cornerRadius = 5
        
        responsavelTextField.layer.borderColor = borderColor.cgColor
        responsavelTextField.layer.borderWidth = 1.0
        responsavelTextField.layer.cornerRadius = 5
        
        salvarTarefaButton.layer.cornerRadius = 5
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm:ss")
        
        dataCriacaoLabel.text = dateFormatter.string(from: dataCriacao as Date)
        tituloTextField.text = titulo
        descricaoTextField.text = descricao
        dataLimiteTextField.text = dateFormatter.string(from: dataLimite as Date)
        responsavelTextField.text = responsavel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

