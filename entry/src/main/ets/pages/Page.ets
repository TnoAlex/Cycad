import CalendarScroll from '../component/CalendarScroll'
import CalendarScrollItem from '../component/CalendarScrollItem'

@Entry
@Component
struct Page {
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.End }) {

      Column() {
        Column() {
          Text("示例文本")
            .width("100%")
            .height("30%")
            .fontColor($r('app.color.grey'))
            .padding({ left: "20vp" })
            .textAlign(TextAlign.Start)
            .fontSize("25fp")
            .fontWeight(FontWeight.Medium)
            .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
          Text("示例文本")
            .width("100%")
            .height("30%")
            .fontColor($r('app.color.black'))
            .padding({ left: "20vp" })
            .fontSize("35fp")
            .fontWeight(FontWeight.Bolder)
        }
        .width("100%")
        .height("100%")
        .borderRadius({ bottomLeft: "60vp" })
        .backgroundColor($r('app.color.gery_light_l'))
        .opacity(1)
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)
      }
      .width("100%")
      .height("20%")
      .backgroundColor($r('app.color.start_window_background'))
      Column() {
        Column(){
          CalendarScroll()
//          CalendarScrollItem({isDone:true,isToday:false,weekText:"一",dayText:'13'})
//            .align(Alignment.TopStart)
            .width('90%')
            .height('120pv')
            .margin({top:'10vp'})
        }
        .align(Alignment.Center)
          .width("100%")
          .height("100%")
          .borderRadius({ bottomRight: "0", bottomLeft: "70vp", topRight: "60vp" })
          .backgroundColor($r('app.color.start_window_background'))
      }
      .width("100%")
      .height("60%")
      .backgroundColor($r('app.color.gery_light_l'))
      .opacity(1)
      Column() {
        Column()
          .width("100%")
          .height("100%")
          .borderRadius({ topRight: "70vp" })
          .backgroundColor($r('app.color.gery_light_l'))
          .opacity(1)
      }
      .width("100%")
      .height("20%")
      .backgroundColor($r('app.color.start_window_background'))
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r('app.color.start_window_background'))
    .opacity(1)
  }
}