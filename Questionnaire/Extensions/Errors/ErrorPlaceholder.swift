//
//  ErrorPlaceholder.swift
//  Questionnaire
//
//  Created by Ilya Turin on 16.12.2021.
//

import UIKit

protocol ErrorPlaceholderDelegate: AnyObject {
    func didTapErrorPlaceholderOkButton()
}

final class ErrorPlaceholder: NLView, Delegatable {
    
    // MARK: - Properties
    
    weak var delegate: AnyObject?
    
    private let error: ErrorModel
    private let titleLabel = UILabel()
    private let okButton = UIButton()
    
    
    // MARK: - Init
    
    init(error: ErrorModel) {
        self.error = error
        super.init(frame: .zero)
        drawSelf()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        backgroundColor = .white
        
        titleLabel.text = error.description
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        okButton.setTitle("OK", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.addTarget(self, action: #selector(okTap), for: .touchUpInside)
        
        addSubview(titleLabel)
        addSubview(okButton)
        
        okButton.autoPinEdgesToSuperviewEdges(
            with: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20),
            excludingEdge: .top
        )
        
        titleLabel.autoCenterInSuperview()
        titleLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 30)
        titleLabel.autoPinEdge(.right, to: .right, of: self, withOffset: -30)
    }
    
    
    // MARK: - Actions
    
    @objc private func okTap() {
        (delegate as? ErrorPlaceholderDelegate)?.didTapErrorPlaceholderOkButton()
    }
    
}
