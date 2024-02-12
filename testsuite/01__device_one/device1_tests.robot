*** Settings ***
Library     rfresissue.device_kws.DeviceKws
Resource    rfresissue/${DEVICE_NAME}/user_kws.resource


*** Test Cases ***
Run Common Library Keyword On Device One
    [Documentation]  Runs common keyword on device1.
    ${device} =    Common Device Keyword
    Should Be Equal As Strings    ${device}    Device1

Run Custom Library Keyword On Device One
    [Documentation]  Runs custom keyword on device1.
    ${device} =    Custom Device1 Keyword
    Should Be Equal As Strings    ${device}    Device1

Run Common User Keyword On Device One
    [Documentation]  Runs common keyword on device1.
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device1

Run Custom User Keyword On Device One
    [Documentation]  Runs common keyword on device1.
    ${device} =    Custom Device1 User Keyword
    Should Be Equal As Strings    ${device}    Device1
