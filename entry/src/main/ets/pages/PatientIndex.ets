import log from '../common/cycadLog'
import { NavList, TabId } from '../component/PatientNavItem'
import PatientMain from '../component/PatientMain'
@Entry
@Component
struct PatientIndex {
  @State currentPos: number = 0
  private tabController: TabsController = new TabsController()

  @Builder TabBuilder(index: number) {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceAround,
      alignItems: ItemAlign.Center,
      alignContent: FlexAlign.Start
    }) {
      Image(this.currentPos == index ? NavList[index].icon_selected : NavList[index].icon)
        .width("29pv")
        .height("29pv")
        .padding({top:'2vp'})
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .width("65%")
        .height("30%")
        .fontColor(this.currentPos === index ? $r('app.color.orange_m') : $r('app.color.grey'))
        .textAlign(TextAlign.Center)
        .fontSize("10fp")
        .padding({top:'2vp'})
        .fontWeight(FontWeight.Normal)
        .fontFamily($r('app.string.HarmonyHeiTi'))
    }
    .width("100%")
    .height("100%")
    .align(Alignment.Center)
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.End }) {
        Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
          TabContent(){
            PatientMain()
              .backgroundColor($r('app.color.start_window_background'))
          }
          .backgroundColor($r('app.color.start_window_background'))
            .tabBar(this.TabBuilder(TabId.HOME))
          TabContent()
            .tabBar(this.TabBuilder(TabId.ANALYSE))
          TabContent()
            .tabBar(this.TabBuilder(TabId.DEVICE))
          TabContent()
            .tabBar(this.TabBuilder(TabId.MINE))
        }
        .width("100%")
        .height("100%")
        .alignSelf(ItemAlign.Center)
        .scrollable(false)
        .barWidth("100%")
        .barHeight("44vp")
        .animationDuration(200)
        .align(Alignment.Bottom)
        .onChange((index) => {
          this.currentPos = index;
        })
      }
      .width("100%")
      .height("100%")
      .align(Alignment.Bottom)
    }
    .width("100%")
    .height("99%")
    .backgroundColor($r('app.color.start_window_background'))
  }

  onPageShow() {
    log.info("in PatientIndex page")
  }
}
