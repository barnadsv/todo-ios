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
    
    /**
     Retorna todas as tarefas
    */
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
        
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja data de criação contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDataCriacao(termo: String) -> [Tarefa] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        return tarefas.filter {
            let strDataCriacao = dateFormatter.string(from: $0.dataCriacao as! Date)
            return strDataCriacao.range(of: termo) != nil
        }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cujo título contem o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByTitulo(termo: String) -> [Tarefa] {
        return tarefas.filter { return $0.titulo!.range(of: termo) != nil }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja descrição contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDescricao(termo: String) -> [Tarefa] {
        return tarefas.filter({ (tarefa: Tarefa) -> Bool in return tarefa.descricao!.range(of: termo) != nil })
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja data limite contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDataLimite(termo: String) -> [Tarefa] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        return tarefas.filter {
            let strDataLimite = dateFormatter.string(from: $0.dataLimite! as Date)
            return strDataLimite.range(of: termo) != nil
        }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja responsável contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByResponsavel(termo: String) -> [Tarefa] {
        return tarefas.filter { return $0.responsavel!.range(of: termo) != nil }
    }
    
    
    /**
     Ordena as tarefas do Gerenciador de Tarefas pela data limite
     - parameter termo: Termo de busca fornecido
     */
    func orderByDataLimite() -> [Tarefa] {
        return tarefas.sorted(by: { $0.dataLimite?.compare($1.dataLimite! as Date) == ComparisonResult.orderedAscending})
    }
}
