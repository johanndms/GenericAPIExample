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

	let httpClient = HTTPClient()
	let endpointUrl = URL(string:  "https://api.webdesignlab4u.com/API/MAV1/getStaff.php?clientId=NGtNcXRVbkNFdnh5VUJheXQ2TC9kNk5aK01zS2dGUlk5VVNjYkI5TmpHeWhmai9ReEhiciszdlBCWUwrQmtDMQ==")!
	
	
	func getStaff() -> AnyPublisher<[StaffResponse], Error> {
		
		print(endpointUrl)
		
		let request = URLRequest(url: endpointUrl)
	
		return httpClient.perform(request)
			.map(\.value)
			.eraseToAnyPublisher()
		
	}
	
}
