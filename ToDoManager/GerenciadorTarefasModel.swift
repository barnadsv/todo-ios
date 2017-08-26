//
//  GerenciadorTarefasModel.swift
//  ToDoManager
//
//  Created by Leonardo Barnabe on 19/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import Foundation

// Gerenciador de Tarefas

import UIKit

/**
 Gerenciador de Tarefas
 Permite adicionar tarefas, buscar tarefas pela data de criação, pelo título, pela descrição, pela data limite e pelo responsável.
 */
public class GerenciadorTarefasModel {
    
    var listaTarefas = [Tarefa]()
    
    /**
     Adiciona tarefa ao Gerenciador de Tarefas
     - parameter tarefa: Tarefa a ser adicionada
     */
    func adicionarTarefa(tarefa: Tarefa!) {
        if (tarefa != nil && tarefa.titulo != "") {
            self.listaTarefas.append(tarefa)
        }
    }

    /**
     Retorna o total de tarefas
    */
    func retornaTarefasCount() -> Int {
        return self.listaTarefas.count
    }

    /**
     Salva tarefa em uma determinada posição da lista de tarefas
    */
    func salvarTarefa(tarefa: Tarefa!, indice: Int) {
        if (tarefa != nil && tarefa.titulo != "") {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
            self.listaTarefas[indice].titulo = tarefa.titulo
            self.listaTarefas[indice].descricao = tarefa.descricao
            self.listaTarefas[indice].dataLimite = tarefa.dataLimite
            self.listaTarefas[indice].responsavel = tarefa.responsavel
        }
    }
    
    /**
     Lista todas as tarefas que estão no Gerenciador de Tarefas
     */
    func listarTarefas() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        var description = ""
        var cont: Int = 1
        for tarefa in self.listaTarefas {
            let strDataLimite = dateFormatter.string(from: tarefa.dataLimite)
            let strDataCriacao = dateFormatter.string(from: tarefa.dataCriacao)
            description += "Tarefa \(cont) - Data de criação: \(strDataCriacao) - Título: \(tarefa.titulo) - Descrição: \(tarefa.descricao) - Data limite: \(strDataLimite) - Responsável: \(tarefa.responsavel) \n"
            cont += 1
        }
        return description
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja data de criação contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDataCriacao(termo: String) -> [Tarefa] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        return listaTarefas.filter {
            let strDataCriacao = dateFormatter.string(from: $0.dataCriacao)
            return strDataCriacao.range(of: termo) != nil
        }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cujo título contem o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByTitulo(termo: String) -> [Tarefa] {
        return listaTarefas.filter { return $0.titulo.range(of: termo) != nil }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja descrição contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDescricao(termo: String) -> [Tarefa] {
        return listaTarefas.filter({ (tarefa: Tarefa) -> Bool in return tarefa.descricao.range(of: termo) != nil })
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja data limite contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByDataLimite(termo: String) -> [Tarefa] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        return listaTarefas.filter {
            let strDataLimite = dateFormatter.string(from: $0.dataLimite)
            return strDataLimite.range(of: termo) != nil
        }
    }
    
    /**
     Retorna todas as tarefas do Gerenciador de Tarefas cuja responsável contém o termo de busca fornecido
     - parameter termo: Termo de busca fornecido
     */
    func findTarefasByResponsavel(termo: String) -> [Tarefa] {
        return listaTarefas.filter { return $0.responsavel.range(of: termo) != nil }
    }
    
    
    /**
     Ordena as tarefas do Gerenciador de Tarefas pela data limite
     - parameter termo: Termo de busca fornecido
     */
    func orderByDataLimite() -> [Tarefa] {
        return listaTarefas.sorted(by: { $0.dataLimite < $1.dataLimite })
    }
}




