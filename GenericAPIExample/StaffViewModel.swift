//
//  StaffViewModel.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation
import Combine

class StaffViewModel: ObservableObject {
	
	@Published var staff = [StaffItem]()
	@Published var paginationReponse: PaginationResponse?

	let endpointUrl = URL(string:  "https://api.webdesignlab4u.com/API/MAV1/getStaff.php?clientId=Y0ZETlRwdW0xS2JicllnUXhlWFhPcUVmTTQzaVorRHhHdGlUR3prdVozZVdzVzJkcnVWem42SFhnMWUxdWtZNg==")!
	
	
	func getStaff() -> AnyPublisher<StaffResponse, Error> {
		
		let request = URLRequest(url: endpointUrl)
	
		return HTTPService.perform(request)
			.map(\.value)
			.eraseToAnyPublisher()
		
	}
	
}
