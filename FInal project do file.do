/*------------------------------------------------------------------------------------------------
|
| STUDENT ID:
| FINAL PROJECT
| Econ 306 Spring 2026 
|
| FORMATTING: All comments should be enclosed with /* comment */ OR
|             with a * at the beginning of a line (No //)
|_______________________________________________________________________________________________*/
/* HEADER */


clear all
set more off
set maxvar 100000
capture log close
capture cd "C:\Users\nolan\Desktop\Econ306FinalProject"

 
set linesize 98
log using SCF_2022_Project.smcl, replace
 
/* OPEN STATA DATASET FOR YOUR PROJECT */
use C:\Users\nolan\Downloads\Real_SCF.dta
 

 
/*------------------------------------------------------------------------------------------------
| Commands related to the following belong here
| RECODE MISSING VALUES
| IMPOSE SAMPLE RESTRICTIONS
| DEFINE AND APPLY VARIABLE LABELS
|_______________________________________________________________________________________________*/
capture drop sampling_wt
gen sampling_wt = x42001/5
svyset [pweight=sampling_wt]

*Variable Labels*
label variable x3014 "Financial Risk"
rename x3014 financial_risk
label variable x7002 "living with partner"
rename x7002 Living_with_partner



*Financial Risk Labeling*
label define financial_risk 1 "Very High Risk" 2 "Above Average Risk" 3 "Below Average Risk" 4 "Very Low Risk"
label values financial_risk financial_risk

* Sample Restrictions*
label variable x8022 "AGE"
rename x8022 AGE
keep if AGE >= 25 & AGE <= 60



label variable x8021 "sex"
rename x8021 sex

 


/*------------------------------------------------------------------------------------------------
| If you GENERATE NEW VARIABLES, put those commands below
|_______________________________________________________________________________________________*/
 
 *Partner Labeling*

gen Partnered = .
replace Partnered = 1 if Living_with_partner == 1
replace Partnered = . if Living_with_partner == 9
replace Partnered = . if Living_with_partner == 0
replace Partnered = 0 if Living_with_partner == 5
capture label drop Partnered
label define Partnered 0 "Not Living with Partner" 1 " Living with Partner"
label values Partnered Partnered
 

 gen employed = .
replace employed =1 if x4105==1 | x4105==0 
replace employed =0 if x4105==5
capture label drop employed
label define employed 0 "Not Employed" 1 "Employed"
label values employed employed


 
 
/*------------------------------------------------------------------------------------------------
| EXPLORATORY DATA ANALYSIS
|_______________________________________________________________________________________________*/
 
  misstable summarize financial_risk Partnered AGE sex employed
 tab financial_risk Partnered, col
graph bar (mean) financial_risk, over (Partnered) title("Risk Adversion by if living with a Partner") ytitle (Risk Adversion) 
graph export Partnerrisk.png, width(1360) height(900) replace
 
 
 
 
 
/*------------------------------------------------------------------------------------------------
| BASE AND ALTERNATIVE REGRESSION SPECIFICATION ESTIMATIONS
|_______________________________________________________________________________________________*/

*Regression 1
svy: regress financial_risk Partnered
estimates store model1

*Regression 2 
svy: regress financial_risk Partnered AGE
estimates store model2

*Regression 3
svy: regress financial_risk Partnered AGE employed i.sex
 estimates store model3
 
 *Regression Table
 esttab model1 model2 model3 using Project_Regression.rtf, replace stats(r2 N)

 
 
quietly log close
view SCF_2022_Project.smcl
