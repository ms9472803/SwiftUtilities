import SwiftUI

struct ContinuousLinearProgressView: View {
    @State private var isAnimating = false

    private let horizontalPadding: CGFloat
    private let backgroundColor: Color
    private let tintColor: Color

    init(
        horizontalPadding: CGFloat = 0,
        backgroundColor: Color = .gray,
        tintColor: Color = .blue
    ) {
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
    }

    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width - (horizontalPadding * 2)
            let progressWidth = availableWidth * 0.5

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(backgroundColor)
                    .frame(maxWidth: .infinity)

                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: availableWidth)

                    Capsule()
                        .fill(tintColor)
                        .frame(width: progressWidth)
                        .offset(x: isAnimating ? availableWidth - progressWidth : -progressWidth)
                        .animation(
                            .linear(duration: 1.5)
                            .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                }
                .clipShape(Capsule())
            }
            .padding(.horizontal, horizontalPadding)
        }
        .frame(height: 4)
        .onAppear {
            isAnimating = true
        }
    }
}
