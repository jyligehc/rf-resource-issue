*** Settings ***
Library         rfresissue.device_kws.DeviceKws

Suite Setup     Connect With Monitor


*** Keywords ***
Connect With Monitor
    [Documentation]  Connect with Device2
    Connect To    Device2
