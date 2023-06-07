import SwiftUI
import WidgetKit

let firstImage = extractImagesFromGIF(named: "jerry-tom")?.first ?? UIImage(named: "scary-jerry")!

func extractImagesFromGIF(named gifName: String) -> [UIImage]? {
    guard let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") else {
        return nil
    }
    
    guard let gifSource = CGImageSourceCreateWithURL(gifURL as CFURL, nil) else {
        return nil
    }
    
    let imageCount = CGImageSourceGetCount(gifSource)
    var images: [UIImage] = []
    
    for i in 0..<imageCount {
        guard let cgImage = CGImageSourceCreateImageAtIndex(gifSource, i, nil) else {
            continue
        }
        
        let uiImage = UIImage(cgImage: cgImage)
        images.append(uiImage)
    }
    
    return images
}

struct GIFWidgetEntry: TimelineEntry {
    let date: Date
    let image: UIImage
}

struct GIFWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> GIFWidgetEntry {
        // Return a placeholder entry for the widget
        return GIFWidgetEntry(date: Date(), image: firstImage)
    }

    func getSnapshot(in context: Context, completion: @escaping (GIFWidgetEntry) -> Void) {
        // Provide a snapshot entry for the widget
        let entry = GIFWidgetEntry(date: Date(), image: firstImage)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<GIFWidgetEntry>) -> Void) {
            
        var entries: [GIFWidgetEntry] = []
        
        // Extract the list of images from the GIF
        let images = extractImagesFromGIF(named: "jerry-tom") ?? []
        
        let imageCount = images.count
        
        if imageCount == 0 {
            print("not enough images")
        }
        
        
        // repeat the GIF entries for 20 times
        
        let gifRound = 10
        
       
        for round in 0..<gifRound {
            
            let currentDate = Date()

            for index in 0 ..< imageCount{
                
                let secondCount = round * imageCount + index
                
                let entryDate = Calendar.current.date(byAdding: .second, value: secondCount, to: currentDate)!
                
                let entry = GIFWidgetEntry(date: entryDate, image: images[index])
                
                entries.append(entry)
                
            }
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
    }

}

struct GIFWidget: Widget {
    let kind: String = "GIFWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: GIFWidgetProvider()) { entry in
            GIFWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Static Image Widget")
        .description("Display a sequence of static images in the widget.")
    }
}

struct GIFWidgetView: View {
    var entry: GIFWidgetEntry
    
    var body: some View {
        
        Image(uiImage: entry.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
     
    }
}

struct GIFWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        
        let entry = GIFWidgetEntry(date: Date(), image: firstImage)

        return GIFWidgetView(entry: entry)
                .previewContext(WidgetPreviewContext(family: .systemMedium))

    }
}
