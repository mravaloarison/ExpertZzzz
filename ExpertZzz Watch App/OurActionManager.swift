//
//  Manager.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import Foundation
import HealthKit

class OurActionManager: NSObject, ObservableObject {
    private let healthStore = HKHealthStore()
    
    @Published var currentHeartRate: Double? = nil
    @Published var isPauseActive: Bool = false
    @Published var running: Bool = false
    @Published var ended: Bool = false
    
    @Published var elapsedTime: Double = 0.0
    private var timer: Timer?

    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else { return }

        let readTypes: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .heartRate)!]

        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            if let error = error {
                print("Authorization failed: \(error.localizedDescription)")
            }
        }
    }
    
    func startHeartRateQuery() {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else { return }
        
        if !running {
            startTimer()
        }
        
        let query = HKObserverQuery(sampleType: heartRateType, predicate: nil) { [weak self] _, completionHandler, _ in
            self?.fetchLatestHeartRate()
            completionHandler()
        }

        healthStore.execute(query)
    }
    
    func fetchLatestHeartRate() {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else { return }

        let now = Date()
        let predicate = HKQuery.predicateForSamples(withStart: now.addingTimeInterval(-60), end: now, options: .strictEndDate)

        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 1, sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)]) { [weak self] _, samples, _ in
            
            guard let sample = samples?.first as? HKQuantitySample else { return }
            let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            
            DispatchQueue.main.async {
                self?.currentHeartRate = heartRate
            }
        }

        healthStore.execute(query)
    }
    
    func pause() {
        isPauseActive = true
    }

    func resume() {
        isPauseActive = false
    }

    func togglePause() {
        if isPauseActive == false {
            pause()
        } else {
            resume()
        }
    }

    func endWork() {
        ended = true
        print("Work must end")
    }
    
    private func startTimer() {
        running = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.elapsedTime += 1.0
        }
    }
    
    private func stopTimer() {
        running = false
        timer?.invalidate()
    }
    
    @Published var heartRateDataReturned = [108, 105, 110, 112, 109, 115, 111, 117, 108, 112, 105, 120, 101, 93, 85, 80, 73, 65, 63, 67, 65, 62, 66, 63]
    
    private var heartRateTimer: Timer?
    private var currentIndex = 0
    
    func startHeartRateQuery2() {
        if !running {
            startTimer()
        }
        startHeartRateSimulation()
    }

    func startHeartRateSimulation() {
        if currentIndex < heartRateDataReturned.count {
            currentHeartRate = Double(heartRateDataReturned[currentIndex])
            currentIndex += 1
        }

        heartRateTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.currentIndex < self.heartRateDataReturned.count {
                self.currentHeartRate = Double(self.heartRateDataReturned[self.currentIndex])
                self.currentIndex += 1
            } else {
                self.currentIndex = 0
            }
        }
    }


    func stopHeartRateSimulation() {
        heartRateTimer?.invalidate()
        heartRateTimer = nil
    }
}
