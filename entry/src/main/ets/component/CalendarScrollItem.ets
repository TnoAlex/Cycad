@Preview
@Component
export default struct CalendarScrollItem {
  @Prop isToday: boolean
  @Prop isDone: boolean
  @Prop weekText: string
  @Prop dayText: string

  private getBackGround(){
    if (this.isToday && this.isDone)
      return $rawfile('home/task_done.png')
    else if (this.isToday && !this.isDone)
      return $rawfile('home/task_undone.png')
    else if (!this.isToday && this.isDone)
      return $rawfile('home/task_done_fill.png')
    else
      return $rawfile('home/task_undone_fill.png')
  }

  private getFontColor() {
    if (this.isToday) {
      return $r('app.color.grey_deep')
    } else {
      return $r('app.color.start_window_background')
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Column() {
        Text(this.weekText)
          .width("100%")
          .height("50%")
          .fontColor(this.getFontColor())
          .padding({ top: "10vp" })
          .textAlign(TextAlign.Center)
          .fontSize("12fp")
          .fontWeight(FontWeight.Bold)
          .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
        Text(this.dayText)
          .width("100%")
          .height("50%")
          .fontColor(this.getFontColor())
          .padding({ bottom: "10vp" })
          .textAlign(TextAlign.Center)
          .fontSize("18fp")
          .fontWeight(FontWeight.Bold)
          .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
      }
      .width("100%")
      .height("100%")
      .backgroundImage(this.getBackGround(),ImageRepeat.NoRepeat)
      .backgroundImageSize(ImageSize.Contain)
//      .backgroundColor($r('app.color.black'))
      .justifyContent(FlexAlign.Center)
    }
    .width("50vp")
    .height("64vp")
  }
}
