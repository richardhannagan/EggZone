import SwiftUI

struct ContentView: View {
    @State private var timeElapsed = 0 // The starting time for the egg timer
    @State private var timerPaused = true // The timer starts paused

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(timeElapsed / 60):\(timeElapsed % 60, specifier: "%02d")")
                .font(.system(size: 72))
            Button(action: {
                if timerPaused {
                    timeElapsed = 0 // Reset the timer if it's paused
                    timerPaused = false
                } else {
                    timerPaused = true
                }
            }) {
                if timerPaused {
                    Text("Start")
                } else {
                    Text("Pause")
                }
            }
        }
        .onReceive(timer) { _ in
            if !timerPaused {
                timeElapsed += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
