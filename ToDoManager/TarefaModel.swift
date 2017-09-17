//
//  Tarefa.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 24/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

// import Foundation
// import CoreData
//
// public class Tarefa: NSManagedObject {
//
//     @NSManaged var dataCriacao: Date
//     @NSManaged var titulo: String
//     @NSManaged var descricao: String
//     @NSManaged var dataLimite: Date
//     @NSManaged var responsavel: String
//
//     convenience init(titulo: String, descricao: String, dataLimite: String, responsavel: String, entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
//         let entity = NSEntityDescription.entity(forEntityName: "Tarefa", in: context)!
//         self.init(entity: entity, insertInto: context)
//         let dateFormatter = DateFormatter()
//         dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//         dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
//         self.dataCriacao = Date()
//         self.titulo = titulo
//         self.descricao = descricao
//         self.dataLimite = dataLimite != "" ? dateFormatter.date(from: dataLimite)! : dataCriacao
//         self.responsavel = responsavel
//     }
//
//    var tarefa : Tarefa {
//        get {
//            return Tarefa(dataCriacao: self.dataCriacao, titulo: self.titulo, descricao: self.descricao, dataLimite: self.dataLimite, responsavel: self.responsavel)
//        }
//        set {
//            self.dataCriacao = Date()
//            self.titulo = newValue.titulo
//            self.descricao = newValue.descricao
//            self.dataLimite = newValue.dataLimite
//            self.responsavel = newValue.responsavel
//        }
//    }
// 
//    init(titulo: String, descricao: String, dataLimite: String, responsavel: String) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
//        self.dataCriacao = Date()
//        self.titulo = titulo
//        self.descricao = descricao
//        self.dataLimite = dataLimite != "" ? dateFormatter.date(from: dataLimite)! : dataCriacao
//        self.responsavel = responsavel
//    }
//
// }


//public struct Tarefa {
//    
//    public var dataCriacao: Date
//    public var titulo: String
//    public var descricao: String
//    public var dataLimite: Date
//    public var responsavel: String
//    
//    init(titulo: String, descricao: String, dataLimite: String, responsavel: String) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
//        self.dataCriacao = Date()
//        self.titulo = titulo
//        self.descricao = descricao
//        self.dataLimite = dataLimite != "" ? dateFormatter.date(from: dataLimite)! : dataCriacao
//        self.responsavel = responsavel
//    }
//    
//}
