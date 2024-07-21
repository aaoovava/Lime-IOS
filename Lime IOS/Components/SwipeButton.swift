//
//  SwipeButton.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 04.12.2023.
//

import SwiftUI
extension CGSize {
    static var thumbSize: CGSize{
        return CGSize(width: 44, height: 44)
    }
    static var trackSize: CGSize{
        return CGSize(width: 270, height: 51)
    }
    
}
extension SwipeButton{
    func onSwipeSuccess(_ action: @escaping () -> Void)->Self{
        var this = self
        this.actionSeccsess = action
        return this
    }
}

extension Comparable
{
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

struct SwipeButton: View {
    let trackSize = CGSize.trackSize
    let thumbSize = CGSize.thumbSize
    @State private var isEnough = false
    @State private var dragOffset: CGSize = .zero;
    var actionSeccsess: (() -> Void)?
    let title: String
    var body: some View {
        ZStack(){
            
            Capsule()
                .frame (width: trackSize.width, height: trackSize.height)
            .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.17))
            Text(title)
                .font(.custom("Inter-SemiBold", size:18))
                .foregroundColor(Color(red: 0.5, green: 0.98, blue: 0.53))
            Image("Capsula")
                .frame(width: thumbSize.width,height: thumbSize.height)
                .offset(x:getClampedDragOffsetX())
                .animation(Animation.spring(response: 0.3,dampingFraction: 0.7))
                .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        handleDragChanged(value: value)
                                    }
                                    .onEnded { _ in
                                        handleDragEnded()
                                    }
                            )
            
        }
        
    }
    //helpers
    private func getClampedDragOffsetX() -> CGFloat {
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 3, trackSize.width - (thumbSize.width + 3))
        return -(trackSize.width/2 - thumbSize.width/2 - (clampedDragOffsetX))
        }
    //hendlers
    private func handleDragChanged(value:DragGesture.Value) ->Void{
        self.dragOffset = value.translation
        
        print(self.dragOffset)
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        let didReachTarget = dragWidth > targetDragWidth
        if didReachTarget{
            
            self.isEnough = true
        }
        else{
            
            self.isEnough = false
            
        }
    }
    private func handleDragEnded() ->Void{
        if self.isEnough{
            if nil != self.actionSeccsess{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                    self.actionSeccsess!()
                }
            }
        }else{
            self.dragOffset = .zero
        }
    }
}

#Preview {
    SwipeButton(title: "Увійти")
}
