*** Settings ***
Library     rfresissue.device_kws.DeviceKws
Resource    rfresissue/${DEVICE_NAME}/user_kws.resource


*** Test Cases ***
Run Common Keyword On Device Two
    [Documentation]  Runs common keyword on device2.
    ${device} =    Common Device Keyword
    Should Be Equal As Strings    ${device}    Device2

Run Custom Keyword On Device Two
    [Documentation]  Runs custom keyword on device2.
    ${device} =    Custom Device2 Keyword
    Should Be Equal As Strings    ${device}    Device2

Run Common User Keyword On Device Two
    [Documentation]  Runs common keyword on device2.
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device2

Run Custom User Keyword On Device Two
    [Documentation]  Runs common keyword on device2.
    ${device} =    Custom Device2 User Keyword
    Should Be Equal As Strings    ${device}    Device2
