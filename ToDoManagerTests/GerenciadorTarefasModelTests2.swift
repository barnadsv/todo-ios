//
//  GerenciadorTarefasModelTests2.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 25/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

import XCTest
@testable import ToDoManager

/**
 Classe para testar as seguintes funções:
 - listarTarefas;
 - findTarefasByDataCriacao;
 - findTarefasByTitulo;
 - findTarefasByDescricao;
 - findTarefasByDataLimite;
 - findTarefasByResponsavel.
*/
class GerenciadorTarefasModelFunctionsTests: XCTestCase {

    var gt: GerenciadorTarefasModel!
    var t1, t2, t3, t4, t5: Tarefa!
    var dateFormatter: DateFormatter!
    var dataCriacao: Date!
    var strDataCriacao: String!

    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "BRST")
        dataCriacao = Date()
        strDataCriacao = dateFormatter.string(from: dataCriacao)
        gt = GerenciadorTarefasModel()
        t1 = Tarefa(titulo: "Tarefa1", descricao: "Tarefa 1 - Descrição", dataLimite: "01/12/2017 23:55:00", responsavel: "Leonardo")
        t2 = Tarefa(titulo: "Tarefa2", descricao: "Tarefa 2 - Descrição", dataLimite: "22/12/2017 23:20:00", responsavel: "Carlos")
        t3 = Tarefa(titulo: "Tarefa3", descricao: "Tarefa 3 - Descrição", dataLimite: "15/10/2017 23:00:00", responsavel: "Maria")
        t4 = Tarefa(titulo: "Tarefa4", descricao: "Tarefa 4 - Descrição", dataLimite: "31/08/2017 23:00:00", responsavel: "Ronaldo")
        t5 = Tarefa(titulo: "Tarefa5", descricao: "Tarefa 5 - Descrição", dataLimite: "05/12/2017 23:00:00", responsavel: "Maria")
        gt.adicionarTarefa(tarefa: t1)
        gt.adicionarTarefa(tarefa: t2)
        gt.adicionarTarefa(tarefa: t3)
        gt.adicionarTarefa(tarefa: t4)
        gt.adicionarTarefa(tarefa: t5)
    }

    override func tearDown() {
        super.tearDown()
        dateFormatter = nil
        gt = nil
        t1 = nil
        t2 = nil
        t3 = nil
        t4 = nil
        t5 = nil
    }
    
    func testSalvarTarefa() {
        t1.titulo = "Tarefa1.1"
        t1.descricao = "Tarefa 1.1 - Descrição"
        t1.dataLimite = dateFormatter.date(from: "02/12/2017 22:00:00")!
        t1.responsavel = "Pedro"
        gt.salvarTarefa(tarefa: t1, indice: 0)
        XCTAssertEqual(gt.listaTarefas[0].titulo, t1.titulo)
        XCTAssertEqual(gt.listaTarefas[0].descricao, t1.descricao)
        XCTAssertEqual(gt.listaTarefas[0].dataLimite, t1.dataLimite)
        XCTAssertEqual(gt.listaTarefas[0].responsavel, t1.responsavel)
        
        t1.titulo = ""
        gt.salvarTarefa(tarefa: t1, indice: 0)
        XCTAssertEqual(gt.listaTarefas[0].titulo, "Tarefa1.1")
    }

    func testListarTarefas() {
        let todasTarefas = gt.listarTarefas()
        var resultado = "Tarefa 1 - Data de criação: " + strDataCriacao + " - Título: Tarefa1 - Descrição: Tarefa 1 - Descrição - Data limite: 01/12/2017 23:55:00 - Responsável: Leonardo \n"
        resultado += "Tarefa 2 - Data de criação: " + strDataCriacao + " - Título: Tarefa2 - Descrição: Tarefa 2 - Descrição - Data limite: 22/12/2017 23:20:00 - Responsável: Carlos \n"
        resultado += "Tarefa 3 - Data de criação: " + strDataCriacao + " - Título: Tarefa3 - Descrição: Tarefa 3 - Descrição - Data limite: 15/10/2017 23:00:00 - Responsável: Maria \n"
        resultado += "Tarefa 4 - Data de criação: " + strDataCriacao + " - Título: Tarefa4 - Descrição: Tarefa 4 - Descrição - Data limite: 31/08/2017 23:00:00 - Responsável: Ronaldo \n"
        resultado += "Tarefa 5 - Data de criação: " + strDataCriacao + " - Título: Tarefa5 - Descrição: Tarefa 5 - Descrição - Data limite: 05/12/2017 23:00:00 - Responsável: Maria \n"
        XCTAssertEqual(resultado, todasTarefas)
    }

    func testFindTarefasByDataCriacao() {
        let dataCriacao = Date()
        let strDataCriacao = dateFormatter.string(from: dataCriacao)
        let range = strDataCriacao.index(strDataCriacao.startIndex, offsetBy: 16)
        let strDataCriacaoTermo = String (strDataCriacao[range])
        let listaFiltrada = gt.findTarefasByDataCriacao(termo: strDataCriacaoTermo)
        for tarefa in listaFiltrada {
            XCTAssertEqual(dateFormatter.string(from: tarefa.dataCriacao), strDataCriacao)
        }
    }

    func testFindTarefasByTitulo() {
        let listaFiltrada = gt.findTarefasByTitulo(termo: "3")
        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa3")
    }

    func testFindTarefasByDescricao() {
        let listaFiltrada = gt.findTarefasByDescricao(termo: "5")
        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa5")
    }

    func testFindTarefasByDataLimite() {
        let strDataLimiteTermo = "12/2017"
        let listaFiltrada = gt.findTarefasByDataLimite(termo: strDataLimiteTermo)
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[0].dataLimite), "01/12/2017 23:55:00")
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[1].dataLimite), "22/12/2017 23:20:00")
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[2].dataLimite), "05/12/2017 23:00:00")
    }

    func testFindTarefasByResponsavel() {
        let listaFiltrada = gt.findTarefasByResponsavel(termo: "Maria")
        XCTAssertEqual(listaFiltrada[0].responsavel, "Maria")
        XCTAssertEqual(listaFiltrada[1].responsavel, "Maria")
    }

    func testOrderByDataLimite() {
        let listaOrdenada = gt.orderByDataLimite()
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[0].dataLimite), "31/08/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[1].dataLimite), "15/10/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[2].dataLimite), "01/12/2017 23:55:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[3].dataLimite), "05/12/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[4].dataLimite), "22/12/2017 23:20:00")
    }

}


