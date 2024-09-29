*** Settings ***
Documentation       Dryrun test example

Resource            dryrun/select_simu.resource


*** Test Cases ***
Dummy Test
    Set Search Order If Needed
    Common Simulator User Keyword
    Log To Console    I was run
