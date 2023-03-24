
DoAltCode(altcode)
{
	arr := StrSplit(altcode, "")
	res := "{Alt Down}"
	for a in arr {
		res := res . "{NumPad" . a . "}"
	}
	res := res . "{Alt Up}"
	Send(res)
}

:*:\dd::
{
	DoAltcode("0183")
}
