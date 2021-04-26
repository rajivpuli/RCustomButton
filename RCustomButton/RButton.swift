//
//  RCustomButton.swift
//  RCustomButton
//
//  Created by Rajiv Puli on 26/04/21.
//

import UIKit

public enum Shape: Int{
    case normal = 0
    case cirlce
    case square
}

@IBDesignable
public class RButton: UIButton{
    
    @IBInspectable public var Title: String = "Button"{
        didSet{
            self.setTitle(Title, for: .normal)
        }
    }
    
    @IBInspectable public var TitleColor: UIColor = .systemBlue{
        didSet{
            self.setTitleColor(TitleColor, for: .normal)
        }
    }
    
    @IBInspectable public var TitleFontSize: CGFloat = 15{
        didSet{
            self.titleLabel?.font = .systemFont(ofSize: TitleFontSize)
        }
    }
    
    @IBInspectable public var ButtonColor: UIColor = .white{
        didSet{
            self.backgroundColor = ButtonColor
        }
    }
    
    @IBInspectable public var DisableColor: UIColor = .clear{
        didSet{
            self.layer.borderColor = DisableColor.cgColor
        }
    }
    
    @IBInspectable public var BorderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = CGFloat(BorderWidth)
        }
    }
    
    @IBInspectable public var BorderColor: UIColor = .clear{
        didSet{
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable public var CornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
    
    @IBInspectable var buttonShape: Int = 0{
        didSet{
            shapeOfButton = Shape(rawValue: buttonShape) ?? Shape.normal
        }
    }
    
    public override var isEnabled: Bool{
        didSet{
            if isEnabled{
                self.isUserInteractionEnabled = true
                self.backgroundColor = ButtonColor
            }
            else{
                self.isUserInteractionEnabled = false
                self.backgroundColor = DisableColor
            }
        }
    }
    
    public var shapeOfButton: Shape = .normal{
        didSet{
            switch shapeOfButton {
            case .normal:
                break
            case .cirlce:
                let size = self.frame.width > self.frame.height ? self.frame.height : self.frame.width
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: size, height: size)
                self.CornerRadius = (size / 2)
                self.layoutIfNeeded()
//                self.translatesAutoresizingMaskIntoConstraints = true
            case .square:
                let size = self.frame.width > self.frame.height ? self.frame.height : self.frame.width
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: size, height: size)
                self.layoutIfNeeded()
//                self.translatesAutoresizingMaskIntoConstraints = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareButton()
    }
    
    func prepareButton(){
        self.layer.borderWidth = self.BorderWidth
        self.layer.borderColor = self.BorderColor.cgColor
        self.backgroundColor = self.ButtonColor
        self.layer.cornerRadius = self.CornerRadius
        self.setTitle(self.Title, for: .normal)
        self.setTitleColor(self.TitleColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: self.TitleFontSize)
//        self.layoutIfNeeded()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
}
