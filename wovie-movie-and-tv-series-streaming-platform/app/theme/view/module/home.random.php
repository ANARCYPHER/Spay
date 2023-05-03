<?php  
if(!$ModuleData['sorting']) {
$OrderBy = 'id DESC';
}else{
$OrderBy = $ModuleData['sorting'];
}
$Randoms = $this->db->from(null,'
SELECT * FROM posts order by RAND() LIMIT 1')
->all();
$count = 1;
foreach ($Randoms as $Random) {
?>

<style>
@media only screen and (max-width: 756px) {
	#grad1 {
  		height: 200px !important;
	}
}
@media only screen and (min-width: 757px) {
#grad1 {
  height: 350px;
}
}

#grad1 {
  background-color: red; /* For browsers that do not support gradients */
background-image: linear-gradient(330deg, #703de7, #a584e7);
	width: 100%;
margin-top:25px;
margin-bottom:35px;
border-radius:25px;
position: relative;
</style>
<a href="<?php if($Random['type'] == 'serie') { echo APP. '/show/'; } else { echo '/movie/'; } echo $Random['self'] . '-' . $Random['create_year'];?>" class="list-media">
	<div id="grad1" style="width:100%;height:350px;"><div style="
  position: absolute;
  top: 50%;
  left: 50%;width:75%;text-align:center;
  transform: translate(-50%, -50%);color: #fff;font-size:1rem;"><i style="font-size:5rem;" class="fa fa-random" aria-hidden="true"></i>
<br><br>
Give something a chance ?</div></div>
</a>
<?php } ?>