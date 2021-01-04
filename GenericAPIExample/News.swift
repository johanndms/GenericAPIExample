//
//  News.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation

// MARK: - NEWS RESPONSE MODEL
struct NewsResponse: Decodable {
	
	let news: [NewsItem]
	
	let status: String
	let message: String
	let paginationResponse: PaginationResponse
	
	private enum CodingKeys: String, CodingKey {
		case news = "news"
		case status = "status"
		case message = "message"
		case paginationResponse = "PaginationResponse"
	}
	
}



// MARK: - NEWS ITEM MODEL
struct NewsItem: Decodable, Identifiable {
	
	let id: Int
	let url: String
	let link: String
	
}
