//
//  CustomTabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 2/5/2565 BE.
//

#if !TESTING
import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var currentTab: Tab
    // MARK: To Animate Like Curve
    @State var yOffset: CGFloat = 0
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -80
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.1)) {
                            yOffset = 0
                        }
                    } label: {
                        VStack {
                            Image(tab.rawValue)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ? Color("Accent") : Color("Secondary"))
                            // MARK: Little Scaling Effect
                                .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                            Text(tab.rawValue)
                                .font(.footnote)
                                .foregroundColor(currentTab == tab ? Color("Accent") : Color("Secondary"))
                        } 
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 25, height: 25)
                    .offset(x: 10, y: yOffset)
                    .offset(x: indicatorOffset(width: width))
            }
        }
        .frame(height: 30)
        .padding(.bottom, 10)
        .padding([.horizontal, .top])
    }
    
    // MARK: Indicator Offset
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0 { return 0 }
        
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .search:
            return 1
        case .like:
            return 2
        case .profile:
            return 3
        case .setting:
            return 4
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(currentTab: .constant(Tab.home))
    }
}
#endif
