//
//  Tarefa+CoreDataProperties.swift
//  
//
//  Created by Leonardo de Araujo Barnabe on 16/09/17.
//
//

import Foundation
import CoreData


extension Tarefa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tarefa> {
        return NSFetchRequest<Tarefa>(entityName: "Tarefa")
    }

    @NSManaged public var dataCriacao: NSDate?
    @NSManaged public var dataLimite: NSDate?
    @NSManaged public var descricao: String?
    @NSManaged public var responsavel: String?
    @NSManaged public var titulo: String?
    @NSManaged public var uuid: String?

}
