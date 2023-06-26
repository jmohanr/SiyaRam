//
//  GridItemView.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI
import Kingfisher

enum SrcType: Codable {
    case Image
    case Gif
    case Video
}

struct GridItemView: View {
    
    @State var numberOfGrids:CGFloat  = 2
    @State var gridItems: [GridItem] = []
    
    @ObservedObject var vieModel: PostGridViewModel
    
    init(user: User) {
        self._vieModel = ObservedObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    var body: some View {
        
        VStack(alignment:.trailing){
            ScrollView {
               LazyVGrid(columns: gridItems,pinnedViews: [.sectionHeaders,.sectionFooters]) {
                    Section {
                        ForEach(vieModel.feeds,id: \.id) { item in
                            KFImage(URL(string: item.src)).resizable()
                                .scaledToFill()
                                .frame(maxWidth: (UIScreen.screenWidth/numberOfGrids)-1,maxHeight: (UIScreen.screenWidth/numberOfGrids)-1)
                                .clipped()
                        }
                    } header: {
                        headerView()
                       
                    } footer: {
//                        headerView()
                    }
                }.isHidden(vieModel.feeds.count > 0 ? false:true, remove: vieModel.feeds.count > 0 ? false:true)
                if vieModel.feeds.count <= 0 {
                    nodataView()
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
    
    func nodataView() -> some View {
        return Text("No Posts are available")
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(user: User(id: "", emailId: "", userName: ""))
    }
}
