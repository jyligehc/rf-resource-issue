*** Settings ***
Library     rfresissue.device_kws.DeviceKws
# Resource    rfresissue/${DEVICE_NAME}_user_kws.resource


*** Test Cases ***
# Resource tests
Run Common User Keyword On Both Devices
    [Documentation]  Runs common user keyword on both devices version 2.
    Connect To    Device1
    Import Resource    rfresissue/${DEVICE_NAME}_user_kws.resource
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device1
    Connect To    Device2
    Import Resource    rfresissue/${DEVICE_NAME}_user_kws.resource
    Set Library Search Order    ${DEVICE_NAME}_user_kws.resource
    ${device} =    Common Device User Keyword
    Should Be Equal As Strings    ${device}    Device2
