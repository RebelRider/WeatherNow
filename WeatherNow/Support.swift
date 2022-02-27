import UIKit

extension UIView {
    
    func anchr(top: NSLayoutYAxisAnchor? = nil,
               left: NSLayoutXAxisAnchor? = nil,
               bottom: NSLayoutYAxisAnchor? = nil,
               right: NSLayoutXAxisAnchor? = nil,
               paddingTop: CGFloat = 0,
               paddingLeft: CGFloat = 0,
               paddingBottom: CGFloat = 0,
               paddingRight: CGFloat = 0,
               width: CGFloat? = nil,
               height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.4, height: 0.4)
        layer.masksToBounds = false
    }
    
    func centerX(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
