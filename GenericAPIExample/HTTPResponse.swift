//
//  APIService.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation
import Combine


struct HTTPClient {
	
	struct HTTPResponse<T> {
		let value: T
		let response: URLResponse
	}
	
	func perform<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<HTTPResponse<T>, Error> {
		return URLSession.shared.dataTaskPublisher(for: request)
			//.retry(3)
			.tryMap { result -> HTTPResponse<T> in
				let value = try decoder.decode(T.self, from: result.data)
				return HTTPResponse(value: value, response: result.response)
			}
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}
}
