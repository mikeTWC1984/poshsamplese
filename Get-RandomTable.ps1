
function Get-RandomTable { param($rc)

if(!$rc){$rc = 10}

$dt = New-Object System.Data.DataTable
$dt.TableName = "Person"

$male_first = "James John Robert Michael William David Richard Joseph Thomas Charles Christopher Daniel Matthew Anthony Donald Mark Paul Steven Andrew Kenneth George Joshua Kevin Brian Edward Ronald Timothy Jason Jeffrey Ryan Gary Jacob Nicholas Eric Stephen Jonathan Larry Justin Scott Frank Brandon Raymond Gregory Benjamin Samuel Patrick Alexander Jack Dennis Jerry Tyler Aaron Henry Douglas Jose Peter Adam Zachary Nathan Walter Harold Kyle Carl Arthur Gerald Roger Keith Jeremy Terry Lawrence Sean Christian Albert Joe Ethan Austin Jesse Willie Billy Bryan Bruce Jordan Ralph Roy Noah Dylan Eugene Wayne Alan Juan Louis Russell Gabriel Randy Philip Harry Vincent Bobby Johnny Logan"
$female_first = "Mary Patricia Jennifer Elizabeth Linda Barbara Susan Jessica Margaret Sarah Karen Nancy Betty Lisa Dorothy Sandra Ashley Kimberly Donna Carol Michelle Emily Amanda Helen Melissa Deborah Stephanie Laura Rebecca Sharon Cynthia Kathleen Amy Shirley Anna Angela Ruth Brenda Pamela Nicole Katherine Virginia Catherine Christine Samantha Debra Janet Rachel Carolyn Emma Maria Heather Diane Julie Joyce Evelyn Frances Joan Christina Kelly Victoria Lauren Martha Judith Cheryl Megan Andrea Ann Alice Jean Doris Jacqueline Kathryn Hannah Olivia Gloria Marie Teresa Sara Janice Julia Grace Judy Theresa Rose Beverly Denise Marilyn Amber Madison Danielle Brittany Diana Abigail Jane Natalie Lori Tiffany Alexis Kayla"
$last_name = "SMITH JOHNSON WILLIAMS BROWN JONES MILLER DAVIS GARCIA RODRIGUEZ WILSON MARTINEZ ANDERSON TAYLOR THOMAS HERNANDEZ MOORE MARTIN JACKSON THOMPSON WHITE LOPEZ LEE GONZALEZ HARRIS CLARK LEWIS ROBINSON WALKER PEREZ HALL YOUNG ALLEN SANCHEZ WRIGHT KING SCOTT GREEN BAKER ADAMS NELSON HILL RAMIREZ CAMPBELL MITCHELL ROBERTS CARTER PHILLIPS EVANS TURNER TORRES PARKER COLLINS EDWARDS STEWART FLORES MORRIS NGUYEN MURPHY RIVERA COOK ROGERS MORGAN PETERSON COOPER REED BAILEY BELL GOMEZ KELLY HOWARD WARD COX DIAZ RICHARDSON WOOD WATSON BROOKS BENNETT GRAY JAMES REYES CRUZ HUGHES PRICE MYERS LONG FOSTER SANDERS ROSS MORALES POWELL SULLIVAN RUSSELL ORTIZ JENKINS GUTIERREZ PERRY BUTLER BARNES FISHER HENDERSON COLEMAN SIMMONS PATTERSON JORDAN REYNOLDS HAMILTON GRAHAM KIM GONZALES ALEXANDER RAMOS WALLACE GRIFFIN WEST COLE HAYES CHAVEZ GIBSON BRYANT ELLIS STEVENS MURRAY FORD MARSHALL OWENS MCDONALD HARRISON RUIZ KENNEDY WELLS ALVAREZ WOODS MENDOZA CASTILLO OLSON WEBB WASHINGTON TUCKER FREEMAN BURNS HENRY VASQUEZ SNYDER SIMPSON CRAWFORD JIMENEZ PORTER MASON SHAW GORDON WAGNER HUNTER ROMERO HICKS DIXON HUNT PALMER ROBERTSON BLACK HOLMES STONE MEYER BOYD MILLS WARREN FOX ROSE RICE MORENO SCHMIDT PATEL FERGUSON NICHOLS HERRERA MEDINA RYAN FERNANDEZ WEAVER DANIELS STEPHENS GARDNER PAYNE KELLEY DUNN PIERCE ARNOLD TRAN SPENCER PETERS HAWKINS GRANT HANSEN CASTRO HOFFMAN HART ELLIOTT CUNNINGHAM KNIGHT"
$street = "Main St,Church St,Main Street North,Main Street South,Elm St,High St,Main Street West,Washington St,Main Street East,Park Avenue,Walnut St,2nd St,Chestnut St,Maple Avenue,Broad St,Maple St,Oak St,Center St,Pine St,River Rd,Market St,Water St,South St,Union St,3rd St,Park St,Cherry St,Washington Avenue,4th St,Court St,Highland Avenue,North St,Mill St,Franklin St,Prospect St,School St,Spring St,Central Avenue,1st St,State St,Front St,West St,Jefferson St,Cedar St,Jackson St,Bridge St,Locust St,Park Place,Madison Avenue,Meadow Lane,Ridge Rd,Spruce St,5th St,Grove St,Pearl St,Lincoln St,Dogwood Dr,Madison St,Pennsylvania Avenue,Pleasant St,4th Street West,Adams St,Jefferson Avenue,Lincoln Avenue,3rd Street West,7th St,Academy St,11th St,2nd Avenue,East St,Green St,Route 1,12th St,5th Avenue,6th St,9th St,Cherry Lane,Elizabeth St,Hickory Lane,River St,Summit Avenue,10th St,Charles St,Hill St,Virginia Avenue,1st Avenue,Colonial Dr,Fairway Dr,Liberty St,Monroe St,2nd Street West,3rd Avenue,Broadway,Church Rd,Delaware Avenue,Route 30,Valley Rd,Vine St,Winding Way,Woodland Dr,6th Street West,Brookside Dr,Lake St,Prospect Avenue,Sunset Dr,13th St,4th Avenue,College St,Dogwood Lane,Hillside Avenue,Mill Rd,5th Street North,7th Avenue,8th St,Division St,Harrison St,Lakeview Dr,Laurel Lane,New St,Oak Lane,Railroad St,Willow St,5th Street West,6th Avenue,Beech St,Clinton St,George St,Hillcrest Dr,Laurel St,Park Dr,Penn St,Primrose Lane,Railroad Avenue,Riverside Dr,Route 32,Route 6,Sherwood Dr,Summit St,4th Street North,Buckingham Dr,Cedar Lane,Durham Rd,Grant St,Heather Lane,Hillside Dr,Holly Dr,King St,Lafayette Avenue,Poplar St,2nd Street East,6th Street North,7th Street East,Berkshire Dr,Circle Dr,Clark St,College Avenue,Elm Avenue,Essex Court,Franklin Avenue,Front Street North,Highland Dr,Hilltop Rd,James St,Linden St,Mulberry St,Ridge Avenue,Route 10,Route 29,Surrey Lane,Walnut Avenue,Warren St,Williams St,Wood St"
$state = "AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY"
$city = "Washington,Springfield,Franklin,Lebanon,Clinton,Greenville,Bristol,Fairview,Salem,Madison,Georgetown,Arlington,Ashland,Dover,Oxford,Jackson,Burlington,Manchester,Milton,Newport,Auburn,Centerville,Clayton,Dayton,Lexington,Milford,Mount,Vernon,Oakland,Winchester,Cleveland,Hudson,Kingston,Riverside,Huntersville,Charlotte,Harrisburg,New York,Las Vegas,Jersey City,Dallas,Los Angeles,Phoenix,Atlanta,Boston,Washington DC"

$ln = (Get-Culture).TextInfo.ToTitleCase($last_name.ToLower()).Split(" ")
$mf = $male_first.Split(" ")
$ff = $female_first.Split(" ")
$str = $street.Split(",")
$st = $state.Split(" ")
$ct = $city.Split(",")

function get-person { $p = [ordered]@{}
$p.ID = 100000000 + (Get-Random 90000000)
$p.account = 1000000 + (Get-Random 1000000)
$p.Last_Name = $ln[(get-random $ln.Count)]
$p.First_Name = if($p.gender -eq "M"){$mf[(Get-Random $mf.Count)]}else{$ff[(Get-Random $ff.Count)]}
$p.middle = [String]([char] (65 + (Get-Random 26) ))
$p.gender =  @("M", "F")[(Get-Random 2)] 
$p.phone = (3470000000 + (Get-Random 5000000000)).ToString("000-000-0000")
$p.dob = [datetime](get-date).AddDays(-(16*365+(get-random (60*365)))).ToString("yyyy-MM-dd")
$p.age = [math]::Floor(((get-date) - $p.dob).TotalDays/365)
$p.rate = (Get-Random 1000)/1017
$p.amount = [math]::Round(200/(10 + (Get-Random 17)),2)
$p.balance = [math]::Round(200/(10 + (Get-Random 17)),4)
$p.ls_updt = (Get-Date).AddSeconds(-(get-random 10000))
$p.zip = 10000 + (Get-Random 80000)
$p.Street = $str[(get-random $str.Count)]
$p.State = $st[(get-random $st.Count)]
$p.strNum = 1 + (Get-Random 10000)

return $p}

$pc = get-person
$cols = $pc.Keys
foreach($k in $cols){ $dt.Columns.Add($k, $pc.$k.GetType().Name) | Out-Null}

foreach($i in 1..$rc) {
$p = get-person
$dt.Rows.Add($p[$cols]) | Out-Null

}

return (, $dt)

}

