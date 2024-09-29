*** Settings ***
Resource    dryrun/sim_${SIM_TYPE}.resource


*** Keywords ***
Set Search Order If Needed
    [Documentation]    Check if Resource search order needs to be checked.
    [Arguments]    ${possibility_of_two_sim_types}=True
    IF    ${possibility_of_two_sim_types}    Set Resource Search Order

Set Resource Search Order
    [Documentation]    Set resource search order based on used Simulator type
    Import Resource    dryrun/sim_${SIM_TYPE}.resource
    Set Library Search Order    sim_${SIM_TYPE}
