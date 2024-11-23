import UIKit

// MARK - Расширение для UITapGestureRecognizer

extension UITapGestureRecognizer {
    /// Определяет, произошёл ли тап внутри определённого диапазона текста в UILabel.
     
    /// - Параметры:
    ///   - label: UILabel, содержащий атрибутированный текст.
    ///   - targetRange: Диапазон текста, который нужно проверить на наличие тапа.
    /// - Возвращает: Булево значение: `true`, если тап произошёл в указанном диапазоне, иначе `false`.
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Проверяем, есть ли атрибутированный текст в UILabel. Если текста нет, возвращаем false.
        guard let attributedText = label.attributedText else { return false }

        // Создаём объект текстового хранилища для управления атрибутированным текстом.
        let textStorage = NSTextStorage(attributedString: attributedText)
        // Создаём менеджер компоновки для расчёта расположения текста.
        let layoutManager = NSLayoutManager()
        // Создаём текстовый контейнер, определяющий область отображения текста.
        let textContainer = NSTextContainer(size: label.bounds.size)
        textContainer.lineFragmentPadding = 0 // Убираем отступы для точного расчёта попадания.
        textContainer.lineBreakMode = label.lineBreakMode // Задаём режим переноса строк, как у UILabel.
        textContainer.maximumNumberOfLines = label.numberOfLines // Устанавливаем максимальное количество строк, как у UILabel.
        
        // Связываем менеджер компоновки с текстовым контейнером.
        layoutManager.addTextContainer(textContainer)
        // Добавляем менеджер компоновки в текстовое хранилище.
        textStorage.addLayoutManager(layoutManager)
        
        // Получаем координаты точки тапа в границах UILabel.
        let locationOfTouchInLabel = location(in: label)
        // Рассчитываем область, в которой располагается текст внутри UILabel.
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        // Вычисляем смещение, чтобы текст соответствовал границам UILabel.
        let textOffset = CGPoint(
            x: (label.bounds.size.width - textBoundingBox.size.width) / 2 - textBoundingBox.origin.x,
            y: (label.bounds.size.height - textBoundingBox.size.height) / 2 - textBoundingBox.origin.y
        )
        // Преобразуем координаты тапа в систему координат текстового контейнера.
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textOffset.x,
            y: locationOfTouchInLabel.y - textOffset.y
        )
        
        // Определяем индекс символа, на который произошёл тап.
        let indexOfCharacter = layoutManager.characterIndex(
            for: locationOfTouchInTextContainer,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )
        
        // Проверяем, входит ли индекс символа в заданный диапазон.
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
