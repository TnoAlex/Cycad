import DateInfo from '../bean/DateInfo'
import CalendarScrollItem from './CalendarScrollItem'
import moment from 'moment'

@Preview
@Component
export default struct CalendarScroll {
  private scroller: Scroller = new Scroller();
  data: DateInfo[] = [
    new DateInfo(true, '2023-4-15  10:00:00'), new DateInfo(true, '2023-4-16 10:00:00'), new DateInfo(true, '2023-4-17 10:00:00'),
    new DateInfo(false, '2023-4-18 10:00:00'), new DateInfo(true, '2023-4-19 10:00:00'), new DateInfo(true, '2023-4-20 10:00:00'),
    new DateInfo(false, '2023-4-21 10:00:00')
  ]
  private today = moment('2023-4-21 10:00:00', 'YYYY-MM-DD HH:mm:ss')
  @State title:string = "2023年4月21日星期五"

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
      alignContent: FlexAlign.Center
    }) {
      Row() {
        Image($rawfile('common/left_arrow_di.svg'))
          .width("24vp")
          .height("32vp")
          .offset({ x: "-84px", y: "0px" })
        Text(this.title)
          .width("200vp")
          .height("100%")
          .fontColor($r('app.color.grey_deep'))
          .textAlign(TextAlign.Center)
          .fontSize("14fp")
          .fontWeight(FontWeight.Medium)
          .fontFamily($r('app.string.HarmonyHeiTi'))
        Image($rawfile('common/right_arrow_di.svg'))
          .width("24vp")
          .height("32vp")
          .offset({ x: "78px", y: "0px" })
      }
      .width("100%")
      .height("20%")
      .justifyContent(FlexAlign.Center)

      Scroll(this.scroller) {
        Row({space:'2vp'}) {
          ForEach(this.data, (item: DateInfo) => {
            CalendarScrollItem({
              isToday: this.today.toString() == item.getTime().toString() ? true : false,
              isDone: item.isDone(),
              weekText: item.getWeek(),
              dayText: item.getDay()
            })
          })
        }
        .align(Alignment.Center)
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height('100%')
      }
      .width("100%")
      .height("60%")
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .align(Alignment.Center)
      .margin({top:'3vp'})
    }
    .width("100%")
    .height("100%")
    .borderRadius('20vp')
    .borderColor($r('app.color.orange_light'))
    .borderStyle(BorderStyle.Solid)
    .border({width:'2px'})
  }
}
