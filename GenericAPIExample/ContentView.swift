//
//  ContentView.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
	
	@StateObject var staffVM = StaffViewModel()
	@State var cancellables = Set<AnyCancellable>()
	
	
    var body: some View {
		
		VStack {

			List(staffVM.staff) { teacher in
			
				HStack {
					Text(teacher.firstName)
					Text(teacher.lastName)
				}
				
			}
		
			Text("Found \(staffVM.paginationReponse?.totalResults ?? 0) teachers")
			
		}.onAppear(perform: {
			staffVM.getStaff()
				.sink(
					receiveCompletion: {completion in
						print("Completion: \(completion)")
					},
					receiveValue: { value in
						self.staffVM.staff = value.staff
						self.staffVM.paginationReponse = value.paginationResponse
					}
				)
				.store(in: &cancellables)
				
		})
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
