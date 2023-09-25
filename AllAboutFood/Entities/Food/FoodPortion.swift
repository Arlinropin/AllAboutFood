//
//  FoodPortion.swift
//  AllAboutFood
//
//  Created by Apiux on 22-09-23.
//

struct FoodPortion: Codable {
    let id: Int?
    let amount: Double?
    let dataPoints: Int?
    let gramWeight: Double?
    let minYearAcquired: Int?
    let modifier: String?
    let portionDescription: String?
    let sequenceNumber: Int?
    let measureUnit: MeasureUnit?
}
