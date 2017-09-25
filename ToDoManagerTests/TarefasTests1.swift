//
//  GerenciadorTarefasModelTests1.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 24/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

/*import XCTest
@testable import ToDoManager

class TarefasTests1: XCTestCase {

    var uuid: String! = ""
    var dateFormatter: DateFormatter!
    var uuid1: String! = ""
    var uuid2: String! = ""
    var uuid3: String! = ""
    var uuid4: String! = ""
    var uuid5: String! = ""
    var titulo1: String?
    var titulo2: String?
    var titulo3: String?
    var titulo4: String?
    var titulo5: String?
    var dataCriacao: NSDate?
    var dataLimite1: NSDate?
    var dataLimite2: NSDate?
    var dataLimite3: NSDate?
    var dataLimite4: NSDate?
    var dataLimite5: NSDate?
    var descricao1: String?
    var descricao2: String?
    var descricao3: String?
    var descricao4: String?
    var descricao5: String?
    var responsavel1: String?
    var responsavel2: String?
    var responsavel3: String?
    var responsavel4: String?
    var responsavel5: String?
    
    
    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        uuid1 = UUID().uuidString
        uuid2 = UUID().uuidString
        uuid3 = UUID().uuidString
        uuid4 = UUID().uuidString
        uuid5 = UUID().uuidString
        titulo1 = "Tarefa1"
        titulo2 = "Tarefa1"
        titulo3 = "Tarefa1"
        titulo4 = "Tarefa1"
        titulo5 = "Tarefa1"
        dataCriacao = NSDate()
        dataLimite1 = NSDate()
        dataLimite2 = NSDate()
        dataLimite3 = NSDate()
        dataLimite4 = NSDate()
        dataLimite5 = NSDate()
        descricao1 = "Tarefa 1 - Descrição"
        descricao2 = "Tarefa 2 - Descrição"
        descricao3 = "Tarefa 3 - Descrição"
        descricao4 = "Tarefa 4 - Descrição"
        descricao5 = "Tarefa 5 - Descrição"
        responsavel1 = "Leonardo"
        responsavel2 = "Carlos"
        responsavel3 = "Maria"
        responsavel4 = "Ronaldo"
        responsavel5 = "Maria"
    }
    
    override func tearDown() {
        super.tearDown()
        uuid1 = nil
        uuid2 = nil
        uuid3 = nil
        uuid4 = nil
        uuid5 = nil
        titulo1 = nil
        titulo2 = nil
        titulo3 = nil
        titulo4 = nil
        titulo5 = nil
        dataCriacao = nil
        dataLimite1 = nil
        dataLimite2 = nil
        dataLimite3 = nil
        dataLimite4 = nil
        dataLimite5 = nil
        descricao1 = nil
        descricao2 = nil
        descricao3 = nil
        descricao4 = nil
        descricao5 = nil
        responsavel1 = nil
        responsavel2 = nil
        responsavel3 = nil
        responsavel4 = nil
        responsavel5 = nil
    }

    func testGerenciadorTarefas() {
        //XCTAssertNotNil(gt)
    }
    
    func testAdicionarTarefa() {
        if let tempDataLimite = dateFormatter.date(from: "01/12/2017 23:55:00") {
            dataLimite1 = tempDataLimite as NSDate
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid1, dataCriacao: dataCriacao!, titulo: titulo1!, descricao: descricao1!, dataLimite: dataLimite1!, responsavel: responsavel1!)
        } else {
            print("Erro data limite 1")
        }
        if let tempDataLimite = dateFormatter.date(from: "22/12/2017 23:20:00") {
            dataLimite2 = tempDataLimite as NSDate
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid2, dataCriacao: dataCriacao!, titulo: titulo2!, descricao: descricao2!, dataLimite: dataLimite2!, responsavel: responsavel2!)
        } else {
            print("Erro data limite 2")
        }
        if let tempDataLimite = dateFormatter.date(from: "15/10/2017 23:00:00") {
            dataLimite3 = tempDataLimite as NSDate
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid3, dataCriacao: dataCriacao!, titulo: titulo3!, descricao: descricao3!, dataLimite: dataLimite3!, responsavel: responsavel3!)
        } else {
            print("Erro data limite 3")
        }
        if let tempDataLimite = dateFormatter.date(from: "31/08/2017 23:00:00") {
            dataLimite4 = tempDataLimite as NSDate
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid4, dataCriacao: dataCriacao!, titulo: titulo4!, descricao: descricao4!, dataLimite: dataLimite4!, responsavel: responsavel4!)
        } else {
            print("Erro data limite 4")
        }
        if let tempDataLimite = dateFormatter.date(from: "05/12/2017 23:00:00") {
            dataLimite5 = tempDataLimite as NSDate
            Tarefas.sharedInstance.adicionarTarefa(uuid: uuid5, dataCriacao: dataCriacao!, titulo: titulo5!, descricao: descricao5!, dataLimite: dataLimite5!, responsavel: responsavel5!)
        } else {
            print("Erro data limite 5")
        }
        
        XCTAssertEqual(Tarefas.sharedInstance.tarefas.count, 5)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].titulo, titulo1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].dataCriacao, dataCriacao)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].descricao, descricao1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].dataLimite, dataLimite1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].responsavel, responsavel1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[1].titulo, titulo2)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[1].dataCriacao, dataCriacao)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[1].descricao, descricao2)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[1].dataLimite, dataLimite2)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[1].responsavel, responsavel2)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[2].titulo, titulo3)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[2].dataCriacao, dataCriacao)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[2].descricao, descricao3)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[2].dataLimite, dataLimite3)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[2].responsavel, responsavel3)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[3].titulo, titulo4)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[3].dataCriacao, dataCriacao)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[3].descricao, descricao4)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[3].dataLimite, dataLimite4)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[3].responsavel, responsavel4)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[4].titulo, titulo5)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[4].dataCriacao, dataCriacao)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[4].descricao, descricao5)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[4].dataLimite, dataLimite5)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[4].responsavel, responsavel5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

*/
