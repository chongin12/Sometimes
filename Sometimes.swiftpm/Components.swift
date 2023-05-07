import SwiftUI

struct WorldEntryView: View {
    var title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(Color.primary, lineWidth: 2.0)
                .frame(minWidth: 400, idealWidth: 400, maxWidth: 500, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
                .aspectRatio(1, contentMode: .fit)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                .padding(.all, 20)
                .foregroundColor(.clear)
            VStack {
                Text(title)
                    .font(.title)
                    .padding()
            }
            .foregroundColor(.primary)
        }
    }
}
