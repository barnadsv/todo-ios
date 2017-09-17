//
//  TarefasManager.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 16/09/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class Tarefas {

    static let sharedInstance = Tarefas()
    var tarefas = [Tarefa]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getTarefas() -> [Tarefa] {
        do {
            tarefas = try context.fetch(Tarefa.fetchRequest())
        } catch {
            print("Error fetching data from CoreData")
        }
        return tarefas
    }
    
    func adicionarTarefa(uuid: String, dataCriacao: NSDate, titulo: String, descricao: String, dataLimite: NSDate, responsavel: String) {
        let tarefa = Tarefa(context:context)
        tarefa.uuid = uuid
        tarefa.dataCriacao = NSDate()
        tarefa.titulo = titulo
        tarefa.dataLimite = dataLimite
        tarefa.responsavel = responsavel
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func apagaTarefa(uuid: String) {
        let request = NSFetchRequest<Tarefa>(entityName: "Tarefa")
        do {
            let resultados = try context.fetch(request)
            for tarefa in resultados {
                if tarefa.uuid == uuid {
                    // delete task
                    context.delete(tarefa)
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func atualizaTarefa(uuid: String, titulo: String, descricao: String, dataLimite: NSDate, responsavel: String) {
        let request = NSFetchRequest<Tarefa>(entityName: "Tarefa")
        do {
            let resultados = try context.fetch(request)
            for tarefa in resultados {
                if tarefa.uuid == uuid {
                    tarefa.titulo = titulo
                    tarefa.descricao = descricao
                    tarefa.dataLimite = dataLimite
                    tarefa.responsavel = responsavel
                }
            }
        } catch {
            print("Error with request: \(error)")
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    /**
     Retorna o total de tarefas
     */
    func retornaTarefasCount() -> Int {
        return getTarefas().count
    }
    
    /**
    Verifica se a data e horário estão no formato correto
    */
    func validaDataHorario(dataHorario: String) -> Bool {
        let dataLimitePattern = "^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[0-2])/\\d\\d\\d\\d ([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-9]|[0-5][0-9]):([0-9]|[0-5][0-9])$"
        let dataLimiteRegex = try! NSRegularExpression(pattern: dataLimitePattern)
        let dataLimiteRange = NSMakeRange(0, dataHorario.characters.count)
        let matchRange = dataLimiteRegex.rangeOfFirstMatch(in: dataHorario, options: .reportProgress, range: dataLimiteRange)
        let valid = matchRange.location != NSNotFound
        return valid
    }
        

}
