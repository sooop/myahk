my_str := ["responsibility@smtown.com", "qxtrade.kr", "qxplan2@gmail.com"]

CB_Close(gui) {
	;ExitApp()
}

CB_Select(lv, num) {
	mygui.Hide()
	Send("{Text}" . my_str[num])
}
mygui := Gui()
LV := mygui.Add("ListView", "R20 W400", ["User ID",])
for x in my_str
	LV.Add(, x)

mygui.onEvent("Close", CB_Close)
LV.onEvent("DoubleClick", CB_Select)


^+]::
{
	mygui.Show()
}

!+]::{
	ExitApp()
}
