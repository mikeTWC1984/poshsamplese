# File desc

Out-DataTable.ps1 is a classic powershell cmdlet, will convert arbitrary object stream into the datatable.
Out-SqlTable.cs - is a so called "binary cmdlet". This mirrors functionality of the above "classic" cmdlet. Use it as a sample for converting cmdlet to c#.
In order to write binary cmdlet add PowerShellStandard.Library nuget to your project.

# Tasks

1) (simple) - Rewrite Get-RandomTable.ps1 into C#. To Start just as static method, e.g. Util.GetRandomTable(10), but ideally as binary smdlet
 The goal is to generate System.Data.DataTable filled with random data. The parameter indicates how many rows to generate.
 Surprisingly I'm using that cmdlet quite often for quick debugging. It was written long ago and is pretty slow in it's current form.
2) (somewhat challanging) Do similar conversion for New-HtmlTable.ps1 (start with static method and then optionaly as binary cmdlet)
   The goal here is to convert System.Data.DataTable into HTML and apply conditinal styling, row number column and row banding. New-HtmlTable.ps1 has usage example. 
   Main challenge is to figure out how to supply conditinal formating function (in PS you can use some hacks, not sure how it would look like in C#). That would likely be delegate or action (in PS this would be scriptblock {} )

