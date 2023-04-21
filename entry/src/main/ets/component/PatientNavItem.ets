export interface NavItem {
  icon: Resource;
  icon_selected: Resource;
  text: Resource;
  id: number;
}

// tabId
export enum TabId {
  HOME,
  ANALYSE,
  DEVICE,
  MINE
}

export const NavList: NavItem[] = [
  {
    icon: $rawfile('home/home_nor.svg'),
    icon_selected: $rawfile('home/home_sel.svg'),
    text: $r('app.string.Index_Home'),
    id: TabId.HOME
  },
  {
    icon: $rawfile('home/analyse_nor.svg'),
    icon_selected: $rawfile('home/analyse_sel.svg'),
    text: $r('app.string.Index_Analyse'),
    id: TabId.ANALYSE
  },
  {
    icon: $rawfile('home/device_nor.svg'),
    icon_selected: $rawfile('home/device_sel.svg'),
    text: $r('app.string.Index_Device'),
    id: TabId.DEVICE
  },
  {
    icon: $rawfile('home/mine_nor.svg'),
    icon_selected: $rawfile('home/mine_sel.svg'),
    text: $r('app.string.Index_Mine'),
    id: TabId.MINE
  },
]