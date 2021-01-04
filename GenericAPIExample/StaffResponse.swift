//
//  Staff.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import Foundation

class StaffResponse: Decodable {
	
	let staff: [StaffItem]
	
	let status: String
	let message: String
	let paginationResponse: PaginationResponse
	
	private enum CodingKeys: String, CodingKey {
		case staff = "StaffMembers"
		case status = "status"
		case message = "message"
		case paginationResponse = "PaginationResponse"
	}
}

struct StaffItem: Decodable, Identifiable {
	
	let address: String?
	let appointmentInstructor: Bool
	let alwaysAllowDoubleBooking: Bool
	let bio: String?
	let city: String?
	let country: String?
	let email: String?
	let firstName: String
	let id: Int
	let independentContractor: Bool
	let isMale: Bool
	let lastName: String
	let mobilePhone: String?
	let name: String
	let postalCode: String?
	let classTeacher: Bool
	let sortOrder: Int
	let state: String?
	let imageUrl: String?
	
	
	private enum CodingKeys: String, CodingKey {
		
		case address = "Address"
		case appointmentInstructor = "AppointmentInstructor"
		case alwaysAllowDoubleBooking = "AlwaysAllowDoubleBooking"
		case bio = "Bio"
		case city = "City"
		case country = "Country"
		case email = "Email"
		case firstName = "FirstName"
		case id = "Id"
		case independentContractor = "IndependentContractor"
		case isMale = "IsMale"
		case lastName = "LastName"
		case mobilePhone = "MobilePhone"
		case name = "Name"
		case postalCode = "PostalCode"
		case classTeacher = "ClassTeacher"
		case sortOrder = "SortOrder"
		case state = "State"
		case imageUrl = "ImageUrl"
	
	}
	
}
