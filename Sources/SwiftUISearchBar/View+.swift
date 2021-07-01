//
//  Created by Mikiya Abe(@struuuuggle) on 2021/07/01.
//  Copyright © 2021, Mikiya Abe. All rights reserved.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
