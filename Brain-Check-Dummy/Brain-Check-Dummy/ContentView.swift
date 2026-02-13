import SwiftUI
import Charts

struct BrainRecord: Identifiable, Equatable {
    let id = UUID()
    let checkNumber: Int
    let brainCellsRemaining: Int
}

struct ContentView: View {
    // Starting at 86 Billion
    @State private var brainCells = 86_000_000_000
    @State private var history: [BrainRecord] = []
    @State private var checkCount = 0
    
    // Animation states
    @State private var gradientPhase = false
    @State private var isChecking = false
    
    var body: some View {
        ZStack {
            // 🌑 Improved: Subtle, darker, "professional" gradient
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.1), // Almost black
                    Color(red: 0.1, green: 0.15, blue: 0.25), // Deep slate
                    Color(red: 0.05, green: 0.1, blue: 0.15)  // Dark teal-grey
                ],
                startPoint: gradientPhase ? .topLeading : .bottomTrailing,
                endPoint: gradientPhase ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .animation(.linear(duration: 20).repeatForever(autoreverses: true), value: gradientPhase)
            
            VStack(spacing: 30) {
                Spacer()
                
                // Header
                VStack(spacing: 8) {
                    Text("Brain-Check 🧠")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("Tracking irreversible damage")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                // 📉 The Counter
                VStack(spacing: 5) {
                    Text(brainCells.formatted())
                        .font(.system(size: 28, weight: .medium, design: .monospaced)) // Monospaced prevents jitter
                        .contentTransition(.numericText(value: Double(brainCells))) // Smooth number scroll
                        .foregroundStyle(brainCells < 85_900_000_000 ? .red.opacity(0.8) : .white)
                    
                    Text("cells remaining")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                
                // 📈 Animated Graph
                Chart(history) { record in
                    LineMark(
                        x: .value("Check", record.checkNumber),
                        y: .value("Cells", record.brainCellsRemaining)
                    )
                    .interpolationMethod(.monotone)
                    .foregroundStyle(Color.teal.gradient)
                    .symbol {
                        Circle()
                            .fill(.teal)
                            .frame(width: 6, height: 6)
                    }
                    
                    AreaMark(
                        x: .value("Check", record.checkNumber),
                        y: .value("Cells", record.brainCellsRemaining)
                    )
                    .interpolationMethod(.monotone)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.teal.opacity(0.2), .clear],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
                // 🛠️ FIX: This allows the graph to "Zoom in" on the changes
                // instead of showing the entire 0 to 86B scale.
                .chartYScale(domain: .automatic(includesZero: false))
                .chartXScale(domain: .automatic(includesZero: false))
                .frame(height: 220)
                .padding()
                .background(Color.black.opacity(0.2))
                .cornerRadius(16)
                .opacity(history.count > 1 ? 1 : 0) // Hide until we have data
                
                Spacer()
                
                // ✨ Button
                Button {
                    runBrainCheck()
                } label: {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                        Text(isChecking ? "CALCULATING..." : "CHECK MY BRAIN")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Color.teal.opacity(0.8))
                    .foregroundStyle(.white)
                    .cornerRadius(18)
                    .shadow(color: .teal.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .disabled(isChecking)
                .padding(.horizontal, 30)
                
                Text("Not approved by neurologists or Rust programmers")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.4))
                    .padding(.bottom)
            }
            .padding()
        }
        .onAppear {
            gradientPhase.toggle()
        }
    }
    
    func runBrainCheck() {
        isChecking = true
        
        // Slight artificial delay to make it feel like "work" is happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Damage: 500k to 5M cells
            let damage = Int.random(in: 500_000...5_000_000)
            
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                brainCells = max(brainCells - damage, 0)
                checkCount += 1
                
                let newRecord = BrainRecord(
                    checkNumber: checkCount,
                    brainCellsRemaining: brainCells
                )
                history.append(newRecord)
            }
            
            isChecking = false
        }
    }
}

#Preview {
    ContentView()
}
