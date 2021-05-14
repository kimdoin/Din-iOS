import UIKit

import UIKit

struct MaterialColorDataSource {
   struct Section {
      let title: String
      var colors: [UIColor]
      
      init(from color: MaterialColor.Type) {
         self.title = color.title
         self.colors = color.allColors
      }
      
      init() {
         title = "Arbitrary Section"
         colors = [UIColor.red, UIColor.green, UIColor.blue]
      }
   }
   
   struct Color {
      let title: String
      let color: UIColor
      let hex: String
      
      init(from color: MaterialColor.Type) {
         self.title = color.title
         self.color = color.primary
         self.hex = color.primary.rgbHexString
      }
   }
   
   static let predefinedColor: [MaterialColor.Type] = [
      UIColor.MaterialRed.self,
      UIColor.MaterialBlue.self,
      UIColor.MaterialPink.self,
      UIColor.MaterialPurple.self,
      UIColor.MaterialLightBlue.self,
      UIColor.MaterialDeepPurple.self,
      UIColor.MaterialCyan.self,
      UIColor.MaterialOrange.self,
      UIColor.MaterialIndigo.self,
      UIColor.MaterialGreen.self,
      UIColor.MaterialTeal.self,
      UIColor.MaterialLightGreen.self,
      UIColor.MaterialAmber.self,
      UIColor.MaterialLime.self,
      UIColor.MaterialDeepOrange.self,
      UIColor.MaterialYellow.self,
      ]
   
   
   static func generateSingleSectionData() -> [Color] {
      return predefinedColor.map { Color(from: $0) }
   }
   
   
   static func generateMultiSectionData() -> [Section] {
      return predefinedColor.map { Section(from: $0) }
   }
}

protocol MaterialColor {
   static var title: String { get }
   static var primary: UIColor { get }
   static var i50: UIColor { get }
   static var i100: UIColor { get }
   static var i200: UIColor { get }
   static var i300: UIColor { get }
   static var i400: UIColor { get }
   static var i500: UIColor { get }
   static var i600: UIColor { get }
}

extension MaterialColor {
   public static var allColors: [UIColor] {
      return [primary, i50, i100, i200, i300, i400, i500, i600]
   }
}

public extension UIColor {
   public struct MaterialRed: MaterialColor {
      static let title = "Material Red"
      
      public static let primary = UIColor(hexString: "#F44336")
      public static let i50     = UIColor(hexString: "#FFEBEE")
      public static let i100    = UIColor(hexString: "#FFCDD2")
      public static let i200    = UIColor(hexString: "#EF9A9A")
      public static let i300    = UIColor(hexString: "#E57373")
      public static let i400    = UIColor(hexString: "#EF5350")
      public static let i500    = UIColor(hexString: "#F44336")
      public static let i600    = UIColor(hexString: "#E53935")
   }
   
   public struct MaterialPink: MaterialColor {
      static let title = "Material Pink"
      
      public static let primary = UIColor(hexString: "#E91E63")
      public static let i50     = UIColor(hexString: "#FCE4EC")
      public static let i100    = UIColor(hexString: "#F8BBD0")
      public static let i200    = UIColor(hexString: "#F48FB1")
      public static let i300    = UIColor(hexString: "#F06292")
      public static let i400    = UIColor(hexString: "#EC407A")
      public static let i500    = UIColor(hexString: "#E91E63")
      public static let i600    = UIColor(hexString: "#D81B60")
      
   }
   
   public struct MaterialPurple: MaterialColor {
      static let title = "Material Purple"
      
      public static let primary = UIColor(hexString: "#9C27B0")
      public static let i50     = UIColor(hexString: "#F3E5F5")
      public static let i100    = UIColor(hexString: "#E1BEE7")
      public static let i200    = UIColor(hexString: "#CE93D8")
      public static let i300    = UIColor(hexString: "#BA68C8")
      public static let i400    = UIColor(hexString: "#AB47BC")
      public static let i500    = UIColor(hexString: "#9C27B0")
      public static let i600    = UIColor(hexString: "#8E24AA")
      
   }
   
   public struct MaterialDeepPurple: MaterialColor {
      static let title = "Material Deep Purple"
      
      public static let primary = UIColor(hexString: "#EDE7F6")
      public static let i50     = UIColor(hexString: "#F3E5F5")
      public static let i100    = UIColor(hexString: "#D1C4E9")
      public static let i200    = UIColor(hexString: "#B39DDB")
      public static let i300    = UIColor(hexString: "#9575CD")
      public static let i400    = UIColor(hexString: "#7E57C2")
      public static let i500    = UIColor(hexString: "#673AB7")
      public static let i600    = UIColor(hexString: "#5E35B1")
     
   }
   
   public struct MaterialIndigo: MaterialColor {
      static let title = "Material Indigo"
      
      public static let primary = UIColor(hexString: "#3F51B5")
      public static let i50     = UIColor(hexString: "#E8EAF6")
      public static let i100    = UIColor(hexString: "#C5CAE9")
      public static let i200    = UIColor(hexString: "#9FA8DA")
      public static let i300    = UIColor(hexString: "#7986CB")
      public static let i400    = UIColor(hexString: "#5C6BC0")
      public static let i500    = UIColor(hexString: "#3F51B5")
      public static let i600    = UIColor(hexString: "#3949AB")
     
   }
   
   public struct MaterialBlue: MaterialColor {
      static let title = "Material Blue"
      
      public static let primary = UIColor(hexString: "#2196F3")
      public static let i50     = UIColor(hexString: "#E3F2FD")
      public static let i100    = UIColor(hexString: "#BBDEFB")
      public static let i200    = UIColor(hexString: "#90CAF9")
      public static let i300    = UIColor(hexString: "#64B5F6")
      public static let i400    = UIColor(hexString: "#42A5F5")
      public static let i500    = UIColor(hexString: "#2196F3")
      public static let i600    = UIColor(hexString: "#1E88E5")
      
   }
   
   public struct MaterialLightBlue: MaterialColor {
      static let title = "Material Light Blue"
      
      public static let primary = UIColor(hexString: "#03A9F4")
      public static let i50     = UIColor(hexString: "#E1F5FE")
      public static let i100    = UIColor(hexString: "#B3E5FC")
      public static let i200    = UIColor(hexString: "#81D4FA")
      public static let i300    = UIColor(hexString: "#4FC3F7")
      public static let i400    = UIColor(hexString: "#29B6F6")
      public static let i500    = UIColor(hexString: "#03A9F4")
      public static let i600    = UIColor(hexString: "#039BE5")
     
   }
   
   public struct MaterialCyan: MaterialColor {
      static let title = "Material Cyan"
      
      public static let primary = UIColor(hexString: "#00BCD4")
      public static let i50     = UIColor(hexString: "#E0F7FA")
      public static let i100    = UIColor(hexString: "#B2EBF2")
      public static let i200    = UIColor(hexString: "#80DEEA")
      public static let i300    = UIColor(hexString: "#4DD0E1")
      public static let i400    = UIColor(hexString: "#26C6DA")
      public static let i500    = UIColor(hexString: "#00BCD4")
      public static let i600    = UIColor(hexString: "#00ACC1")
     
   }
   
   public struct MaterialTeal: MaterialColor {
      static let title = "Material Teal"
      
      public static let primary = UIColor(hexString: "#009688")
      public static let i50     = UIColor(hexString: "#E0F2F1")
      public static let i100    = UIColor(hexString: "#B2DFDB")
      public static let i200    = UIColor(hexString: "#80CBC4")
      public static let i300    = UIColor(hexString: "#4DB6AC")
      public static let i400    = UIColor(hexString: "#26A69A")
      public static let i500    = UIColor(hexString: "#009688")
      public static let i600    = UIColor(hexString: "#00897B")
    
   }
   
   public struct MaterialGreen: MaterialColor {
      static let title = "Material Green"
      
      public static let primary = UIColor(hexString: "#4CAF50")
      public static let i50     = UIColor(hexString: "#E8F5E9")
      public static let i100    = UIColor(hexString: "#C8E6C9")
      public static let i200    = UIColor(hexString: "#A5D6A7")
      public static let i300    = UIColor(hexString: "#81C784")
      public static let i400    = UIColor(hexString: "#66BB6A")
      public static let i500    = UIColor(hexString: "#4CAF50")
      public static let i600    = UIColor(hexString: "#43A047")
    
   }
   
   public struct MaterialLightGreen: MaterialColor {
      static let title = "Material Light Green"
      
      public static let primary = UIColor(hexString: "#8BC34A")
      public static let i50     = UIColor(hexString: "#F1F8E9")
      public static let i100    = UIColor(hexString: "#DCEDC8")
      public static let i200    = UIColor(hexString: "#C5E1A5")
      public static let i300    = UIColor(hexString: "#AED581")
      public static let i400    = UIColor(hexString: "#9CCC65")
      public static let i500    = UIColor(hexString: "#8BC34A")
      public static let i600    = UIColor(hexString: "#7CB342")
    
   }
   
   public struct MaterialLime: MaterialColor {
      static let title = "Material Lime"
      
      public static let primary = UIColor(hexString: "#CDDC39")
      public static let i50     = UIColor(hexString: "#F9FBE7")
      public static let i100    = UIColor(hexString: "#F0F4C3")
      public static let i200    = UIColor(hexString: "#E6EE9C")
      public static let i300    = UIColor(hexString: "#DCE775")
      public static let i400    = UIColor(hexString: "#D4E157")
      public static let i500    = UIColor(hexString: "#CDDC39")
      public static let i600    = UIColor(hexString: "#C0CA33")
   
   }
   
   public struct MaterialYellow: MaterialColor {
      static let title = "Material Yellow"
      
      public static let primary = UIColor(hexString: "#FFEB3B")
      public static let i50     = UIColor(hexString: "#FFFDE7")
      public static let i100    = UIColor(hexString: "#FFF9C4")
      public static let i200    = UIColor(hexString: "#FFF59D")
      public static let i300    = UIColor(hexString: "#FFF176")
      public static let i400    = UIColor(hexString: "#FFEE58")
      public static let i500    = UIColor(hexString: "#FFEB3B")
      public static let i600    = UIColor(hexString: "#FDD835")
    
   }
   
   public struct MaterialAmber: MaterialColor {
      static let title = "Material Amber"
      
      public static let primary = UIColor(hexString: "#FFC107")
      public static let i50     = UIColor(hexString: "#FFF8E1")
      public static let i100    = UIColor(hexString: "#FFECB3")
      public static let i200    = UIColor(hexString: "#FFE082")
      public static let i300    = UIColor(hexString: "#FFD54F")
      public static let i400    = UIColor(hexString: "#FFCA28")
      public static let i500    = UIColor(hexString: "#FFC107")
      public static let i600    = UIColor(hexString: "#FFB300")
   
   }
   
   public struct MaterialOrange: MaterialColor {
      static let title = "Material Orange"
      
      public static let primary = UIColor(hexString: "#FF9800")
      public static let i50     = UIColor(hexString: "#FFF3E0")
      public static let i100    = UIColor(hexString: "#FFE0B2")
      public static let i200    = UIColor(hexString: "#FFCC80")
      public static let i300    = UIColor(hexString: "#FFB74D")
      public static let i400    = UIColor(hexString: "#FFA726")
      public static let i500    = UIColor(hexString: "#FF9800")
      public static let i600    = UIColor(hexString: "#FB8C00")
    
   }
   
   public struct MaterialDeepOrange: MaterialColor {
      static let title = "Material Deep Orange"
      
      public static let primary = UIColor(hexString: "#FF5722")
      public static let i50     = UIColor(hexString: "#FBE9E7")
      public static let i100    = UIColor(hexString: "#FFCCBC")
      public static let i200    = UIColor(hexString: "#FFAB91")
      public static let i300    = UIColor(hexString: "#FF8A65")
      public static let i400    = UIColor(hexString: "#FF7043")
      public static let i500    = UIColor(hexString: "#FF5722")
      public static let i600    = UIColor(hexString: "#F4511E")
   }
}


public extension UIColor {

   public convenience init(hexString: String) {
      var red: CGFloat    = 1.0
      var green: CGFloat  = 1.0
      var blue: CGFloat   = 1.0
      var alpha: CGFloat  = 1.0
      
      if let color = hexString.parseHexColorString() {
         color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
      }
      
      self.init(red:red, green:green, blue:blue, alpha:alpha)
   }
   
   
   public var rgbHexString: String {
      return toHexString(includeAlpha: false)
   }
   
   public var rgbaHexString: String {
      return toHexString(includeAlpha: true)
   }
   
   private func toHexString(includeAlpha: Bool) -> String {
      var normalizedR: CGFloat = 0
      var normalizedG: CGFloat = 0
      var normalizedB: CGFloat = 0
      var normalizedA: CGFloat = 0
      
      getRed(&normalizedR, green: &normalizedG, blue: &normalizedB, alpha: &normalizedA)
      
      let r = Int(normalizedR * 255)
      let g = Int(normalizedG * 255)
      let b = Int(normalizedB * 255)
      let a = Int(normalizedA * 255)
      
      if includeAlpha {
         return String(format: "#%02X%02X%02X%02X", r, g, b, a)
      }
      
      return String(format: "#%02X%02X%02X", r, g, b)
   }
}

public extension String {
   
   private var len: Int {
      #if swift(>=3.2)
      return count
      #else
      return characters.count
      #endif
   }
   
   /// A Boolean value that indicates whether the receiver is hexadecimal color string
   public var isHexColorString: Bool {
      if !hasPrefix("#") || len < 4 || len > 9 {
         return false
      }
      
      do {
         let pattern = "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}|[A-Fa-f0-9]{4}|[A-Fa-f0-9]{8})$"
         let regex = try NSRegularExpression(pattern: pattern, options: [])
         let range = NSRange(location: 0, length: len)
         return regex.numberOfMatches(in: self, options: [], range: range) == 1
      } catch {
         print(error)
      }
      
      return false
   }
   
   
   /// The red component of the hexadecimal color string
   public var redComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 1...2)
      case 7, 9:
         return parse(subRange: 1...3)
      default:
         return nil
      }
   }
   
   
   /// The green component of the hexadecimal color string
   public var greenComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 2...3)
      case 7, 9:
         return parse(subRange: 3...5)
      default:
         return nil
      }
   }
   
   
   /// The blue component of the hexadecimal color string
   public var blueComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 4, 5:
         return parse(subRange: 3...4)
      case 7, 9:
         return parse(subRange: 5...7)
      default:
         return nil
      }
   }
   
   
   /// The alpha component of the hexadecimal color string
   public var alphaComponent: CGFloat? {
      guard isHexColorString else { return nil }
      
      switch len {
      case 5:
         return parse(subRange: 4...5)
      case 9:
         return parse(subRange: 7...9)
      default:
         return 255.0
      }
   }
   
   
   /// The receiver's UIColor representation
   public var UIColorValue: UIColor? {
      return parseHexColorString()
   }
   
   
   /// Parse the content of receiver.
   ///
   /// The method can parse following format:
   /// - RGB
   /// - RGBA
   /// - RRGGBB
   /// - RRGGBBAA
   ///
   /// - Returns: The UIColor object for the parsed string, or nil if there is an error of if receiver is not a valid hexadecimal color string
   public func parseHexColorString() -> UIColor? {
      if let r = redComponent, let g = greenComponent, let b = blueComponent {
         let a = alphaComponent ?? 255
         
         return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
      }
      
      return nil
   }
   
   
   /// Parse the content of specific range.
   ///
   /// - Parameter subRange: range to parse
   /// - Returns: The floating-point value, or nil if the content of specified range cannot be parsed
   fileprivate func parse(subRange: CountableClosedRange<Int>) -> CGFloat? {
      let substringRange = Range<String.Index>(uncheckedBounds: (index(startIndex, offsetBy: subRange.lowerBound), index(startIndex, offsetBy: subRange.upperBound)))
      
      #if swift(>=4.0)
      var value = String(self[substringRange])
      #else
      var value = substring(with: substringRange)
      #endif
      
      
      #if swift(>=3.2)
      if value.count == 1 {
         value = value + value
      }
      #else
      if value.characters.count == 1 {
      value = value + value
      }
      #endif
      
      
      var result: UInt32 = 0
      let scanner = Scanner(string: value)
      if scanner.scanHexInt32(&result) {
         return CGFloat(result)
      }
      
      return nil
   }
}
