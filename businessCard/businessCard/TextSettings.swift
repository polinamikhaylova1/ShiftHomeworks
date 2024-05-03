//
//  Labelsettings.swift
//  businessCard
//
//  Created by Полина Михайлова on 02.05.2024.
//

import UIKit

import UIKit

class TextSettings {
    static func makeLabel(withText text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func makeLabelHobbyDescripption(withText text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func makeTitle(withText text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    

}
