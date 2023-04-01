//
//  CurriculumJavaView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/13.
//

import SwiftUI

struct CurriculumJavaView: View {
    @State var showModal: Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    VStack(alignment: .leading, spacing: 50){
                        Image("skhuazbanner")
                            .ignoresSafeArea()
                        VStack(alignment: .leading, spacing: 1){
                            VStack(alignment: .leading, spacing: 1){
                                HStack{
                                    Spacer().frame(width: 43, height: 10)
                                    Button {
                                        print("java")
                                    } label: {
                                        Text("소프트웨어공학전공")
                                    }
                                    .buttonStyle(highlightButton())
                                }
                                HStack{
                                    Spacer().frame(width: 40, height: 10)
                                    Text("자바프로그래밍 > ")
                                        .font(.system(size: 10))
                                        .padding()
                                }
                            }
                        }
                        HStack(spacing: 20){
                            Spacer()
                            NavigationLink {
                                CurriculumJavaView()
                            } label: {
                                Text("자료구조")
                            }
                            .buttonStyle(redSubjecButton())
                                NavigationLink {
                                    CurriculumJavaView()
                                } label: {
                                    Text("네트워크 프로그래밍")
                                }
                                .buttonStyle(redSubjecButton())
                                Spacer()
                            }
                            HStack(spacing: 20){
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        self.showModal.toggle()
                                    }
                                }, label:
                                        {
                                    Text("프론트엔드개발")
                                })
                                .buttonStyle(redSubjecButton())
                                NavigationLink {
                                    CurriculumJavaView()
                                } label: {
                                    Text("웹프로그래밍")
                                }
                                .buttonStyle(redSubjecButton())
                                Spacer()
                            }
                            HStack(spacing: 20){
                                Spacer()
                                NavigationLink {
                                    CurriculumJavaView()
                                } label: {
                                    Text("모바일프로그래밍")
                                }
                                .buttonStyle(redSubjecButton())
                                NavigationLink {
                                    CurriculumJavaView()
                                } label: {
                                    Text("자바프로젝트")
                                }
                                .buttonStyle(redSubjecButton())
                                Spacer()
                            }
                            HStack{
                                Spacer().frame(width: 43, height: 10)
                                NavigationLink {
                                    CurriculumJavaView()
                                } label: {
                                    Text("고급자바프로그래밍")
                                }
                                .buttonStyle(redSubjecButton())
                            }
                        }
                    
                    }
                if showModal {
                    Rectangle() // the semi-transparent overlay
                        .foregroundColor(Color.black.opacity(0.5))
                        .edgesIgnoringSafeArea(.all)

                    GeometryReader { geometry in // the modal container
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/5*4, height: geometry.size.height/3, alignment: .center)
                            .overlay(warningAlertView(showModal: self.$showModal))
                            .shadow(color: Color.gray.opacity(0.4), radius: 4)
                            .position(x: geometry.size.width/2, y : geometry.size.height/2)
                    }
                    .transition(.move(edge: .bottom))
                }
                
            }
            }
        .navigationViewStyle(StackNavigationViewStyle())
        }
    }
struct CurriculumJavaView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumJavaView()
    }
}

