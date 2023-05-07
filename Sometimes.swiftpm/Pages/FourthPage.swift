import SwiftUI

struct FourthPage: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Choose a world to see through the window.")
                    .font(.largeTitle)
                    .padding(.top, 100)
                Text("please turn the sound on 🔊")
                    .font(.title)
                    .padding()
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: 20, pinnedViews: []) {
                        NavigationLink { 
                            FloweryDayGamePage(hasWindow: true)
                                .scaledToFit()
                        } label: { 
                            WorldEntryView(title: "Chapter 1. Flowery Day 🌸")
                        }
                        NavigationLink { 
                            RainyDayGamePage(hasWindow: true)
                                .scaledToFit()
                        } label: { 
                            WorldEntryView(title: "Chapter 2. Rainy Day 🌧️")
                        }
                        NavigationLink { 
                            FallFoliageDayGamePage(hasWindow: true)
                                .scaledToFit()
                        } label: { 
                            WorldEntryView(title: "Chapter 3.  Fall Foliage Day 🍂")
                        }
                        NavigationLink { 
                            SnowyDayGamePage(hasWindow: true)
                                .scaledToFit()
                        } label: { 
                            WorldEntryView(title: "Chapter 4.  Snowy Day ☃️")
                        }
                    }
                }
                .padding(.all, 30)
                NavigationLink { 
                    FifthPage()
                } label: { 
                    Text("Next")
                        .font(.title)
                        .padding()
                        .padding(.horizontal, 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 3)
                        }
                        .padding(.bottom, 100)
                }
            }
        }
    }
}

struct FourthPage_Previews: PreviewProvider {
    static var previews: some View {
        FourthPage()
    }
}
