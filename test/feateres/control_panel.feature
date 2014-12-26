Feature: Control panel
  
  Anybody goes to control panel and see some 
  statistic.
  
    Scenario: anybody goes to control panel 
      When  at control panel page
      Then see element 
        And see graph 
  