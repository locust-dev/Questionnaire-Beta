//
//  EmptyTableView.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import UIKit

final class EmptyTableView: UITableView {

    // MARK: - Properties

    var loaderColor: UIColor? {
        didSet {
            loaderView.color = loaderColor ?? .blue
        }
    }
    
    private var isLoading = false
    
    private let loaderView = ProgressHUD()
    private let emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.textColor = .white
        emptyLabel.font = UIFont(name: MainFont.medium, size: 18)
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        // TODO: - ...
        emptyLabel.isHidden = true
        emptyLabel.text = "Кажется, мы ничего не нашли\nПопробуйте обновить, потянув вниз"
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

    
    // MARK: - Public methods
    
    func showLoader() {
        isLoading = true
        addSubview(loaderView)
        loaderView.autoCenterInSuperview()
    }
    
    func hideLoader() {
        isLoading = false
        loaderView.removeFromSuperview()
        addEmptyLabel()
    }
    

    // MARK: - Private methods

    private func addEmptyLabel() {

        if numberOfRows(inSection: 0) == 0, !isLoading {
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
