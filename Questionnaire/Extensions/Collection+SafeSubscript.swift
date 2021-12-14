//
//  Collection+SafeSubscript.swift
//  Questionnaire
//
//  Created by Ilya Turin on 30.03.2020.
//

extension Collection {
    
    /// Возвращает элемент по указанному индексу, если он находится в пределах границ, иначе вернер nil
    subscript (safe index: Index) -> Iterator.Element? {
        indices.contains(index) ? self[index] : nil
    }
    
}
