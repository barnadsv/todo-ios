//
//  GerenciadorTarefasModelTests2.swift
//  ToDoManager
//
//  Created by Leonardo de Araujo Barnabe on 25/08/17.
//  Copyright © 2017 Leonardo Barnabe. All rights reserved.
//

/*
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
class TarefasTests2: XCTestCase {

    var uuid1: String! = ""
    var uuid2: String! = ""
    var uuid3: String! = ""
    var uuid4: String! = ""
    var uuid5: String! = ""
    var dateFormatter: DateFormatter!
    var strDataCriacao: String!
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
        titulo2 = "Tarefa2"
        titulo3 = "Tarefa3"
        titulo4 = "Tarefa4"
        titulo5 = "Tarefa5"
        dataCriacao = NSDate()
        strDataCriacao = dateFormatter.string(from: dataCriacao! as Date)
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
    
    /*func testValidaDataHorario() {
        XCTAssertTrue(gt.validaDataHorario(dataHorario: "31/05/2017 00:00:00"))
        XCTAssertFalse(gt.validaDataHorario(dataHorario: "32/05/2017 00:00:00"))
        XCTAssertFalse(gt.validaDataHorario(dataHorario: "31/13/2017 00:00:00"))
        XCTAssertFalse(gt.validaDataHorario(dataHorario: "31/05/2017 25:00:00"))
        XCTAssertFalse(gt.validaDataHorario(dataHorario: "31/05/2017 00:60:00"))
        XCTAssertFalse(gt.validaDataHorario(dataHorario: "31/05/2017 00:00:60"))
    }*/
    
    func testAtualizarTarefa() {
        titulo1 = "Tarefa1.1"
        descricao1 = "Tarefa 1.1 - Descrição"
        responsavel1 = "Pedro"
        if let tempDataLimite = dateFormatter.date(from: "02/12/2017 22:00:00") {
            dataLimite1 = tempDataLimite as NSDate
            Tarefas.sharedInstance.atualizaTarefa(uuid: uuid1, titulo: titulo1!, descricao: descricao1!, dataLimite: dataLimite1!, responsavel: responsavel1!)
        } else {
            print("Erro data limite 1.1")
        }
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].titulo, titulo1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].descricao, descricao1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].dataLimite, dataLimite1)
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].responsavel, responsavel1)
        
        // Titulo vazio
        titulo1 = ""
        if let tempDataLimite = dateFormatter.date(from: "02/12/2017 22:00:00") {
            dataLimite1 = tempDataLimite as NSDate
            Tarefas.sharedInstance.atualizaTarefa(uuid: uuid1, titulo: titulo1!, descricao: descricao1!, dataLimite: dataLimite1!, responsavel: responsavel1!)
        } else {
            print("Erro data limite 1.1")
        }
        XCTAssertEqual(Tarefas.sharedInstance.tarefas[0].titulo, "Tarefa1.1")
    }

    /*func testListarTarefas() {
        let todasTarefas = Tarefas.sharedInstance.tarefas
        var resultado = "Tarefa 1 - Data de criação: " + strDataCriacao + " - Título: Tarefa1 - Descrição: Tarefa 1 - Descrição - Data limite: 01/12/2017 23:55:00 - Responsável: Leonardo \n"
        resultado += "Tarefa 2 - Data de criação: " + strDataCriacao + " - Título: Tarefa2 - Descrição: Tarefa 2 - Descrição - Data limite: 22/12/2017 23:20:00 - Responsável: Carlos \n"
        resultado += "Tarefa 3 - Data de criação: " + strDataCriacao + " - Título: Tarefa3 - Descrição: Tarefa 3 - Descrição - Data limite: 15/10/2017 23:00:00 - Responsável: Maria \n"
        resultado += "Tarefa 4 - Data de criação: " + strDataCriacao + " - Título: Tarefa4 - Descrição: Tarefa 4 - Descrição - Data limite: 31/08/2017 23:00:00 - Responsável: Ronaldo \n"
        resultado += "Tarefa 5 - Data de criação: " + strDataCriacao + " - Título: Tarefa5 - Descrição: Tarefa 5 - Descrição - Data limite: 05/12/2017 23:00:00 - Responsável: Maria \n"
        XCTAssertEqual(resultado, todasTarefas)
    }*/

    func testFindTarefasByDataCriacao() {
        let dataCriacao = Date()
        let strDataCriacao = dateFormatter.string(from: dataCriacao)
        let range = strDataCriacao.index(strDataCriacao.startIndex, offsetBy: 16)
        let strDataCriacaoTermo = String (strDataCriacao[range])
        let listaFiltrada = Tarefas.sharedInstance.findTarefasByDataCriacao(termo: strDataCriacaoTermo)
        for tarefa in listaFiltrada {
            XCTAssertEqual(dateFormatter.string(from: tarefa.dataCriacao! as Date), strDataCriacao)
        }
    }

    func testFindTarefasByTitulo() {
        let listaFiltrada = Tarefas.sharedInstance.findTarefasByTitulo(termo: "3")
        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa3")
    }

    func testFindTarefasByDescricao() {
        let listaFiltrada = Tarefas.sharedInstance.findTarefasByDescricao(termo: "5")
        XCTAssertEqual(listaFiltrada[0].titulo, "Tarefa5")
    }

    func testFindTarefasByDataLimite() {
        let strDataLimiteTermo = "12/2017"
        let listaFiltrada = Tarefas.sharedInstance.findTarefasByDataLimite(termo: strDataLimiteTermo)
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[0].dataLimite! as Date), "01/12/2017 23:55:00")
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[1].dataLimite! as Date), "22/12/2017 23:20:00")
        XCTAssertEqual(dateFormatter.string(from: listaFiltrada[2].dataLimite! as Date), "05/12/2017 23:00:00")
    }

    func testFindTarefasByResponsavel() {
        let listaFiltrada = Tarefas.sharedInstance.findTarefasByResponsavel(termo: "Maria")
        XCTAssertEqual(listaFiltrada[0].responsavel, "Maria")
        XCTAssertEqual(listaFiltrada[1].responsavel, "Maria")
    }

    func testOrderByDataLimite() {
        let listaOrdenada = Tarefas.sharedInstance.orderByDataLimite()
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[0].dataLimite! as Date), "31/08/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[1].dataLimite! as Date), "15/10/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[2].dataLimite! as Date), "01/12/2017 23:55:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[3].dataLimite! as Date), "05/12/2017 23:00:00")
        XCTAssertEqual(dateFormatter.string(from: listaOrdenada[4].dataLimite! as Date), "22/12/2017 23:20:00")
    }

}

*/
