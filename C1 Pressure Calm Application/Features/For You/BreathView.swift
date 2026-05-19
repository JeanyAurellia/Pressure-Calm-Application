//////
//////  BreathView.swift
//////  C1 App Revisi
//////
//////  Created by Jeany Aurellia on 08/05/26.
//////

import SwiftUI
import Combine

struct BreathView: View {
    
    // =========================================================
    // MARK: BREATH PHASE
    // =========================================================
    
    enum BreathPhase: String {
        case inhale = "Breath"
        case hold = "Hold"
        case exhale = "Exhale"
    }
    
    // =========================================================
    // MARK: STATE
    // =========================================================
    
    @State private var phase: BreathPhase = .inhale
    
    @State private var currentScale: CGFloat = 0.5
    
    // ORBIT POSITION
    @State private var orbitX: CGFloat = 0
    @State private var orbitY: CGFloat = -175
    
    // ORBIT ANGLE
    @State private var currentDegree: Double = -90
    
    // SESSION
    @State private var isStarted = false
    @State private var revolutionCount = 1
    @State private var showFinishedPage = false
    @Environment(\.dismiss) var dismiss
    
    // =========================================================
    // MARK: TIMER
    // =========================================================
    
    let timer = Timer.publish(
        every: 0.02,
        on: .main,
        in: .common
    ).autoconnect()
    
    // =========================================================
    // MARK: CONFIG
    // =========================================================
    
    let orbitRadius: CGFloat = 175
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                // =====================================================
                // MARK: OUTER STROKE
                // =====================================================
                
                Circle()
                    .stroke(lineWidth: 3)
                    .opacity(0.7)
                    .frame(width: 350, height:350)
                    .foregroundStyle(Color.leafGreen)
                
                Circle()
                    .stroke(lineWidth: 3)
                    .opacity(0.6)
                    .frame(width: 325, height:325)
                    .foregroundStyle(Color.white)
                
                // =====================================================
                // MARK: BREATHING CIRCLE
                // =====================================================
                
                Circle()
                    .opacity(0.4)
                    .frame(width: 300, height:300)
                    .foregroundStyle(Color.leafGreen)
                    .scaleEffect(currentScale)
                
                Circle()
                    .opacity(0.3)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(Color.leafGreen)
                    .scaleEffect(currentScale)
                
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(Color.leafGreen)
                    .scaleEffect(
                        currentScale < 0.85
                        ? 0.85
                        : currentScale
                    )
                
                // =====================================================
                // MARK: TEXT
                // =====================================================
                
                VStack(spacing: 8){
                    
                    Text(phase.rawValue)
                        .font(
                            Font.system(
                                size: 22,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(Color.white)
                    
                    Text("\(revolutionCount)/4")
                        .font(
                            Font.system(
                                size: 14,
                                weight: .medium,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(Color.white.opacity(0.7))
                }
                
                // jhgjhg
                
                
                // =====================================================
                // MARK: CENTER STROKE
                // =====================================================
                
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .opacity(0.7)
                    .foregroundStyle(Color.white)
                
                // =====================================================
                // MARK: INHALE MARKER
                // =====================================================
                
                markerView(isActive: phase == .inhale)
                    .offset(y: -175)
                
                // =====================================================
                // MARK: HOLD MARKER
                // =====================================================
                
                markerView(isActive: phase == .hold)
                    .offset(
                        x: holdMarkerX,
                        y: holdMarkerY
                    )
                
                // =====================================================
                // MARK: EXHALE MARKER
                // =====================================================
                
                markerView(isActive: phase == .exhale)
                    .offset(
                        x: exhaleMarkerX,
                        y: exhaleMarkerY
                    )
                
                // =====================================================
                // MARK: ORBIT DOT
                // =====================================================
                
                Circle()
                    .fill(Color.white)
                    .frame(width:18, height:18)
                    .shadow(radius:10)
                    .offset(
                        x: orbitX,
                        y: orbitY
                    )
            }
            
            
            // =====================================================
            // MARK: BUTTON
            // =====================================================
            // test commit
            Button(isStarted ? "RUNNING" : "START"){
                
                if !isStarted {
                    
                    resetBreathing()
                    
                    revolutionCount = 0
                    
                    isStarted = true
                }
            }
            .frame(width: 125, height: 50)
            .background(Color.leafGreen)
            .foregroundStyle(Color.lightGreen)
            .font(
                Font.system(
                    size: 18,
                    weight: .bold,
                    design: .rounded
                )
            )
            .cornerRadius(18)
            .padding(.top, 20)
        }
        
        // =====================================================
        // MARK: TIMER
        // =====================================================
        
        .onReceive(timer) { _ in
            
            guard isStarted else { return }
            
            updateBreathing()
        }
        
        // =====================================================
        // MARK: FINISH PAGE
        // =====================================================
        
        .fullScreenCover(isPresented: $showFinishedPage) {
            
            FinishView {
                
                dismiss()
            }
        }
       
    }
}

// =========================================================
// MARK: EXTENSION
// =========================================================

extension BreathView {
    
    // =====================================================
    // MARK: MARKER VIEW
    // =====================================================
    
    @ViewBuilder
    func markerView(isActive: Bool) -> some View {
        
        ZStack{
            
            Circle()
                .fill(
                    isActive
                    ? Color.white
                    : Color.leafGreen
                )
                .opacity(0.7)
                .frame(width:18, height:18)
                .shadow(radius:10)
            
            Circle()
                .stroke(lineWidth: 3)
                .foregroundStyle(Color.white)
                .opacity(0.7)
                .frame(width:18, height:18)
        }
    }
    
    // =====================================================
    // MARK: MARKER POSITION
    // =====================================================
    
    var holdMarkerX: CGFloat {
        
        cos(30 * .pi / 180) * orbitRadius
    }
    
    var holdMarkerY: CGFloat {
        
        sin(30 * .pi / 180) * orbitRadius
    }
    
    var exhaleMarkerX: CGFloat {
        
        cos(150 * .pi / 180) * orbitRadius
    }
    
    var exhaleMarkerY: CGFloat {
        
        sin(150 * .pi / 180) * orbitRadius
    }
    
    // =====================================================
    // MARK: RESET
    // =====================================================
    
    func resetBreathing() {
        
        currentDegree = -90
        
        orbitX = 0
        orbitY = -175
        
        currentScale = 0.5
        
        phase = .inhale
    }
    
    // =====================================================
    // MARK: POSITION CHECK
    // =====================================================
    
    func isNear(
        x1: CGFloat,
        y1: CGFloat,
        x2: CGFloat,
        y2: CGFloat,
        tolerance: CGFloat = 15
    ) -> Bool {
        
        abs(x1 - x2) < tolerance &&
        abs(y1 - y2) < tolerance
    }
    
    // =====================================================
    // MARK: BREATHING LOGIC
    // =====================================================
    
    func updateBreathing() {
        
        // =====================================================
        // MARK: MOVE ORBIT
        // =====================================================
        
        switch phase {
            
        case .inhale:
            
            currentDegree += 1.0
            
        case .hold:
            
            currentDegree += 1.5
            
        case .exhale:
            
            currentDegree += 0.6
        }
        
        // =====================================================
        // MARK: ORBIT POSITION
        // =====================================================
        
        let radian =
        currentDegree * .pi / 180
        
        orbitX =
        cos(radian) * orbitRadius
        
        orbitY =
        sin(radian) * orbitRadius
        
        // =====================================================
        // MARK: PHASE CHANGE
        // =====================================================
        
        // HOLD
        
        if phase == .inhale &&
            isNear(
                x1: orbitX,
                y1: orbitY,
                x2: holdMarkerX,
                y2: holdMarkerY
            ) {
            
            phase = .hold
        }
        
        // EXHALE
        
        if phase == .hold &&
            isNear(
                x1: orbitX,
                y1: orbitY,
                x2: exhaleMarkerX,
                y2: exhaleMarkerY
            ) {
            
            phase = .exhale
        }
        
        // =====================================================
        // MARK: SCALE
        // =====================================================
        
        switch phase {
            
        case .inhale:
            
            if currentScale < 1 {
                
                currentScale += 0.003
            }
            
        case .hold:
            
            currentScale = 1
            
        case .exhale:
            
            if currentScale > 0.5 {
                
                currentScale -= 0.002
            }
        }
        
        // =====================================================
        // MARK: RESET
        // =====================================================
        
        if currentDegree >= 270 {
            
            revolutionCount += 1
            
            // selesai 4 revolusi
            if revolutionCount >= 1 {
                
                isStarted = false
                
                showFinishedPage = true
                
                return
            }
            
            resetBreathing()
        }
    }
}

// =========================================================
// MARK: FINISH VIEW
// =========================================================

struct FinishView: View {
    var onDone: () -> Void
    var body: some View {
        ZStack{
            
            Color.bg
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(Color.leafGreen)
                
                Text("Breathing Complete")
                    .font(
                        .system(
                            size: 28,
                            weight: .bold,
                            design: .rounded
                        )
                    )
                    .foregroundStyle(Color.text)
                
                Text("Good job. Your breathing session is finished.")
                    .font(
                        .system(
                            size: 16,
                            weight: .medium,
                            design: .rounded
                        )
                    )
                    .foregroundStyle(Color.white.opacity(0.7))
                Button {
                    
                    onDone()
                    
                } label: {
                    
                    Text("DONE")
                        .font(
                            .system(
                                size: 16,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(Color.white)
                        .frame(width: 120, height: 50)
                        .background(Color.leafGreen)
                        .cornerRadius(14)
                }
                .padding(.top, 10)
            }
        }
    }
}

// =========================================================
// MARK: PREVIEW
// =========================================================

#Preview {
    BreathView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
    
}
