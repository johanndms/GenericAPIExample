//
//  ContentView.swift
//  GenericAPIExample
//
//  Created by Johann Muller on 04.01.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
	
	@ObservedObject var staffVM = StaffViewModel
	
    var body: some View {
		
		List(staffVM.staff) { teacher in
			
			Text(teacher.firstName)
			
		}.onAppear(perform: staffVM.getStaff())
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
