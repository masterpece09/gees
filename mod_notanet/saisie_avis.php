<?php
/*
* $Id$
*
* Copyright 2001, 2012 Thomas Belliard, Laurent Delineau, Edouard Hue, Eric Lebrun, Laurent Viénot-Hauger
*
* This file is part of GEES.
*
* GEES is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* GEES is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with GEES; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

// On indique qu'il faut creer des variables non protégées (voir fonction cree_variables_non_protegees())
$variables_non_protegees = 'yes';

// Initialisations files
require_once("../lib/initialisations.inc.php");

// Resume session
$resultat_session = $session_gepi->security_check();
if ($resultat_session == 'c') {
	header("Location: ../utilisateurs/mon_compte.php?change_mdp=yes");
	die();
} else if ($resultat_session == '0') {
	header("Location: ../logout.php?auto=1");
	die();
}


// INSERT INTO droits VALUES('/mod_notanet/saisie_avis.php','V','F','F','F','F','F','F','F','Notanet: Saisie avis chef etablissement','');
// INSERT INTO droits VALUES('/mod_notanet/saisie_avis.php','V','F','F','V','F','F','F','F','Notanet: Saisie avis chef etablissement','');
if (!checkAccess()) {
	header("Location: ../logout.php?auto=1");
	die();
}



$id_classe = isset($_POST['id_classe']) ? $_POST['id_classe'] : (isset($_GET['id_classe']) ? $_GET['id_classe'] : NULL);
$msg="";

if (isset($_POST['is_posted'])) {
	check_token();

	$pb_record="no";

	$ele_login=isset($_POST["ele_login"]) ? $_POST["ele_login"] : NULL;
	$favorable=isset($_POST["favorable"]) ? $_POST["favorable"] : NULL;

	for($i=0;$i<count($ele_login);$i++) {
		// Vérifier si l'élève est bien dans la classe?
		// Inutile si seul l'admin accède et qu'on ne limite pas l'accès à telle ou telle classe


		$nom_log = "app_eleve_".$i;
		//echo "\$nom_log=$nom_log<br />";
		if (isset($NON_PROTECT[$nom_log])){
			$app = traitement_magic_quotes(corriger_caracteres($NON_PROTECT[$nom_log]));
		}
		else{
			$app = "";
		}
		$app=suppression_sauts_de_lignes_surnumeraires($app);

		//if((isset($fav[$i]))||(isset($b2i[$i]))||(isset($b2i[$i]))) {
		if(isset($favorable[$i])) {
			//if(($favorable[$i]=='O')||($favorable[$i]=='N')) {
			if(($favorable[$i]=='O')||($favorable[$i]=='N')||($favorable[$i]=='')) {
				$sql="SELECT 1=1 FROM notanet_avis WHERE login='".$ele_login[$i]."';";
				$res_ele=mysqli_query($GLOBALS["mysqli"], $sql);
				if(mysqli_num_rows($res_ele)==0) {
					$sql="INSERT INTO notanet_avis SET login='".$ele_login[$i]."'";
					$sql.=",favorable='".$favorable[$i]."'";
					$sql.=",avis='".$app."'";
					$sql.=";";
				}
				else {
					$sql="UPDATE notanet_avis SET favorable='".$favorable[$i]."', avis='".$app."' WHERE login='".$ele_login[$i]."';";
				}
				//echo "$sql<br />";
				$register=mysqli_query($GLOBALS["mysqli"], $sql);
				if (!$register) {
					$msg .= "Erreur lors de l'enregistrement des données pour $ele_login[$i]<br />";
					//echo "ERREUR<br />";
					$pb_record = 'yes';
				}
			}
			else {
				$msg .= "Erreur: Vous n'avez pas coché un avis favorable ou non pour $ele_login[$i]<br />";
				$pb_record = 'yes';
			}
		}
		else {
			// Si on ne coche pas l'avis favorable... pour ne pas perdre les saisies...
			$sql="SELECT 1=1 FROM notanet_avis WHERE login='".$ele_login[$i]."';";
			$res_ele=mysqli_query($GLOBALS["mysqli"], $sql);
			if(mysqli_num_rows($res_ele)==0) {
				$sql="INSERT INTO notanet_avis SET login='".$ele_login[$i]."'";
				//$sql.=",favorable='".$favorable[$i]."'";
				$sql.=",favorable=''";
				$sql.=",avis='".$app."'";
				$sql.=";";
			}
			else {
				//$sql="UPDATE notanet_avis SET favorable='".$favorable[$i]."', avis='".$app."' WHERE login='".$ele_login[$i]."';";
				$sql="UPDATE notanet_avis SET favorable='', avis='".$app."' WHERE login='".$ele_login[$i]."';";
			}
			//echo "$sql<br />";
			$register=mysqli_query($GLOBALS["mysqli"], $sql);
			if (!$register) {
				$msg .= "Erreur lors de l'enregistrement des données pour $ele_login[$i]<br />";
				//echo "ERREUR<br />";
				$pb_record = 'yes';
			}
		}
	}

	if ($pb_record == 'no') {
		//$affiche_message = 'yes';
		$msg="Les modifications ont été enregistrées !";
	}
}


$themessage = 'Des modifications ont été effectuées. Voulez-vous vraiment quitter sans enregistrer ?';
$message_enregistrement = "Les modifications ont été enregistrées !";

//**************** EN-TETE *****************
$titre_page = "Notanet | Saisie de l'avis du chef d'établissement";
require_once("../lib/header.inc.php");
//**************** FIN EN-TETE *****************

$tmp_timeout=(getSettingValue("sessionMaxLength"))*60;

?>
<script type="text/javascript" language="javascript">
change = 'no';
</script>

<?php
echo "<p class=bold><a href='../accueil.php' onclick=\"return confirm_abandon(this, change, '$themessage')\"><img src='../images/icons/back.png' alt='Retour' class='back_link'/> Accueil</a>";

echo " | <a href='index.php' onclick=\"return confirm_abandon(this, change, '$themessage')\">Accueil Notanet</a>\n";

if(!isset($id_classe)) {
	echo "</p>\n";


	//$sql="SELECT DISTINCT c.id,c.classe FROM classes c, periodes p, notanet n,notanet_ele_type net WHERE p.id_classe = c.id AND c.id=n.id_classe ORDER BY classe;";
	$sql="SELECT DISTINCT c.id,c.classe FROM classes c, j_eleves_classes jec,notanet_ele_type net WHERE c.id=jec.id_classe AND net.login=jec.login ORDER BY classe;";
	//echo "$sql<br />";
	$call_classes=mysqli_query($GLOBALS["mysqli"], $sql);

	$nb_classes=mysqli_num_rows($call_classes);
	if($nb_classes==0){
		echo "<p>Aucune classe ne semble encore définie.</p>\n";

		require("../lib/footer.inc.php");
		die();
	}
	else{
		// Choix de la classe...
		echo "<form enctype='multipart/form-data' action='".$_SERVER['PHP_SELF']."' method='post' name='formulaire'>
	<fieldset class='fieldset_opacite50'>
		<p class='bold'>Choisissez les classes pour lesquelles vous souhaitez saisir l'avis du chef d'établissement&nbsp;:</p>\n";

		// Affichage sur 3 colonnes
		$nb_classes_par_colonne=round($nb_classes/2);

		echo "<table width='100%' summary='Choix des classes'>\n";
		echo "<tr valign='top' align='center'>\n";

		$cpt_i = 0;

		echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>\n";
		echo "<td align='left'>\n";

		while($lig_clas=mysqli_fetch_object($call_classes)) {

			//affichage 2 colonnes
			if(($cpt_i>0)&&(round($cpt_i/$nb_classes_par_colonne)==$cpt_i/$nb_classes_par_colonne)){
				echo "</td>\n";
				echo "<td align='left'>\n";
			}

			echo "<input type='checkbox' name='id_classe[]' id='id_classe_".$cpt_i."' value='$lig_clas->id' />";
			echo "<label for='id_classe_".$cpt_i."' style='cursor: pointer;'>";
			echo "$lig_clas->classe</label>";
			echo "<br />\n";
			$cpt_i++;
		}

		echo "</td>\n";
		echo "</tr>\n";
		echo "</table>\n";

		echo "<p align='center'><input type='submit' value='Valider' /></p>\n";
		echo "</fieldset></form>\n";
	}
}
else {
	echo " | <a href='".$_SERVER['PHP_SELF']."' onclick=\"return confirm_abandon(this, change, '$themessage')\">Choisir d'autres classes</a>\n";
	echo "</p>\n";

	$sql="CREATE TABLE IF NOT EXISTS notanet_avis (
		login VARCHAR( 50 ) NOT NULL ,
		favorable ENUM( 'O', 'N' ) NOT NULL ,
		avis TEXT NOT NULL ,
		PRIMARY KEY ( login )
		) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
	$create_table=mysqli_query($GLOBALS["mysqli"], $sql);


	echo "<form enctype=\"multipart/form-data\" action=\"".$_SERVER['PHP_SELF']."\" method=\"post\">
	<fieldset class='fieldset_opacite50'>\n";
	echo add_token_field();

	/*
	$tabdiv_infobulle[]=creer_div_infobulle('MS',"","","<center>Maîtrise du socle</center>","",10,0,'y','y','n','n');
	$tabdiv_infobulle[]=creer_div_infobulle('ME',"","","<center>Maîtrise de certains éléments du socle</center>","",12,0,'y','y','n','n');
	$tabdiv_infobulle[]=creer_div_infobulle('MN',"","","<center>Maîtrise du socle non évaluée</center>","",10,0,'y','y','n','n');
	$tabdiv_infobulle[]=creer_div_infobulle('AB',"","","<center>Absent</center>","",8,0,'y','y','n','n');
	*/


	$insert_mass_appreciation_type=getSettingValue("insert_mass_appreciation_type");
	if ($insert_mass_appreciation_type=="y") {
		// INSERT INTO setting SET name='insert_mass_appreciation_type', value='y';

		$sql="CREATE TABLE IF NOT EXISTS b_droits_divers (login varchar(50) NOT NULL default '', nom_droit varchar(50) NOT NULL default '', valeur_droit varchar(50) NOT NULL default '');";
		$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

		// Pour tester:
		// INSERT INTO b_droits_divers SET login='toto', nom_droit='insert_mass_appreciation_type', valeur_droit='y';

		$sql="SELECT 1=1 FROM b_droits_divers WHERE login='".$_SESSION['login']."' AND nom_droit='insert_mass_appreciation_type' AND valeur_droit='y';";
		$res_droit=mysqli_query($GLOBALS["mysqli"], $sql);
		if(mysqli_num_rows($res_droit)>0) {
			$droit_insert_mass_appreciation_type="y";
		}
		else {
			$droit_insert_mass_appreciation_type="n";
		}

		if($droit_insert_mass_appreciation_type=="y") {
			$default_mass_appreciation="";
			if(getSettingValue('default_mass_appreciation')!="") {
				$default_mass_appreciation=getSettingValue('default_mass_appreciation');
			}

			$texte_infobulle="";
			$texte_infobulle.="<div style='margin:1em; padding:0.2em; width:40em; border: 1px solid black; background-color: white; font-size: small; text-align:center;'>\n";
			$texte_infobulle.="<p>Insérer l'avis-type suivant<br />
	<input type='radio' name='insert_mass_appreciation_type_mode' id='insert_mass_appreciation_type_mode_vide' value='vide' checked /><label for='insert_mass_appreciation_type_mode_vide'>pour tous les avis vides</label><br />
	<input type='radio' name='insert_mass_appreciation_type_mode' id='insert_mass_appreciation_type_mode_ajout' value='ajout' /><label for='insert_mass_appreciation_type_mode_ajout'>en complément des avis</label><br />";
			$texte_infobulle.="<textarea name='no_anti_inject_ajout_a_textarea_vide' id='ajout_a_textarea_vide' cols='50'>$default_mass_appreciation</textarea><br />\n";

			//$texte_infobulle.="<input type='checkbox' name='enregistrer_ajout_a_textarea_vide' id='enregistrer_ajout_a_textarea_vide' value='y' /><label for='enregistrer_ajout_a_textarea_vide'>Enregistrer cet avis-type comme avis-type par défaut</label><br />\n";

			$texte_infobulle.="<input type='button' name='ajouter_a_textarea_vide' value='Ajouter' onclick='ajoute_a_textarea_vide(); changement()' /><br />\n";

			$texte_infobulle.="<input type='button' name='button_vider_tous_les_avis' value='Vider tous les avis' onclick='vider_tous_les_avis(); changement()' /><br />\n";
			$texte_infobulle.="</div>\n";

			$texte_infobulle.="<script type='text/javascript'>
		function ajoute_a_textarea_vide() {
			if(document.getElementById('insert_mass_appreciation_type_mode_vide').checked==true) {
				mode_insert='vide';
			}
			else {
				mode_insert='ajout';
			}
			champs_textarea=document.getElementsByTagName('textarea');
			//alert('champs_textarea.length='+champs_textarea.length);
			for(i=0;i<champs_textarea.length;i++){
				if(champs_textarea[i].name!='no_anti_inject_ajout_a_textarea_vide') {
					if((mode_insert=='vide')&&(champs_textarea[i].value=='')) {
						champs_textarea[i].value=document.getElementById('ajout_a_textarea_vide').value;
					}
					else {
						if(mode_insert=='ajout') {
							champs_textarea[i].value+=document.getElementById('ajout_a_textarea_vide').value;
						}
					}
				}
			}
		}

		function vider_tous_les_avis() {
			var is_confirmed = confirm('ATTENTION : Vous avez demandé à vider tous les avis saisis pour cette classe ! Etes-vous sûr de vouloir vider ces avis ?');
			if(is_confirmed){
				champs_textarea=document.getElementsByTagName('textarea');
				for(i=0;i<champs_textarea.length;i++){
					if(champs_textarea[i].name!='no_anti_inject_ajout_a_textarea_vide') {
						champs_textarea[i].value='';
					}
				}
			}
		}
	</script>\n";

			$titre_infobulle="Insertion en masse";
			$tabdiv_infobulle[]=creer_div_infobulle('div_insertion_en_masse',$titre_infobulle,"",$texte_infobulle,"",35,0,'y','y','n','n');

			echo "<div style='float:right;width:5em; text-align:center;' class='fieldset_opacite50'><a href='#' onclick=\"afficher_div('div_insertion_en_masse', 'y', 10, 10);return false;\">Insertion en masse</a></div>";
		}
	}

	$titre="<span id='span_titre_photo'>Photo</span>";
	$texte="Photo";
	$tabdiv_infobulle[]=creer_div_infobulle('div_photo_eleve',$titre,"",$texte,"",14,0,'y','y','n','n');

	echo necessaire_bull_simple();

	$max_per=0;
	for($i=0;$i<count($id_classe);$i++) {
		$nb_per_classe=get_period_number($id_classe[$i]);
		if($nb_per_classe>$max_per) {
			$max_per=$nb_per_classe;
		}
	}

	$titre="<span id='span_avis_conseil'>Avis du conseil de classe</span>";
	//$texte="<div id='contenu_infobulle_avis_conseil_classe'>Avis du conseil de classe</div>";
	$texte="
<div style='float:right; width:16px'><a href='#' onclick=\"affiche_bull_simp2(); return false;\" title=\"Voir le bulletin simplifié.\"><img src='../images/icons/bulletin.png' class='icone16' alt='BullSimp' /></a></div>
<input type='hidden' name='current_login_ele' id='current_login_ele' value='' />
<input type='hidden' name='current_id_classe' id='current_id_classe' value='' />
<div id='contenu_infobulle_avis_conseil_classe'>Avis du conseil de classe</div>";
	$tabdiv_infobulle[]=creer_div_infobulle('div_avis_conseil_classe',$titre,"",$texte,"",30,0,'y','y','n','n');

	echo "<script type='text/javascript'>
	// <![CDATA[
	function affiche_avis_conseil(login_eleve, id_classe) {
		document.getElementById('current_login_ele').value=login_eleve;
		document.getElementById('current_id_classe').value=id_classe;

		new Ajax.Updater($('contenu_infobulle_avis_conseil_classe'),'../lib/ajax_action.php?mode=tab_avis_conseil&ele_login='+login_eleve,{method: 'get'});
		afficher_div('div_avis_conseil_classe', 'y', 10, 10);
	}

	function affiche_bull_simp2() {
		login_eleve=document.getElementById('current_login_ele').value;
		id_classe=document.getElementById('current_id_classe').value;
		num_per1=1;
		num_per2=$max_per;

		document.getElementById('titre_entete_bull_simp').innerHTML='Bulletin simplifié de '+login_eleve+' période '+num_per1+' à '+num_per2;
		new Ajax.Updater($('corps_bull_simp'),'../saisie/ajax_edit_limite.php?choix_edit=2&login_eleve='+login_eleve+'&id_classe='+id_classe+'&periode1='+num_per1+'&periode2='+num_per2,{method: 'get'});

		afficher_div('div_bull_simp', 'y', 10, 10);
	}
	//]]>
</script>\n";

	$cpt=0;
	for($i=0;$i<count($id_classe);$i++) {

		$nb_per_classe=get_period_number($id_classe[$i]);

		echo "<p>Classe de <b>".get_class_from_id($id_classe[$i])."</b><br />\n";
		echo "<input type='hidden' name='id_classe[$i]' value='".$id_classe[$i]."' />\n";

		$sql="SELECT DISTINCT e.* FROM eleves e, j_eleves_classes jec WHERE (jec.id_classe='".$id_classe[$i]."' AND jec.login=e.login) ORDER BY e.nom,e.prenom,e.naissance;";
		//echo "$sql<br />";
		$res_ele=mysqli_query($GLOBALS["mysqli"], $sql);
		if(mysqli_num_rows($res_ele)==0) {
			echo "Aucun élève dans cette classe.</p>\n";
		}
		else {
			echo "<table class='boireaus' border='1' summary='Saisie avis'>\n";

			//===========================
			echo "<tr>\n";
			echo "<th rowspan='4' colspan='2'>Elève</th>\n";
			echo "<th colspan='3'>Avis du chef d'établissement</th>\n";
			echo "<th colspan='3'>Avis du conseil de classe</th>\n";
			echo "</tr>\n";

			echo "<tr>\n";
			echo "<th colspan='2'>Avis favorable</th>\n";
			echo "<th rowspan='2'>Avis mitigé<br />ou<br />non saisi</th>\n";
			//echo "<th rowspan='3'>Motivation d'un avis défavorable</th>\n";
			echo "<th rowspan='3'>Motivation de l'avis</th>\n";
			echo "</tr>\n";
			//===========================
			echo "<tr>\n";

			echo "<th>";
			echo "Oui\n";
			echo "</th>\n";

			echo "<th>";
			echo "Non\n";
			echo "</th>\n";

			echo "</tr>\n";
			//===========================
			echo "<tr>\n";

			echo "<th>";
			echo "<a href=\"javascript:CocheColonne('fav_O_',$i)\"><img src='../images/enabled.png' width='15' height='15' alt='Tout cocher' /></a> / <a href=\"javascript:DecocheColonne('fav_O_',$i)\"><img src='../images/disabled.png' width='15' height='15' alt='Tout décocher' /></a>";
			echo "</th>\n";

			echo "<th>";
			echo "<a href=\"javascript:CocheColonne('fav_N_',$i)\"><img src='../images/enabled.png' width='15' height='15' alt='Tout cocher' /></a> / <a href=\"javascript:DecocheColonne('fav_N_',$i)\"><img src='../images/disabled.png' width='15' height='15' alt='Tout décocher' /></a>";
			echo "</th>\n";

			echo "<th>";
			echo "<a href=\"javascript:CocheColonne('fav_X_',$i)\"><img src='../images/enabled.png' width='15' height='15' alt='Tout cocher' /></a> / <a href=\"javascript:DecocheColonne('fav_X_',$i)\"><img src='../images/disabled.png' width='15' height='15' alt='Tout décocher' /></a>";
			echo "</th>\n";

			echo "</tr>\n";
			//===========================


			$alt=1;
			while($lig_ele=mysqli_fetch_object($res_ele)) {

				//========================
				$sql="SELECT elenoet FROM eleves WHERE login='$lig_ele->login';";
				$res_ele2=mysqli_query($GLOBALS["mysqli"], $sql);
				$lig_ele2=mysqli_fetch_object($res_ele2);
				$eleve_elenoet=$lig_ele2->elenoet;

				// Photo...
				$photo=nom_photo($eleve_elenoet);
				$temoin_photo="";
				if($photo){
					$temoin_photo="y";
				}
				//========================

				$alt=$alt*(-1);
				echo "<tr class='lig$alt'>\n";
				/*
				echo "<td>";
				echo "<input type='hidden' name='ele_login[$cpt]' value=\"".$lig_ele->login."\" />\n";
				echo $lig_ele->nom." ".$lig_ele->prenom;
				echo "</td>\n";
				*/
				if($temoin_photo!="y") {
					echo "<td colspan='2'>".$lig_ele->nom." ".$lig_ele->prenom;
				}
				else {
					echo "<td>";
					echo "<div style='float:right; width:16px;'><a href='../prepa_conseil/edit_limite.php?choix_edit=2&login_eleve=$lig_ele->login&id_classe=".$id_classe[$i]."&periode1=1&periode2=$nb_per_classe' onclick=\"affiche_avis_conseil('$lig_ele->login', '".$id_classe[$i]."');return false;\"><img src='../images/icons/bulletin.png' class='icone16' alt='Avis' /></a></div>";
					echo $lig_ele->nom." ".$lig_ele->prenom."</td>";

					echo "<td>";
					if(file_exists($photo)) {
						echo "<a href='#' onclick=\"afficher_div('div_photo_eleve','y',-100,20); affiche_photo('".$photo."','".addslashes(mb_strtoupper($lig_ele->nom)." ".ucfirst(mb_strtolower($lig_ele->prenom)))."');return false;\">";
						echo "<img src='../mod_trombinoscopes/images/".(($lig_ele->sexe=="F") ? "photo_f.png" : "photo_g.png")."' class='icone16' alt=\"$lig_ele->nom $lig_ele->prenom\" />";
						echo "</a>";
					}
				}
				echo "<input type='hidden' name='ele_login[$cpt]' value=\"".$lig_ele->login."\" />\n";
				echo "</td>\n";


				$sql="SELECT * FROM notanet_avis WHERE login='".$lig_ele->login."';";
				$res_avis=mysqli_query($GLOBALS["mysqli"], $sql);
				if(mysqli_num_rows($res_avis)==0) {
					$def_fav="";
					$def_avis="";
				}
				else {
					$lig_avis=mysqli_fetch_object($res_avis);
					$def_fav=$lig_avis->favorable;
					$def_avis=$lig_avis->avis;
				}

				echo "<td><input type='radio' name='favorable[$cpt]' id='fav_O_".$cpt."_".$i."' value='O' onchange='changement();' ";
				if($def_fav=='O') {echo "checked ";}
				echo "/></td>\n";

				echo "<td><input type='radio' name='favorable[$cpt]' id='fav_N_".$cpt."_".$i."' value='N' onchange='changement();' ";
				if($def_fav=='N') {echo "checked ";}
				echo "/></td>\n";

				echo "<td><input type='radio' name='favorable[$cpt]' id='fav_X_".$cpt."_".$i."' value='' onchange='changement();' ";
				if($def_fav=='') {echo "checked ";}
				echo "/></td>\n";

				echo "<td>\n";
				echo "<textarea id=\"n".$cpt."\" onKeyDown=\"clavier(this.id,event);\" name=\"no_anti_inject_app_eleve_".$cpt."\" rows='2' cols='80' wrap='virtual' onchange=\"changement()\"";
				//==================================
				// Pour revenir au champ suivant après validation/enregistrement:
				//echo " onfocus=\"focus_suivant(".$cpt.");";
				//echo " document.getElementById('focus_courant').value='".$cpt."';";
				echo " onfocus=\"change_photo('".$photo."','".addslashes(mb_strtoupper($lig_ele->nom)." ".ucfirst(mb_strtolower($lig_ele->prenom)))."');focus_suivant(".$cpt."); document.getElementById('focus_courant').value='".$cpt."';\"";
				echo "\"";
				//==================================
				echo ">".$def_avis."</textarea>\n";
				echo "</td>\n";

				echo "</tr>\n";
				$cpt++;
			}

			echo "</table>\n";
		}
	}

	echo "<input type='hidden' name='is_posted' value='y' />\n";
	echo "<input type='hidden' name='nb_tot_eleves' value='$cpt' />\n";
	echo "<p align='center'><input type='submit' value='Enregistrer' /></p>\n";


	echo "<center><div id='fixe'>";

	//if(getSettingValue('notanet_dfsp')=='y') {
		// INSERT INTO setting SET name='notanet_dfsp', value='y';
		echo "<a href=\"#\" onClick=\"document.getElementById('n'+document.getElementById('focus_courant').value).value=document.getElementById('n'+document.getElementById('focus_courant').value).value+'Avis très favorable.';document.getElementById('n'+document.getElementById('focus_courant').value).focus();return false;\" title=\"Insérer dans le champ de saisie la chaine suivante:

Avis très favorable.\">ATF</a><br />\n";
		echo "<a href=\"#\" onClick=\"document.getElementById('n'+document.getElementById('focus_courant').value).value=document.getElementById('n'+document.getElementById('focus_courant').value).value+'Avis favorable.';document.getElementById('n'+document.getElementById('focus_courant').value).focus();return false;\" title=\"Insérer dans le champ de saisie la chaine suivante:

Avis favorable.\">AF</a><br />\n";
		echo "<a href=\"#\" onClick=\"document.getElementById('n'+document.getElementById('focus_courant').value).value=document.getElementById('n'+document.getElementById('focus_courant').value).value+'Doit faire ses preuves.';document.getElementById('n'+document.getElementById('focus_courant').value).focus();return false;\" title=\"Insérer dans le champ de saisie la chaine suivante:

Doit faire ses preuves.\">Dfsp</a><br />\n";
	//}
	echo "<input type='submit' value='Enregistrer' /><br />

<!-- DIV destiné à afficher un décompte du temps restant pour ne pas se faire piéger par la fin de session -->
<div id='decompte'></div>
</div>
</center>


<!-- Champ destiné à recevoir la valeur du champ suivant celui qui a le focus pour redonner le focus à ce champ après une validation -->
<input type='hidden' id='info_focus' name='champ_info_focus' value='' size='3' />
<input type='hidden' id='focus_courant' name='focus_courant' value='' size='3' />
";

	echo "
	</fieldset>
</form>

<p style='margin-top:2em;'><em>NOTES&nbsp;:</em></p>
<ul style='margin-right:15em;'>
	<li>Sur les fiches brevet, le champ correspondant à l'<strong>avis du chef d'établissement</strong> est désigné par <strong>[eleves.decision]</strong> et peut contenir&nbsp;:<br />
	&nbsp;&nbsp;&nbsp;<em>Avis favorable</em><br />
	ou<br />
	&nbsp;&nbsp;&nbsp;<em>Doit faire ses preuves</em></li>
	<li>Sur les fiches brevet, le champ correspondant à l'<strong>avis du conseil de classe</strong> est désigné par <strong>[eleves.appreciation]</strong> et contiendra ce que vous mettrez dans les champs ci-dessus.</li>
	<li>Si vous préférez faire apparaître, sur les Fiches Brevet, l'avis du conseil dans les deux cases (<em>conseil et chefetab</em>), vous pouvez modifier le modèle openDocument proposé en page d'accueil dans <strong>Modèle Open Office/Gérer les modèles de document OOo de l'établissement</strong>, puis dans le module Notanet, à la rubrique&nbsp;:<br />
	&nbsp;&nbsp;&nbsp;<strong>Générer les fiches brevet selon le modèle de:<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modèle au format openDocument</strong><br />
	en y choisissant dans <strong>Paramétrer</strong> d'utiliser des <strong>Gabarits personnels</strong>.
	</li>
</ul>\n";


	echo "<script type='text/javascript'>

function CocheColonne(nom_col,num_classe) {
	for (var ki=0;ki<$cpt;ki++) {
		if(document.getElementById(nom_col+ki+'_'+num_classe)){
			document.getElementById(nom_col+ki+'_'+num_classe).checked = true;
		}
	}

	changement();
}

function DecocheColonne(nom_col,num_classe) {
	for (var ki=0;ki<$cpt;ki++) {
		if(document.getElementById(nom_col+ki+'_'+num_classe)){
			document.getElementById(nom_col+ki+'_'+num_classe).checked = false;
		}
	}

	changement();
}

</script>
";




	// Il faudra permettre de n'afficher ce décompte que si l'administrateur le souhaite.
	echo "<script type='text/javascript'>
	cpt=".$tmp_timeout.";
	compte_a_rebours='y';

	function decompte(cpt){
		if(compte_a_rebours=='y'){
			document.getElementById('decompte').innerHTML=cpt;
			if(cpt>0){
				cpt--;
			}

			setTimeout(\"decompte(\"+cpt+\")\",1000);
		}
		else{
			document.getElementById('decompte').style.display='none';
		}
	}

	decompte(cpt);

	function focus_suivant(num){
		temoin='';
		// La variable 'dernier' peut dépasser de l'effectif de la classe... mais cela n'est pas dramatique
		dernier=num+".$cpt."
		// On parcourt les champs à partir de celui de l'élève en cours jusqu'à rencontrer un champ existant
		// (pour réussir à passer un élève qui ne serait plus dans la période)
		// Après validation, c'est ce champ qui obtiendra le focus si on n'était pas à la fin de la liste.
		for(i=num;i<dernier;i++){
			suivant=i+1;
			if(temoin==''){
				if(document.getElementById('n'+suivant)){
					document.getElementById('info_focus').value=suivant;
					temoin=suivant;
				}
			}
		}

		document.getElementById('info_focus').value=temoin;
	}

	function affiche_photo(photo,nom_prenom) {
		document.getElementById('div_photo_eleve_contenu_corps').innerHTML='<div style=\'text-align: center\'><img src=\"'+photo+'\" width=\"150\" alt=\"Photo\" /><br />'+nom_prenom+'</div>';
		//alert('nom_prenom='+nom_prenom);
		document.getElementById('span_titre_photo').innerHTML=nom_prenom;
	}

	function change_photo(photo,nom_prenom) {
		if(document.getElementById('div_photo_eleve').style.display=='') {
			affiche_photo(photo,nom_prenom);
			afficher_div('div_photo_eleve','y',-100,20);
		}
	}

	";

	// Après validation, on donne le focus au champ qui suivait celui qui vient d'être rempli
	if(isset($_POST['champ_info_focus'])){
		if($_POST['champ_info_focus']!=""){
			echo "// On positionne le focus...
		document.getElementById('n".$_POST['champ_info_focus']."').focus();\n";
		}
	}
	echo "</script>\n";


}

echo "<p><br /></p>\n";
require("../lib/footer.inc.php");
die();
?>
