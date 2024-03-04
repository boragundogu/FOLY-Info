import SwiftUI

struct RoundCountdown: View {
    @State private var countdownString: String = "Rounds ends in ..."
    @State private var countdownDate: Date = Date()
    let targetWeekday = 5 // neden  5 ? Calender'da hafta 0'dan başlar.

    var body: some View {
        VStack {
            Text("Round ends in...")
                .padding()
            Text(countdownString)

        }
        .onAppear(perform: {
            updateCountdown()
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                updateCountdown()
            }
            RunLoop.current.add(timer, forMode: .common)
        })
    }

    func updateCountdown() {
        let calendar = Calendar.current
        let now = Date()
        var components = DateComponents()

        components.weekday = targetWeekday
        components.hour = 12
        components.minute = 0
        components.second = 0

        var nextDate = calendar.nextDate(after: now, matching: components, matchingPolicy: .nextTime)!
        // sabit olarak her perşembe 12'yi hedeflemek için kullanılır.

        if now >= nextDate {
            nextDate = calendar.date(byAdding: .day, value: 7, to: nextDate)!
        }


        let diffComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: nextDate) // .dateComponents iki tarih arasındaki farkı bulmaya yarar.

        let days = diffComponents.day ?? 0
        let hours = diffComponents.hour ?? 0
        let minutes = diffComponents.minute ?? 0
        let seconds = diffComponents.second ?? 0

        countdownString = "\(days) days, \(hours) hours, \(minutes) minutes and \(seconds) seconds."
    }

}

struct TimeCounterView_Previews: PreviewProvider {
    static var previews: some View {
        RoundCountdown()
    }
}
