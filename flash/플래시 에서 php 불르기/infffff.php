<?
$com =mysql_connect("localhost","jalnagacom","13383907") or die ("�������");


$status = mysql_select_db("jalnagacom");


$result1=mysql_query("select no, subject from zetyx_board_notice order by no desc limit 0,1;");


while($row1 = mysql_fetch_array($result1)){
$re1=$row1[no];

echo "no=$re1";

}




?>