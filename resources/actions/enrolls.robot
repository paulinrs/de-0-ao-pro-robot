***Settings***

Documentation    Ações da funcionalidade de gestão de matrículas



***Keywords***

Select Student
    [Arguments]    ${name}

    Fill text    css=input[aria-label=student_id]       ${name}
    Click        css=div[id*=option] >> text=${name}

Select Plan
    [Arguments]    ${title}

    Fill text    css=input[aria-label=plan_id]           ${title}
    Click        css=div[id*=option] >> text=${title}


Save Registration

    click           //button[@form='formEnrollment']

Go To Form Enrolls
    Set Strict Mode            False
    click                      css=a[href$="matriculas/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula    Visible    5

Start Date Shold Today    

    ${start_date}       Get Current Date            result_format=%d/%m/20%y

    Get Attribute       css=[name=start_date]       value       Equal       ${start_date} 

End Date Shold Be   
    [Arguments]         ${days}

    ${current_date}     Get Current Date
    ${end_date}         Add Time To Date    ${current_date}     ${days} days     result_format=%d/%m/20%y

    Get Attribute    css=[name=end_date]       value       Equal       ${end_date}    
    
No Records Found    
    [Arguments]    ${title}

    Fill text    css=input[aria-label=plan_id]           ${title}
    Wait For Elements State         xpath=//h1[contains(.,'Nova matrícula')]         Visible    5

Search Plan Enrolls 

    [Arguments]     ${name}       
    Fill Text       css=input[placeholder="Buscar plano"]    ${name} 
    Wait For Elements State         xpath=//td[contains(.,'${name}')]   

    


