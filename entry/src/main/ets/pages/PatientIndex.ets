import log from '../common/cycadLog'
import { NavList, TabId } from '../component/NavItem'

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
        .width("24pv")
        .height("24pv")
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .width("65%")
        .height("30%")
        .fontColor(this.currentPos === index ? $r('app.color.orange_m') : $r('app.color.grey'))
        .textAlign(TextAlign.Center)
        .fontSize("12fp")
        .fontWeight(FontWeight.Normal)
        .fontFamily($r('app.string.HarmonyHeiTi'))
    }
    .width("100%")
    .height("100%")
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.End }) {
        Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
          TabContent()
            .tabBar(this.TabBuilder(TabId.HOME))
          TabContent()
            .tabBar(this.TabBuilder(TabId.ANALYSE))
          TabContent()
            .tabBar(this.TabBuilder(TabId.MINE))
        }
        .width("100%")
        .height("100%")
        .alignSelf(ItemAlign.Center)
        .scrollable(false)
        .barWidth("100%")
        .barHeight("48vp")
        .animationDuration(200)
        .onChange((index) => {
          this.currentPos = index;
        })
      }
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("98%")
  }

  onPageShow() {
    log.info("in PatientIndex page")
  }
}
