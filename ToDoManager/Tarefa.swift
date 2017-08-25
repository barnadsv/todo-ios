//
//  Tarefa.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 24/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import Foundation

public struct Tarefa {
    
    public var dataCriacao: Date
    public var titulo: String
    public var descricao: String
    public var dataLimite: Date
    public var responsavel: String
    
    init(titulo: String, descricao: String, dataLimite: String, responsavel: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        self.dataCriacao = Date()
        self.titulo = titulo
        self.descricao = descricao
        self.dataLimite = dataLimite != "" ? dateFormatter.date(from: dataLimite)! : dataCriacao
        self.responsavel = responsavel
    }
    
}
