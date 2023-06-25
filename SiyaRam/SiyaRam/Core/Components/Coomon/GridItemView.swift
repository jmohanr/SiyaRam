//
//  GridItemView.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI

enum SrcType {
    case Image
    case Gif
    case Video
}

struct PostData {
    var src: String
    var srcType: SrcType
}

struct GridItemView: View {
    
    @State var numberOfGrids:CGFloat  = 2
    @State var gridItems: [GridItem] = []
    var postData: [PostData] = [PostData(src: "2", srcType: .Image),
                                PostData(src: "3", srcType: .Video),
                                PostData(src: "4", srcType: .Image),
                                PostData(src: "5", srcType: .Gif),
                                PostData(src: "6", srcType: .Image),
                                PostData(src: "7", srcType: .Image),
                                PostData(src: "1", srcType: .Image),
                                PostData(src: "8", srcType: .Video),
                                PostData(src: "9", srcType: .Image),
                                PostData(src: "10", srcType: .Gif),
                                PostData(src: "11", srcType: .Image),
                                PostData(src: "12", srcType: .Image)]
    
    
    
    var body: some View {
        
        VStack(alignment:.trailing){
            ScrollView {
               LazyVGrid(columns: gridItems,pinnedViews: [.sectionHeaders,.sectionFooters]) {
                    Section {
                        ForEach(postData,id: \.src) { item in
                            Image(item.src).resizable()
                                .scaledToFill()
                                .frame(maxWidth: (UIScreen.screenWidth/numberOfGrids)-1,maxHeight: (UIScreen.screenWidth/numberOfGrids)-1)
                                .clipped()
                        }
                    } header: {
//                        headerView()
                    } footer: {
                        headerView()
                    }
     
                }
            }
            .padding(.horizontal,5)
            .onAppear {
                gridItems = Array(repeating: GridItem(.flexible()), count: Int(numberOfGrids))
            }
        }
    }
    func headerView() -> some View {
        return VStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray,lineWidth: 1)
                .frame(width: UIScreen.screenWidth/2,height: 40)
                .overlay {
                    HStack (spacing: 25) {
                        Button {
                            numberOfGrids = 1
                            gridItems =   Array(repeating: GridItem(.flexible()), count: Int(numberOfGrids))
                            
                        } label: {
                            Image(systemName: "square.fill")
                                .resizable()
                                .scaledToFit()
                        }
                        Button {
                            numberOfGrids = 2
                            gridItems =   Array(repeating: GridItem(.flexible()), count: Int(numberOfGrids))
                            
                        } label: {
                            Image(systemName: "square.grid.2x2.fill")
                                .resizable()
                                .scaledToFit()
                        }
                        Button {
                            numberOfGrids = 3
                            gridItems =   Array(repeating: GridItem(.flexible()), count: Int(numberOfGrids))
                        } label: {
                            Image(systemName: "square.grid.3x2.fill")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding(5)
                }.tint(.black)
                .background {
                    Color.white
                }
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView()
    }
}
