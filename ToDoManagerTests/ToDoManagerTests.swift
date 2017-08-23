//
//  ToDoManagerTests.swift
//  ToDoManagerTests
//
//  Created by Leonardo Barnabe on 16/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import XCTest
@testable import ToDoManager

class ToDoManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

/**
 Classe para testar a criação de uma instância do Gerenciador de Tarefas e a função adicionarTarefa.
 */
//class GerenciadorTarefasTest1: XCTestCase {
//    
//    var gt: GerenciadorTarefas!
//    var t1, t2, t3, t4, t5: Tarefa!
//    var dateFormatter: DateFormatter!
//    
//    override func setUp() {
//        super.setUp()
//        dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
//        gt = GerenciadorTarefas()
//        t1 = Tarefa(titulo: "Tarefa1", descricao: "Tarefa 1 - Descrição", dataLimite: "01/12/2017 23:55:00", responsavel: "Leonardo")
//        t2 = Tarefa(titulo: "Tarefa2", descricao: "Tarefa 2 - Descrição", dataLimite: "22/12/2017 23:20:00", responsavel: "Carlos")
//        t3 = Tarefa(titulo: "Tarefa3", descricao: "Tarefa 3 - Descrição", dataLimite: "15/10/2017 23:00:00", responsavel: "Maria")
//        t4 = Tarefa(titulo: "Tarefa4", descricao: "Tarefa 4 - Descrição", dataLimite: "31/08/2017 23:00:00", responsavel: "Ronaldo")
//        t5 = Tarefa(titulo: "Tarefa5", descricao: "Tarefa 5 - Descrição", dataLimite: "05/12/2017 23:00:00", responsavel: "Maria")
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        gt = nil
//        t1 = nil
//        t2 = nil
//        t3 = nil
//        t4 = nil
//        t5 = nil
//    }
//    
//    func testGerenciadorTarefas() {
//        XCTAssertNotNil(gt)
//    }
//    
//    func testAdicionarTarefa() {
//        gt.adicionarTarefa(tarefa: t1)
//        gt.adicionarTarefa(tarefa: t2)
//        gt.adicionarTarefa(tarefa: t3)
//        gt.adicionarTarefa(tarefa: t4)
//        gt.adicionarTarefa(tarefa: t5)
//        gt.adicionarTarefa(tarefa: nil)
//        XCTAssertEqual(gt.listaTarefas.count, 5)
//        XCTAssertEqual(gt.listaTarefas[0].titulo, t1.titulo)
//        XCTAssertEqual(gt.listaTarefas[0].dataCriacao, t1.dataCriacao)
//        XCTAssertEqual(gt.listaTarefas[0].descricao, t1.descricao)
//        XCTAssertEqual(gt.listaTarefas[0].dataLimite, t1.dataLimite)
//        XCTAssertEqual(gt.listaTarefas[0].responsavel, t1.responsavel)
//        XCTAssertEqual(gt.listaTarefas[1].titulo, t2.titulo)
//        XCTAssertEqual(gt.listaTarefas[1].dataCriacao, t2.dataCriacao)
//        XCTAssertEqual(gt.listaTarefas[1].descricao, t2.descricao)
//        XCTAssertEqual(gt.listaTarefas[1].dataLimite, t2.dataLimite)
//        XCTAssertEqual(gt.listaTarefas[1].responsavel, t2.responsavel)
//        XCTAssertEqual(gt.listaTarefas[2].titulo, t3.titulo)
//        XCTAssertEqual(gt.listaTarefas[2].dataCriacao, t3.dataCriacao)
//        XCTAssertEqual(gt.listaTarefas[2].descricao, t3.descricao)
//        XCTAssertEqual(gt.listaTarefas[2].dataLimite, t3.dataLimite)
//        XCTAssertEqual(gt.listaTarefas[2].responsavel, t3.responsavel)
//        XCTAssertEqual(gt.listaTarefas[3].titulo, t4.titulo)
//        XCTAssertEqual(gt.listaTarefas[3].dataCriacao, t4.dataCriacao)
//        XCTAssertEqual(gt.listaTarefas[3].descricao, t4.descricao)
//        XCTAssertEqual(gt.listaTarefas[3].dataLimite, t4.dataLimite)
//        XCTAssertEqual(gt.listaTarefas[3].responsavel, t4.responsavel)
//        XCTAssertEqual(gt.listaTarefas[4].titulo, t5.titulo)
//        XCTAssertEqual(gt.listaTarefas[4].dataCriacao, t5.dataCriacao)
//        XCTAssertEqual(gt.listaTarefas[4].descricao, t5.descricao)
//        XCTAssertEqual(gt.listaTarefas[4].dataLimite, t5.dataLimite)
//        XCTAssertEqual(gt.listaTarefas[4].responsavel, t5.responsavel)
//    }
//    
//}
//
///**
// Classe para testar as seguintes funções:
// - listarTarefas;
// - findTarefasByDataCriacao;
// - findTarefasByTitulo;
// - findTarefasByDescricao;
// - findTarefasByDataLimite;
// - findTarefasByResponsavel.
// */
//class GerenciadorTarefasTest2: XCTestCase {
//    
//    var gt: GerenciadorTarefas!
//    var t1, t2, t3, t4, t5: Tarefa!
//    var dateFormatter: DateFormatter!
//    var dataCriacao: Date!
//    var strDataCriacao: String!
//    
//    override func setUp() {
//        super.setUp()
//        dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
//        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
//        dataCriacao = Date()
//        strDataCriacao = dateFormatter.string(from: dataCriacao)
//        gt = GerenciadorTarefas()
//        t1 = Tarefa(titulo: "Tarefa1", descricao: "Tarefa 1 - Descrição", dataLimite: "01/12/2017 23:55:00", responsavel: "Leonardo")
//        t2 = Tarefa(titulo: "Tarefa2", descricao: "Tarefa 2 - Descrição", dataLimite: "22/12/2017 23:20:00", responsavel: "Carlos")
//        t3 = Tarefa(titulo: "Tarefa3", descricao: "Tarefa 3 - Descrição", dataLimite: "15/10/2017 23:00:00", responsavel: "Maria")
//        t4 = Tarefa(titulo: "Tarefa4", descricao: "Tarefa 4 - Descrição", dataLimite: "31/08/2017 23:00:00", responsavel: "Ronaldo")
//        t5 = Tarefa(titulo: "Tarefa5", descricao: "Tarefa 5 - Descrição", dataLimite: "05/12/2017 23:00:00", responsavel: "Maria")
//        gt.adicionarTarefa(tarefa: t1)
//        gt.adicionarTarefa(tarefa: t2)
//        gt.adicionarTarefa(tarefa: t3)
//        gt.adicionarTarefa(tarefa: t4)
//        gt.adicionarTarefa(tarefa: t5)
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        dateFormatter = nil
//        gt = nil
//        t1 = nil
//        t2 = nil
//        t3 = nil
//        t4 = nil
//        t5 = nil
//    }
//    
//    func testListarTarefas() {
//        let todasTarefas = gt.listarTarefas()
//        var resultado = "Tarefa 1 - Data de criação: " + strDataCriacao + " - Título: Tarefa1 - Descrição: Tarefa 1 - Descrição - Data limite: 01/12/2017 23:55:00 - Responsável: Leonardo \n"
//        resultado += "Tarefa 2 - Data de criação: " + strDataCriacao + " - Título: Tarefa2 - Descrição: Tarefa 2 - Descrição - Data limite: 22/12/2017 23:20:00 - Responsável: Carlos \n"
//        resultado += "Tarefa 3 - Data de criação: " + strDataCriacao + " - Título: Tarefa3 - Descrição: Tarefa 3 - Descrição - Data limite: 15/10/2017 23:00:00 - Responsável: Maria \n"
//        resultado += "Tarefa 4 - Data de criação: " + strDataCriacao + " - Título: Tarefa4 - Descrição: Tarefa 4 - Descrição - Data limite: 31/08/2017 23:00:00 - Responsável: Ronaldo \n"
//        resultado += "Tarefa 5 - Data de criação: " + strDataCriacao + " - Título: Tarefa5 - Descrição: Tarefa 5 - Descrição - Data limite: 05/12/2017 23:00:00 - Responsável: Maria \n"
//        XCTAssertEqual(resultado, todasTarefas)
//    }
//    
//    func testFindTarefasByDataCriacao() {
//        let dataCriacao = Date()
//        let strDataCriacao = dateFormatter.string(from: dataCriacao)
//        let range = strDataCriacao.index(strDataCriacao.startIndex, offsetBy: 16)
//        let strDataCriacaoTermo = String (strDataCriacao[range])
//        let listaFiltrada = gt.findTarefasByDataCriacao(termo: strDataCriacaoTermo)
//        for tarefa in listaFiltrada {
//            XCTAssertEqual(dateFormatter.string(from: tarefa.dataCriacao), strDataCriacao)
//        }
//    }
//    
//    func testFindTarefasByTitulo() {
//        let listaFiltrada = gt.findTarefasByTitulo(termo: "3")
//        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa3")
//    }
//    
//    func testFindTarefasByDescricao() {
//        let listaFiltrada = gt.findTarefasByDescricao(termo: "5")
//        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa5")
//    }
//    
//    func testFindTarefasByDataLimite() {
//        let strDataLimiteTermo = "12/2017"
//        let listaFiltrada = gt.findTarefasByDataLimite(termo: strDataLimiteTermo)
//        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[0].dataLimite), "01/12/2017 23:55:00")
//        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[1].dataLimite), "22/12/2017 23:20:00")
//        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[2].dataLimite), "05/12/2017 23:00:00")
//    }
//    
//    func testFindTarefasByResponsavel() {
//        let listaFiltrada = gt.findTarefasByResponsavel(termo: "Maria")
//        XCTAssertEqual(listaFiltrada[0].responsavel, "Maria")
//        XCTAssertEqual(listaFiltrada[1].responsavel, "Maria")
//    }
//    
//    func testOrderByDataLimite() {
//        let listaOrdenada = gt.orderByDataLimite()
//        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[0].dataLimite), "31/08/2017 23:00:00")
//        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[1].dataLimite), "15/10/2017 23:00:00")
//        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[2].dataLimite), "01/12/2017 23:55:00")
//        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[3].dataLimite), "05/12/2017 23:00:00")
//        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[4].dataLimite), "22/12/2017 23:20:00")
//    }
//    
//}

// Executando todos os testes
//GerenciadorTarefasTest1.defaultTestSuite().run()
//GerenciadorTarefasTest2.defaultTestSuite().run()

