//
//  PasswordRuleCell.swift
//  LPLoginApp
//
//  Created by Dipak Pandey on 05/05/21.
//

import SwiftUI

struct PasswordRuleCell: View {
    let rule: PasswordRule
    
    init(rule: PasswordRule) {
        self.rule = rule
    }
    
    var body: some View {
        
        VStack() {
             
             HStack() {
                ZStack(alignment: .center) {
                    if rule.isSatisfied {
                        Image(Constants.Images.EllipseSelected)
                    } else {
                        Image(Constants.Images.Ellipse)
                    }
                    Image(Constants.Images.RightTick)

                }

                Text(rule.name)
                     .font(.custom(Constants.AppFont.PrimaryFont, size: 11))
                     .foregroundColor(.secondaryTextColor)
                    .padding(.leading, 8)
                 
             }
            
        }
    }
}

struct PasswordRuleCell_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRuleCell(rule: PasswordRule.init(name: "Rule", isSatisfied: true))
    }
}
