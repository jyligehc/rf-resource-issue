*** Settings ***
Library     rfresissue.device_kws.DeviceKws
Resource    rfresissue/${DEVICE_NAME}/user_kws.resource


*** Test Cases ***
Run Common Library Keywords On Both Devices
    [Documentation]  Runs common library keywords on both devices.
    Connect To    Device1
    ${device} =    Common Device Keyword
    Should Be Equal As Strings    ${device}    Device1
    Connect To    Device2
    ${device} =    Common Device Keyword
    Should Be Equal As Strings    ${device}    Device2

Run Custom Library Keywords On Both Devices
    [Documentation]  Runs custom library keywords on both devices.
    Connect To    Device1
    ${device} =    Custom Device1 Keyword
    Should Be Equal As Strings    ${device}    Device1
    Connect To    Device2
    ${device} =    Custom Device2 Keyword
    Should Be Equal As Strings    ${device}    Device2

# Resource tests

Run Common User Keywords On Both Devices
    [Documentation]  Runs common user keywords on both devices.
    Connect To    Device1
    Import Resource    rfresissue/${DEVICE_NAME}/user_kws.resource
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device1
    Connect To    Device2
    Import Resource    rfresissue/${DEVICE_NAME}/user_kws.resource
    Set Library Search Order    user_kws.resource
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device2

Run Custom User Keywords On Both Devices
    [Documentation]  Runs common user keyword on both devices.
    Connect To    Device1
    Import Resource    rfresissue/${DEVICE_NAME}/user_kws.resource
    ${device} =    Custom Device1 User Keyword
    Should Be Equal As Strings    ${device}    Device1
    Connect To    Device2
    Import Resource    rfresissue/${DEVICE_NAME}/user_kws.resource
    ${device} =    Custom Device2 User Keyword
    Should Be Equal As Strings    ${device}    Device2
