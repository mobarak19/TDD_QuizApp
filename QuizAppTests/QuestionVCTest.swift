//
//  QuestionVCTest.swift
//  QuizAppTests
//
//  Created by Mobarak Hossen on 9/10/22.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionVCTest:XCTestCase{
   
    func test_viewDidLoad_render_with_question_header_text(){
        let sut = QuestionVC(question:"Q1",option: [])
        _ = sut.view
        XCTAssertEqual(sut.headerLable.text, "Q1")
    }
    func test_viewDidLoad_with_no_option_render_zero_option(){
        let sut = QuestionVC(question:"Q1",option: [])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0),0)
    }
    
    func test_viewDidLoad_with_one_option_render_one_option(){
        let sut = QuestionVC(question:"Q1",option: ["A1"])
        _ = sut.view
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0),1)
    }
    func test_viewDidLoad_with_one_option_render_one_option_text(){
        let sut = QuestionVC(question:"Q1",option: ["A1"])
        _ = sut.view
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text,"A1")
    }
}
