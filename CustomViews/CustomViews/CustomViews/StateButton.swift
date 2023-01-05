//
//  StateButton.swift
//  CustomViews
//
//  Created by Yuliya Lapenak on 12/25/22.
//

import UIKit

class StateButton: UIButton {

    // Переменная отвечающая за стиль
    var style: ButtonStyle = .primary {
        // При изменении вызываем метод, который настраивает кнопку и ее стили
        didSet {
            setup()
        }
    }

    // При изменении свойства isEnabled обновляем стиль чтоб изменился цвет фона
    override var isEnabled: Bool {
        didSet {
            setup()
        }
    }

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        // Настройка цвета фона в зависимости от isEnabled
        backgroundColor = isEnabled ? style.background : style.disabledBackground
        setTitleColor(style.textColor, for: .normal)
        setTitleColor(style.disabledTextColor, for: .disabled)
        layer.masksToBounds = true
        layer.borderWidth = 1.2
        layer.borderColor = isEnabled ? style.borderColor.cgColor : style.disabledBackground.cgColor
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
    }
}

// Стиль кнопки
enum ButtonStyle {
    // В кейсах создаем стили
    case primary
    case secondary

    // А в вычисляемых переменных создаем различные параметры (фон, шрифт, углы, границы и тд)
    var background: UIColor {
        switch self {
        case .primary:
            return .orange
        case .secondary:
            return .white
        }
    }

    var disabledBackground: UIColor {
        return .gray
    }

    var textColor: UIColor {
        switch self {
        case .primary:
            return .white
        case .secondary:
            return .orange
        }
    }

    var disabledTextColor: UIColor {
        return .darkGray
    }

    var borderColor: UIColor {
        return .orange
    }
}
