import UIKit

enum CellType: String {
    case disclosure
    case `switch`
    case checkmark
    case action
}

class PhotosSettingItem {
    let type: CellType
    let title: String
    var on: Bool
    var imageName: String?
    
    init(type: CellType, title: String, on: Bool = false, imageName: String? = nil) {
        self.type = type
        self.title = title
        self.on = on
        self.imageName = imageName
    }
}

class PhotosSettingSection {
    let items: [PhotosSettingItem]
    var header: String?
    var footer: String?
    
    init(items: [PhotosSettingItem], header: String? = nil, footer: String? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    
    static func generateData() -> [PhotosSettingSection] {
        return [
            PhotosSettingSection(items: [PhotosSettingItem(type: .disclosure, title: "Siri & Search", imageName: "magnifyingglass.circle.fill")
            ],
            header: "Allow photos to Access"),
            
            PhotosSettingSection(items: [PhotosSettingItem(type: .switch, title: "Hidden Album", on: true)
            ],
            footer: "When enabled, the Hidden album will appear in the Albums tab, under Utilities."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .switch, title: "Auto-Play Videos", on: false),
                PhotosSettingItem(type: .switch, title: "Summarize Photos", on: true)
            ],
            header: "Phtos Tab",
            footer: "The Photos tab shows every photo in your library in all views. You can choose compact, summarized views for Collections and Years."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .action, title: "Reset Suggested memories"),
                PhotosSettingItem(type: .switch, title: "Show Holiday Events", on: true)
            ],
            header: "MEMORIES",
            footer: "You can choose to see holiday events for your home country."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .checkmark, title: "Automatic", on: true),
                PhotosSettingItem(type: .checkmark, title: "Keep Originals", on: false)
            ],
            header: "Transfer to mac or PC",
            footer: "Automatically transfer photos and videos in a compitable format, or always transfer the original file without checking for compatibility.")
        ]
    }
}




