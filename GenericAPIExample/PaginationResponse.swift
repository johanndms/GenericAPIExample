//
//  PaginationResponse.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation

// MARK: - PAGINATION RESPONSE MODEL
struct PaginationResponse: Codable {
	
	let requestedLimit: Int
	let requestedOffset: Int
	let pageSize: Int
	let totalResults: Int
	
	private enum CodingKeys: String, CodingKey {
		case requestedLimit = "RequestedLimit"
		case requestedOffset = "RequestedOffset"
		case pageSize = "PageSize"
		case totalResults = "TotalResults"
	}
}
