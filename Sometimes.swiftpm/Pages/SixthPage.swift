import SwiftUI
import SpriteKit

struct SixthPage: View {
    var body: some View {
        VStack {
            Text("Choose a world. Interact within the world by tapping.")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("please turn the sound on 🔊")
                .font(.title)
                .padding()
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 20, pinnedViews: []) {
                    NavigationLink {
                        FloweryDayGamePage(hasWindow: false)
                            .scaledToFit()
                    } label: {
                        WorldEntryView(title: "Chapter 1. Flowery Day 🌸")
                    }
                    NavigationLink {
                        RainyDayGamePage(hasWindow: false)
                            .scaledToFit()
                    } label: {
                        WorldEntryView(title: "Chapter 2. Rainy Day 🌧️")
                    }
                    NavigationLink {
                        FallFoliageDayGamePage(hasWindow: false)
                            .scaledToFit()
                    } label: {
                        WorldEntryView(title:  "Chapter 3.  Fall Foliage Day 🍂")
                    }
                    NavigationLink {
                        SnowyDayGamePage(hasWindow: false)
                            .scaledToFit()
                    } label: {
                        WorldEntryView(title: "Chapter 4.  Snowy Day ☃️")
                    }
                }
            }
            .padding(.all, 30)
        }
    }
}

struct SixthPage_Previews: PreviewProvider {
    static var previews: some View {
        SixthPage()
    }
}
