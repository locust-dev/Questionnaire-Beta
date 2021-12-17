//
//  EmptyTableView.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import UIKit

final class EmptyTableView: UITableView {

    // MARK: - Properties
    
    private let emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.textColor = .lightGray
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        // TODO: - ...
        emptyLabel.isHidden = true
        emptyLabel.text = "Кажется, мы ничего не нашли!"
        return emptyLabel
    }()


    // MARK: - Life cycle

    override func reloadData() {
        super.reloadData()
        addEmptyLabel()
    }

    override func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
        super.reloadSections(sections, with: animation)
        addEmptyLabel()
    }


    // MARK: - Private methods

    private func addEmptyLabel() {

        if numberOfRows(inSection: 0) == 0 {
            addSubview(emptyLabel)
            emptyLabel.autoCenterInSuperview()
            emptyLabel.autoPinEdge(.left, to: .left, of: self, withOffset: 20)
            emptyLabel.autoPinEdge(.right, to: .right, of: self, withOffset: 20)
    
        } else {
            emptyLabel.removeFromSuperview()
        }

        mainQueue(delay: 0.5) {
            self.emptyLabel.isHidden = false
        }
    }

}
