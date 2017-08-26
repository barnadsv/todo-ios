//
//  GerenciadorTarefasModelTests1.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 24/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import XCTest
@testable import ToDoManager

class GerenciadorTarefasConstructorTests: XCTestCase {

    var gt: GerenciadorTarefasModel!
    var t1, t2, t3, t4, t5, t6: Tarefa!
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        gt = GerenciadorTarefasModel()
        t1 = Tarefa(titulo: "Tarefa1", descricao: "Tarefa 1 - Descrição", dataLimite: "01/12/2017 23:55:00", responsavel: "Leonardo")
        t2 = Tarefa(titulo: "Tarefa2", descricao: "Tarefa 2 - Descrição", dataLimite: "22/12/2017 23:20:00", responsavel: "Carlos")
        t3 = Tarefa(titulo: "Tarefa3", descricao: "Tarefa 3 - Descrição", dataLimite: "15/10/2017 23:00:00", responsavel: "Maria")
        t4 = Tarefa(titulo: "Tarefa4", descricao: "Tarefa 4 - Descrição", dataLimite: "31/08/2017 23:00:00", responsavel: "Ronaldo")
        t5 = Tarefa(titulo: "Tarefa5", descricao: "Tarefa 5 - Descrição", dataLimite: "05/12/2017 23:00:00", responsavel: "Maria")
        t6 = Tarefa(titulo: "", descricao: "Tarefa 5 - Descrição", dataLimite: "05/12/2017 23:00:00", responsavel: "Maria")
    }
    
    override func tearDown() {
        super.tearDown()
        gt = nil
        t1 = nil
        t2 = nil
        t3 = nil
        t4 = nil
        t5 = nil
        t6 = nil
    }

    func testGerenciadorTarefas() {
        XCTAssertNotNil(gt)
    }
    
    func testAdicionarTarefa() {
        gt.adicionarTarefa(tarefa: t1)
        gt.adicionarTarefa(tarefa: t2)
        gt.adicionarTarefa(tarefa: t3)
        gt.adicionarTarefa(tarefa: t4)
        gt.adicionarTarefa(tarefa: t5)
        XCTAssertEqual(gt.listaTarefas.count, 5)
        XCTAssertEqual(gt.listaTarefas[0].titulo, t1.titulo)
        XCTAssertEqual(gt.listaTarefas[0].dataCriacao, t1.dataCriacao)
        XCTAssertEqual(gt.listaTarefas[0].descricao, t1.descricao)
        XCTAssertEqual(gt.listaTarefas[0].dataLimite, t1.dataLimite)
        XCTAssertEqual(gt.listaTarefas[0].responsavel, t1.responsavel)
        XCTAssertEqual(gt.listaTarefas[1].titulo, t2.titulo)
        XCTAssertEqual(gt.listaTarefas[1].dataCriacao, t2.dataCriacao)
        XCTAssertEqual(gt.listaTarefas[1].descricao, t2.descricao)
        XCTAssertEqual(gt.listaTarefas[1].dataLimite, t2.dataLimite)
        XCTAssertEqual(gt.listaTarefas[1].responsavel, t2.responsavel)
        XCTAssertEqual(gt.listaTarefas[2].titulo, t3.titulo)
        XCTAssertEqual(gt.listaTarefas[2].dataCriacao, t3.dataCriacao)
        XCTAssertEqual(gt.listaTarefas[2].descricao, t3.descricao)
        XCTAssertEqual(gt.listaTarefas[2].dataLimite, t3.dataLimite)
        XCTAssertEqual(gt.listaTarefas[2].responsavel, t3.responsavel)
        XCTAssertEqual(gt.listaTarefas[3].titulo, t4.titulo)
        XCTAssertEqual(gt.listaTarefas[3].dataCriacao, t4.dataCriacao)
        XCTAssertEqual(gt.listaTarefas[3].descricao, t4.descricao)
        XCTAssertEqual(gt.listaTarefas[3].dataLimite, t4.dataLimite)
        XCTAssertEqual(gt.listaTarefas[3].responsavel, t4.responsavel)
        XCTAssertEqual(gt.listaTarefas[4].titulo, t5.titulo)
        XCTAssertEqual(gt.listaTarefas[4].dataCriacao, t5.dataCriacao)
        XCTAssertEqual(gt.listaTarefas[4].descricao, t5.descricao)
        XCTAssertEqual(gt.listaTarefas[4].dataLimite, t5.dataLimite)
        XCTAssertEqual(gt.listaTarefas[4].responsavel, t5.responsavel)
        gt.adicionarTarefa(tarefa: t6)
        XCTAssert(gt.retornaTarefasCount() == 5)
        gt.adicionarTarefa(tarefa: nil)
        XCTAssert(gt.retornaTarefasCount() == 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


