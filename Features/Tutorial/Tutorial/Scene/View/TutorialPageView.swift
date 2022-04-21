//
//  TutorialPageView.swift
//  Tutorial
//
//  Created by Phittaya Wongsuwan on 21/4/2565 BE.
//

import SwiftUI

struct TutorialPageView: View {
    
    @ObservedObject private var viewModel: TutorialPageViewModel
    private let dotApperance = UIPageControl.appearance()
    
    init(viewModel: TutorialPageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView(selection: $viewModel.pageIndex) {
            ForEach(viewModel.tutorials) { tutorial in
                VStack {
                    Spacer()
                    TutorialView(tutorial: tutorial)
                    Spacer()
                    if tutorial == self.viewModel.tutorials.last {
                        Button("Understand",
                               action: self.viewModel.goToZero)
                            .buttonStyle(.bordered)
                    } else {
                        Button("Next",
                               action: self.viewModel.increasePage)
                    }
                    Spacer()
                }
                .tag(tutorial.tag)
            }
        }
        .animation(.easeOut, value: self.viewModel.pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            self.dotApperance.currentPageIndicatorTintColor = .black
            self.dotApperance.pageIndicatorTintColor = .gray
        }
    }
}

struct TutorialPageView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPageView(viewModel: TutorialPageViewModel())
    }
}