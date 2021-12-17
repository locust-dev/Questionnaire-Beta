//
//  TestResultViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestResultViewInput: Loadable, Errorable {
    func update(with viewModel: TestResultViewModel)
}

final class TestResultViewController: UIViewController {
	
    // MARK: - Pproperties
    
	var presenter: TestResultViewOutput?
    var tableViewManager: TestResultTableViewManagerInput?
    
    private let percentOfRightAnswers = UILabel()
    private let quitButton = UIButton()
    private let questionsWithMistakes = UILabel()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }

    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        view.backgroundColor = .blue
        
        quitButton.addTarget(self, action: #selector(finishTest), for: .touchUpInside)
        
        percentOfRightAnswers.font = .systemFont(ofSize: 40)
        
        view.addSubview(percentOfRightAnswers)
        view.addSubview(quitButton)
        view.addSubview(questionsWithMistakes)
        
        questionsWithMistakes.autoPinEdge(.top, to: .bottom, of: percentOfRightAnswers, withOffset: 50)
        questionsWithMistakes.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        questionsWithMistakes.autoPinEdge(.right, to: .right, of: view, withOffset: 20)
        
        quitButton.autoPinEdge(.top, to: .bottom, of: questionsWithMistakes)
        quitButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20),
                                                excludingEdge: .top)
        
        percentOfRightAnswers.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20),
                                                           excludingEdge: .bottom)
    }
    
    
    // MARK: - Public methods
    
    func didTapErrorPlaceholderOkButton() {
        presenter?.didTapOkErrorButton()
    }
    
    
    // MARK: - Actions
    
    @objc private func finishTest() {
        presenter?.didTapFinishButton()
    }
    
}


// MARK: - TestResultViewInput
extension TestResultViewController: TestResultViewInput {
    
    func update(with viewModel: TestResultViewModel) {
        
        percentOfRightAnswers.text = viewModel.percentage
        questionsWithMistakes.text = "You made mistakes in questions: \(viewModel.questionsWithMistakes)"
        quitButton.setTitle(viewModel.quitButtonTitle, for: .normal)
    }
}
