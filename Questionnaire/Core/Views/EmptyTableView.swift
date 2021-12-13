////
////  EmptyTableView.swift
////  Questionnaire
////
////  Created by Ilya Turin on 13.12.2021.
////
//
//import UIKit
//
//final class EmptyTableView: UITableView {
//
//    private enum Locals {
//
//
//    }
//
//
//    // MARK: - Properties
//
//    /// Property indicates that tableview has clear sections and fetching new data from request
//    public var isLoading = false
//
//    public var rowsLimit = 0
//    public var sectionForShowingEmpty = 0
//
//    private let localizationConfig = CompositionFactory.shared.service.localizationConfig
//
//    private var numberOfRowsInSection: Int {
//        numberOfRows(inSection: sectionForShowingEmpty)
//    }
//
//    private lazy var emptyLabel: UILabel = {
//        let emptyLabel = UILabel()
//        emptyLabel.textColor = Locals.Label.color
//        emptyLabel.numberOfLines = 0
//        emptyLabel.textAlignment = .center
//        emptyLabel.isHidden = true
//        emptyLabel.text = localizationConfig.localizationTextItems.common.emptyLabelForTable
//        emptyLabel.tag = Locals.Label.tag
//        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
//        return emptyLabel
//    }()
//
//
//    // MARK: - Life cycle
//
//    override func reloadData() {
//        super.reloadData()
//        addEmptyLabel()
//    }
//
//    override func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
//        super.reloadSections(sections, with: animation)
//        addEmptyLabel()
//    }
//
//
//    // MARK: - Private methods
//
//    private func addEmptyLabel() {
//        emptyLabel.isHidden = true
//
//        subviews.forEach {
//            if $0.tag == Locals.Label.tag {
//                $0.removeFromSuperview()
//            }
//        }
//
//        if numberOfRowsInSection == rowsLimit, !isLoading {
//            addSubview(emptyLabel)
//
//            NSLayoutConstraint.activate([
//                emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//                emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//                emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Locals.Label.padding),
//                emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Locals.Label.padding)
//            ])
//
//        } else {
//            emptyLabel.removeFromSuperview()
//        }
//
//        mainQueue(delay: 1) {
//            self.emptyLabel.isHidden = self.numberOfRowsInSection != self.rowsLimit
//        }
//    }
//
//}
