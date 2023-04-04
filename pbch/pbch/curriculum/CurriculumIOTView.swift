//
//  CurriculumIOTView.swift
//  pbch
//
//  Created by 문인호 on 2023/03/24.
//

import SwiftUI

struct CurriculumIOTView: View {
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
                                    Text("사물인터넷기초 > ")
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
                                Text(iot.name)
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
                                .overlay(dataSaveIOT(showModal: self.$showModal))
                                .shadow(color: Color.gray.opacity(0.4), radius: 4)
                                .position(x: geometry.size.width/2, y : geometry.size.height/2)
                        }
                        .transition(.move(edge: .bottom))
                    }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
struct CurriculumIOTView_Previews: PreviewProvider {
    static var previews: some View {
        CurriculumIOTView()
    }
}

struct dataSaveIOT: View {
    @Binding var showModal: Bool

    var body: some View {
        VStack {
            Text(iot.name)
                .font(.system(size: 20,weight: .semibold,design: .default))
                .foregroundColor(.pointColorR)
            Text(" ")
            Text("해당 과목은 커리큘럼의 마지막 과목입니다.")
            Text("해당 과목을 선택하면 자동으로 루트가 저장됩니다.")
            Text("해당 과목을 추가하시겠습니까?")
            HStack(spacing: 30){
                Button(action: {
                withAnimation {
                    self.showModal.toggle()
                }
                }, label: {
                    Text("취소")
                })
                .buttonStyle(modalCancelButton())
                Button(action: {
                withAnimation {
                    
                }
                }, label: {
                    Text("선택")
                })
                    .buttonStyle(modalConfirmButton())
                }
            }
        }
    }
