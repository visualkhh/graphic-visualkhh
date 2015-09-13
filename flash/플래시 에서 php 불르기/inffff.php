<?
$com =mysql_connect("localhost","jalnagacom","13383907") or die ("연결실패");


$status = mysql_select_db("jalnagacom");


$result1=mysql_query("select no, subject from zetyx_board_notice order by no desc limit 0,4;");


while($row1 = mysql_fetch_array($result1)){
$re1=$row1[subject];



}
$date =$re1;
$date_array = explode(">",$date);


$hh =explode("<",$date_array[1]);
$year = $date_array[0];
$month = $hh[0];
$day = $date_array[2];


echo "r4=$month";


?>