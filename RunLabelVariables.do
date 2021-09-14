

global clear all
clear all
set more off

if "`c(username)'" == "Benjamin" {
global hdir "D:\Dropbox\Pirates\PaperwithBen\Work"
}
*

if "`c(username)'" == "benbl" {
global hdir "C:\Users\benbl\Dropbox\Pirates\PaperWithBen\Work"
}
*


foreach suffix in ta taAdminLevel_t1 taAdminLevelWeekBalanced_t1 {

use $hdir\Build\Temp\MergedDa`suffix'.dta, replace

cd $hdir\Build\Code
do LabelVariables.do, nostop

save $hdir\Build\Output\AnalysisFileDa`suffix'.dta, replace

save $hdir\Analysis\Input\AnalysisFileDa`suffix'.dta, replace

}
*

local i = 1
foreach x in \Build\Temp\MergedDataAggregate ///
	\Build\Temp\dOceanLevelAnalysis {

	
use $hdir`x'.dta, clear

cd $hdir\Build\Code
do LabelVariables.do, nostop

if `i' == 1 {
save $hdir\Build\Output\AnalysisFileAggregate.dta, replace

save $hdir\Analysis\Input\AnalysisFileAggregate.dta, replace
}
*

if `i' == 2 {
save $hdir\Build\Output\AnalysisFileOcean.dta, replace

save $hdir\Analysis\Input\AnalysisFileOcean.dta, replace
}
*
local ++i
*/
}
*
