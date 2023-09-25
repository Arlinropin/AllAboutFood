//
//  NutrientAnalysisDetails.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//
import Foundation

struct NutrientAnalysisDetails: Codable {
    let subSampleId: Int?
    let amount: Float?
    let nutrientId: Int?
    let labMethodDescription: String?
    let labMethodOriginalDescription: String?
    let labMethodLink: URL
    let labMethodTechnique: String
    let nutrientAcquisitionDetails: NutrientAcquisitionDetails?
}

