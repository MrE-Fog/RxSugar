import UIKit
import RxSwift

public extension Sugar where HostType: UITextField {
	/**
	RxSugar wrapper for text property.
	*/
	public var text: ValueBinding<String> {
		return controlValueBinding(
            valueChangeEventTypes: [UIControl.Event.editingChanged, UIControl.Event.editingDidEnd],
			getter: { $0.text ?? "" },
			setter: { $0.text = $1 })
	}
	
	/**
	RxSugar wrapper for attributedText property.
	*/
	public var attributedText: ValueBinding<NSAttributedString> {
		return controlValueBinding(
            valueChangeEventTypes: [UIControl.Event.editingChanged, UIControl.Event.editingDidEnd],
			getter: { $0.attributedText ?? NSAttributedString() },
			setter: { $0.attributedText = $1 })
	}
    
    /**
     RxSugar wrapper for font property.
     */
    public var font: AnyObserver<UIFont> { return valueSetter { $0.font = $1 } }
    
    /**
     RxSugar wrapper for textColor property.
     */
    public var textColor: AnyObserver<UIColor> { return valueSetter { $0.textColor = $1 } }
}
