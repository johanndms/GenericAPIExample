//
//  NewsViewModel.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
	
	@Published var news = [NewsItem]()
	
	let endpointUrl = URL(string:  "https://api.webdesignlab4u.com/API/MAV1/getNews.php?clientId=Y0ZETlRwdW0xS2JicllnUXhlWFhPcUVmTTQzaVorRHhHdGlUR3prdVozZVdzVzJkcnVWem42SFhnMWUxdWtZNg==")!
	
	
	func getNews() -> AnyPublisher<NewsResponse, Error> {
		
		let request = URLRequest(url: endpointUrl)
		
		return HTTPService.perform(request)
			.map(\.value)
			.eraseToAnyPublisher()
		
	}
	
}
