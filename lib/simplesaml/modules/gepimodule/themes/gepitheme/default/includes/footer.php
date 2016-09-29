<?php
$gepiPath=$this->data['baseurlpath'].'/../../../..';
?>

	</div><!-- #content -->

</div><!-- #wrap -->
			<a href="/<?php echo $gepiPath;?>/gestion/info_vie_privee.php" onclick="centrerpopup('gestion/info_vie_privee.php',700,480,'scrollbars=yes,statusbar=no,resizable=yes');return false;">
			<!-- <a href="gestion/info_vie_privee.php" id="info_vie_privee"> -->
				<img src='./images/icons/vie_privee.png' alt='' class='link' />
				Informations vie privée
			</a><br/><br/>

	<?php if(getSettingValue("gepiAdminAdressPageLogin")!='n'){
		$gepiAdminAdress=explode(",",getSettingValue("gepiAdminAdress"));?>
			<a href="mailto:<?php echo $gepiAdminAdress[0];?>?subject=GEES">Contacter l'administrateur</a><br/><br/>
	<?php } ?>
	<div id="new_login_footer">
		<a href="#">
			GEES : Outil de gestion, de suivi, et de visualisation graphique des résultats scolaires (écoles, collèges, lycées)
		</a>
	</div> 

</body>
</html>