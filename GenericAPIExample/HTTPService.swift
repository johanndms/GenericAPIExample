//
//  APIService.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation
import Combine


class HTTPService {
	
	struct HTTPServiceResponse<T> {
		let value: T
		let response: URLResponse
	}
	
	static func perform<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<HTTPServiceResponse<T>, Error> {
		return URLSession.shared.dataTaskPublisher(for: request)
			.retry(3)
			.tryMap { result -> HTTPServiceResponse<T> in
				let value = try decoder.decode(T.self, from: result.data)
				return HTTPServiceResponse(value: value, response: result.response)
			}
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
}
