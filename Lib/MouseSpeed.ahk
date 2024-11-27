#Requires AutoHotkey v2.0

; 전역 변수 선언
global speeds := [6, 8, 10, 12, 15, 17, 19]  ; 50%, 75%, 90% 에 해당하는 값
global currentSpeedIndex := 3

; SystemParametersInfo 함수에 사용될 상수
global SPI_GETMOUSESPEED := 0x0070
global SPI_SETMOUSESPEED := 0x0071

^!y::  ; Ctrl + Alt + Y
{
    global currentSpeedIndex, speeds

    ; 다음 속도 인덱스로 변경
    currentSpeedIndex := Mod(currentSpeedIndex, speeds.Length) + 1
    newSpeed := speeds[currentSpeedIndex]

    ; 마우스 속도 변경 (DllCall은 성공시 non-zero, 실패시 0을 반환)
    result := DllCall("SystemParametersInfo",
        "UInt", SPI_SETMOUSESPEED,    ; uiAction
        "UInt", 0,                    ; uiParam
        "Int", newSpeed,              ; pvParam (값을 직접 전달하므로 Int 사용)
        "UInt", 0,                    ; fWinIni
        "Int")                        ; 리턴 타입을 Int로 지정

    ; 속도값을 퍼센트로 변환
    speedPercent := Round((newSpeed / 20) * 100)

    ; 결과에 따른 툴팁 표시
    if (result != 0) {  ; non-zero는 성공을 의미
        ToolTip("마우스 속도: " speedPercent "%")
        SetTimer () => ToolTip(), -2000  ; 2초 후 툴팁 제거
    } else {
        ToolTip("마우스 속도 변경 실패")
        SetTimer () => ToolTip(), -2000
    }
}

; 스크립트 시작시 마우스 속도를 50%로 설정
InitializeScript() {
    ; 50%에 해당하는 속도(10)로 설정
    result := DllCall("SystemParametersInfo",
        "UInt", SPI_SETMOUSESPEED,    ; uiAction
        "UInt", 0,                    ; uiParam
        "Int", 10,                    ; pvParam (50%에 해당하는 값)
        "UInt", 0,                    ; fWinIni
        "Int")                        ; 리턴 타입을 Int로 지정

    if (result != 0) {
        ToolTip("마우스 속도가 50%로 초기화되었습니다.")
        SetTimer () => ToolTip(), -2000
    } else {
        ToolTip("마우스 속도 초기화 실패")
        SetTimer () => ToolTip(), -2000
    }
}

; 스크립트 초기화 실행
InitializeScript()
