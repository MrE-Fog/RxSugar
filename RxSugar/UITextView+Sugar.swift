import UIKit
import RxSwift

public extension Sugar where HostType: UITextView {
	
	/**
	RxSugar wrapper for text property.
	*/
    public var text: ValueBinding<String> {
        let textChanges = TargetActionObservable<String>(notificationName: UITextView.textDidChangeNotification.rawValue, onObject: host, valueGenerator: { $0.text })
		return ValueBinding(getter: textChanges, setter: valueSetter { $0.text! = $1 })
    }
		
	/**
	RxSugar wrapper for attributedText property.
	*/
    public var attributedText: ValueBinding<NSAttributedString> {
        let textChanges = TargetActionObservable<NSAttributedString>(notificationName: UITextView.textDidChangeNotification.rawValue, onObject: host, valueGenerator: { $0.attributedText })
        return ValueBinding(getter: textChanges, setter: valueSetter { $0.attributedText! = $1 })
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
