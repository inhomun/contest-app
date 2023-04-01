//
//  CurriculumWebDevLastView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/23.
//

import SwiftUI

struct CurriculumWebDevLastView: View {
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
                                    Text("웹개발입문 > 웹프로그래밍 > ")
                                        .font(.system(size: 10))
                                        .padding()
                                }
                            }
                        }
                            HStack(spacing: 20){
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        self.showModal.toggle()
                                    }
                                }, label:
                                        {
                                    Text(backendFramework.name)
                                })
                                .buttonStyle(redSubjecButton())
                                Spacer()
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

struct CurriculumWebDevLastView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumWebDevLastView()
    }
}
