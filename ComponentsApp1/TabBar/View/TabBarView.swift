//
//  TabBarView.swift
//  ComponentsApp1
//
//  Created by Phittaya Wongsuwan on 24/4/2565 BE.
//

#if !TESTING
    import Core
    import Data
    import RollingCounter
    import SwiftUI
    import Tutorial

    struct TabBarView: View {
        @EnvironmentObject var viewlaunchModel: ViewLaunchModel
        @Environment(\.colorScheme) var scheme

        @ObservedObject var viewModel: TabBarViewModel

        // animate Splash
        @State var animate: Bool = false
        @State var endSplash: Bool = false

        init(viewModel: TabBarViewModel) {
            self.viewModel = viewModel
            UITabBar.appearance().isHidden = true
        }

        var body: some View {
            ZStack {
                VStack(spacing: 0) {
                    if self.viewlaunchModel.currentPage == .tutorial {
                        TutorialPageView(viewModel: TutorialPageViewModel())
                    } else if self.viewlaunchModel.currentPage == .tabBar {
                        CustomTabView(currentTab: $viewModel.currentTab) {
                            Text("Home")
                                .tag(Tabs.home)
                            Text("Search")
                                .tag(Tabs.search)
                            Text("Map")
                                .tag(Tabs.mapMarker)
                            Text("Setting")
                                .tag(Tabs.setting)
                            ProfileTabView(viewModel: self.viewModel)
                                .tag(Tabs.profile)
                        }
                    }
                }
                .applyDominantColor()

                // splash
                ZStack {
                    AppColor.accent
                    Image("Twitter")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: animate ? .fill : .fit)
                        .frame(width: animate ? nil : 85, height: animate ? nil : 85)

                        // scaling view
                        .scaleEffect(animate ? 3 : 1)
                        // setting width to avoid over size
                        .frame(width: UIScreen.main.bounds.width)
                }
                .ignoresSafeArea(.all, edges: .all)
                .onAppear {
                    animateSplash()
                }
                // hiding view after finished...
                .opacity(endSplash ? 0 : 1)
            }
        }

        private func animateSplash() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                // can adjust speed or wait until data loads...
                withAnimation(Animation.easeOut(duration: 0.55)) {
                    animate.toggle()
                }
                withAnimation(Animation.linear(duration: 0.45)) {
                    endSplash.toggle()
                }
            }
        }
    }

    struct ProfileTabView: View {
        @ObservedObject var viewModel: TabBarViewModel

        var body: some View {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 25) {
                        Button {
                            if self.viewModel.isLogin {
                                self.viewModel.logout()
                            } else {
                                self.viewModel.login()
                            }
                        } label: {
                            Text(self.viewModel.isLogin ? "Logout" : "Login")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.blue)
                                )
                        }

                        Button {
                            self.viewModel.goRolling()
                        } label: {
                            Text("Go Rolling")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.red)
                                )
                        }

                        Button {
                            self.viewModel.seeMore()
                        } label: {
                            Text("See More")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.green)
                                )
                        }

                        Button {
                            self.viewModel.chat()
                        } label: {
                            Text("Chat")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.orange)
                                )
                        }
                    }
                    .padding(.top, 20)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

    struct TabView_Previews: PreviewProvider {
        static var previews: some View {
            TabBarView(viewModel: TabBarViewModel()).environmentObject(ViewLaunchModel())
        }
    }
#endif
