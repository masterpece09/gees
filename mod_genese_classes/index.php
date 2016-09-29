<?php
/*
* Copyright 2001, 2011 Thomas Belliard, Laurent Delineau, Edouard Hue, Eric Lebrun
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



$sql="SELECT 1=1 FROM droits WHERE id='/mod_genese_classes/index.php';";
$test=mysqli_query($GLOBALS["mysqli"], $sql);
if(mysqli_num_rows($test)==0) {
$sql="INSERT INTO droits SET id='/mod_genese_classes/index.php',
administrateur='V',
professeur='F',
cpe='F',
scolarite='F',
eleve='F',
responsable='F',
secours='F',
autre='F',
description='Genèse des classes: Accueil',
statut='';";
$insert=mysqli_query($GLOBALS["mysqli"], $sql);
}




//======================================================================================
// Section checkAccess() à décommenter en prenant soin d'ajouter le droit correspondant:
if (!checkAccess()) {
	header("Location: ../logout.php?auto=1");
	die();
}
//======================================================================================


//=========================================================

// Création des tables

$sql="CREATE TABLE IF NOT EXISTS gc_projets (
id smallint(6) unsigned NOT NULL auto_increment,
projet VARCHAR( 255 ) NOT NULL ,
commentaire TEXT NOT NULL ,
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

$sql="CREATE TABLE IF NOT EXISTS gc_divisions (
id int(11) unsigned NOT NULL auto_increment,
projet VARCHAR( 255 ) NOT NULL ,
id_classe smallint(6) unsigned NOT NULL,
classe varchar(100) NOT NULL default '',
statut enum( 'actuelle', 'future', 'red', 'arriv' ) NOT NULL DEFAULT 'future',
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

$sql="CREATE TABLE IF NOT EXISTS gc_options (
id int(11) unsigned NOT NULL auto_increment,
projet VARCHAR( 255 ) NOT NULL ,
opt VARCHAR( 255 ) NOT NULL ,
type ENUM('lv1','lv2','lv3','autre') NOT NULL ,
obligatoire ENUM('o','n') NOT NULL ,
exclusive smallint(6) unsigned NOT NULL,
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
//echo "$sql<br />";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

$sql="CREATE TABLE IF NOT EXISTS gc_options_classes (
id int(11) unsigned NOT NULL auto_increment,
projet VARCHAR( 255 ) NOT NULL ,
opt_exclue VARCHAR( 255 ) NOT NULL ,
classe_future VARCHAR( 255 ) NOT NULL ,
commentaire TEXT NOT NULL ,
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

$sql="CREATE TABLE IF NOT EXISTS gc_ele_arriv_red (
login VARCHAR( 50 ) NOT NULL,
statut ENUM('Arriv','Red') NOT NULL ,
projet VARCHAR( 255 ) NOT NULL ,
PRIMARY KEY ( login , projet )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
//echo "$sql<br />";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);



$sql="CREATE TABLE IF NOT EXISTS gc_affichages (
id int(11) unsigned NOT NULL auto_increment,
id_aff int(11) unsigned NOT NULL,
id_req int(11) unsigned NOT NULL,
projet VARCHAR( 255 ) NOT NULL ,
type VARCHAR(255) NOT NULL,
valeur varchar(255) NOT NULL,
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);


$sql="CREATE TABLE IF NOT EXISTS gc_eleves_options (
id int(11) unsigned NOT NULL auto_increment,
login VARCHAR( 255 ) NOT NULL ,
profil enum('GC','C','RAS','B','TB') NOT NULL default 'RAS',
moy VARCHAR( 255 ) NOT NULL ,
nb_absences VARCHAR( 255 ) NOT NULL ,
non_justifie VARCHAR( 255 ) NOT NULL ,
nb_retards VARCHAR( 255 ) NOT NULL ,
projet VARCHAR( 255 ) NOT NULL ,
id_classe_actuelle VARCHAR(255) NOT NULL ,
classe_future VARCHAR(255) NOT NULL ,
liste_opt VARCHAR( 255 ) NOT NULL ,
PRIMARY KEY ( id )
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;";
//echo "$sql<br />";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);


$req_test=mysqli_query($GLOBALS["mysqli"], "SHOW INDEXES FROM gc_ele_arriv_red WHERE Key_name='PRIMARY';");
$res_test=mysqli_num_rows($req_test);
if ($res_test<2){
  $query=mysqli_query($GLOBALS["mysqli"], "ALTER TABLE gc_ele_arriv_red DROP PRIMARY KEY;");
  if ($query) {
    $query=mysqli_query($GLOBALS["mysqli"], "ALTER TABLE gc_ele_arriv_red ADD PRIMARY KEY ( login , projet );");
    if (!$query) {
      $msg="Echec de la définition de la clé primaire sur 'login' et 'projet' dans 'gc_ele_arriv_red' : Erreur !<br />";
    }
  } else {
      $msg="Echec de la définition de la clé primaire sur 'login' et 'projet' dans 'gc_ele_arriv_red' : Erreur !<br />Cela peut perturber la conservation des redoublants/arrivants lors de la copie de projet.<br />";
  }
}

$sql="CREATE TABLE IF NOT EXISTS gc_noms_affichages (
id int(11) unsigned NOT NULL auto_increment,
id_aff int(11) NOT NULL,
projet VARCHAR( 255 ) NOT NULL ,
nom varchar(100) NOT NULL,
description tinytext NOT NULL,
PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
//echo "$sql<br />";
$create_table=mysqli_query($GLOBALS["mysqli"], $sql);

// Le champ id contenait id_aff dans une première version, mais cela pose un problème pour la copie de projet.
$test_champ=mysqli_num_rows(mysqli_query($mysqli, "SHOW COLUMNS FROM gc_noms_affichages LIKE 'id_aff';"));
if ($test_champ==0) {
	$query = mysqli_query($mysqli, "ALTER TABLE gc_noms_affichages ADD id_aff INT(11) NOT NULL AFTER id;");

	$query = mysqli_query($mysqli, "ALTER TABLE `gc_noms_affichages` CHANGE `id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT;");

	$sql="SELECT * FROM gc_noms_affichages;";
	$res = mysqli_query($mysqli, $sql);
	while($lig=mysqli_fetch_object($res)) {
		$sql="UPDATE gc_noms_affichages SET id_aff='$lig->id' WHERE id='$lig->id';";
		$update = mysqli_query($mysqli, $sql);
	}
}
$test_champ=mysqli_num_rows(mysqli_query($mysqli, "SHOW COLUMNS FROM gc_noms_affichages LIKE 'projet';"));
if ($test_champ==0) {
	$query = mysqli_query($mysqli, "ALTER TABLE gc_noms_affichages ADD projet VARCHAR( 255 ) NOT NULL AFTER id_aff;");

	$sql="SELECT * FROM gc_noms_affichages;";
	$res = mysqli_query($mysqli, $sql);
	while($lig=mysqli_fetch_object($res)) {
		$sql="SELECT projet FROM gc_affichages WHERE id_aff='$lig->id';";
		$res2 = mysqli_query($mysqli, $sql);
		if(mysqli_num_rows($res2)>0) {
			$lig2=mysqli_fetch_object($res2);

			$sql="UPDATE gc_noms_affichages SET projet='$lig2->projet' WHERE id='$lig->id';";
			$update = mysqli_query($mysqli, $sql);
		}
	}
}

//=========================================================

//debug_var();

// Partie Projets

$projet=isset($_POST['projet']) ? $_POST['projet'] : (isset($_GET['projet']) ? $_GET['projet'] : NULL);
$choix_projet=isset($_POST['choix_projet']) ? $_POST['choix_projet'] : (isset($_GET['choix_projet']) ? $_GET['choix_projet'] : NULL);
$suppr_projet=isset($_POST['suppr_projet']) ? $_POST['suppr_projet'] : (isset($_GET['suppr_projet']) ? $_GET['suppr_projet'] : NULL);
$creer_projet=isset($_POST['creer_projet']) ? $_POST['creer_projet'] : (isset($_GET['creer_projet']) ? $_GET['creer_projet'] : NULL);
$copie_projet=isset($_POST['copie_projet']) ? $_POST['copie_projet'] : (isset($_GET['copie_projet']) ? $_GET['copie_projet'] : NULL);
$projet_new=isset($_POST['projet_new']) ? $_POST['projet_new'] : (isset($_GET['projet_new']) ? $_GET['projet_new'] : NULL);

if(isset($projet)) {
	if(isset($creer_projet)) {
		$projet=my_ereg_replace("[^A-Za-z0-9_]","",$projet);
		if($projet!="") {
			$sql="SELECT 1=1 FROM gc_projets WHERE projet='$projet';";
			$test=mysqli_query($GLOBALS["mysqli"], $sql);
			if(mysqli_num_rows($test)==0) {
				$sql="INSERT INTO gc_projets SET projet='$projet', commentaire='';";
				if($insert=mysqli_query($GLOBALS["mysqli"], $sql)) {$msg="Le projet $projet a été créé.";}
			}
			else {
				$msg="Un projet du même nom '$projet' existe déjà.\n";
			}
		}
		else {
			$msg="Les caractères du nom de projet '$projet' ne sont pas valides.\n";
		}
	}
	elseif(isset($suppr_projet)) {
		$projet=my_ereg_replace("[^A-Za-z0-9_]","",$projet);
		if($projet!="") {
			$sql="DELETE FROM gc_projets WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			// Il y aura d'autres tables à nettoyer
			$sql="DELETE FROM gc_divisions WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$sql="DELETE FROM gc_options WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$sql="DELETE FROM gc_eleves_options WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$sql="DELETE FROM gc_affichages WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$sql="DELETE FROM gc_ele_arriv_red WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$sql="DELETE FROM gc_options_classes WHERE projet='$projet';";
			$del=mysqli_query($GLOBALS["mysqli"], $sql);
			$msg="Suppression du projet '$projet' effectuée.\n";
		}
		else {
			$msg="Les caractères du nom de projet '$projet' ne sont pas valides.\n";
		}

		unset($projet);
	}
	elseif(isset($copie_projet)) {
		$projet_original=my_ereg_replace("[^A-Za-z0-9_]","",$projet);
		$projet=$projet_new;
		if($projet_original!="") {
			$projet=my_ereg_replace("[^A-Za-z0-9_]","",$projet);
			if($projet!="") {
				$sql="SELECT 1=1 FROM gc_projets WHERE projet='$projet';";
				$test=mysqli_query($GLOBALS["mysqli"], $sql);
				if(mysqli_num_rows($test)==0) {
					$sql="INSERT INTO gc_projets SET projet='$projet', commentaire='';";
					//echo "$sql<br />";
					if($insert=mysqli_query($GLOBALS["mysqli"], $sql)) {
						$msg="Le projet $projet a été créé.";

						// On ne peut pas copier 'gc_noms_affichages' sur le même principe.
						// Les champs sont (id,nom,description) avec gc_noms_affichages.id=gc.affichage.id_aff

						$tab_table=array('gc_affichages','gc_divisions','gc_ele_arriv_red','gc_eleves_options','gc_options','gc_options_classes', 'gc_noms_affichages');
						for($j=0;$j<count($tab_table);$j++) {
							$sql="SELECT * FROM ".$tab_table[$j]." WHERE projet='$projet_original';";
							//echo "$sql<br />";
							$res=mysqli_query($GLOBALS["mysqli"], $sql);
							unset($nom_champ);
							//echo "mysqli_num_fields(\$res)=".mysqli_num_fields($res)."<br />";
							//for($i=0;$i<(($___mysqli_tmp = mysqli_num_fields($res)) ? $___mysqli_tmp : false);$i++){
								//$nom_champ[$i]=((($___mysqli_tmp = mysqli_fetch_field_direct($res, 0)->name) && (!is_null($___mysqli_tmp))) ? $___mysqli_tmp : false);
							for($i=0;$i<mysqli_num_fields($res);$i++){
								$___mysqli_tmp=mysqli_fetch_field_direct($res, $i);
								$nom_champ[$i]=$___mysqli_tmp->name;
								//echo "\$nom_champ[$i]=".$___mysqli_tmp->name."<br />";
							}
							while($tab=mysqli_fetch_array($res)) {
								$sql="INSERT INTO ".$tab_table[$j]." SET projet='$projet'";
								for($i=0;$i<count($nom_champ);$i++) {
									//echo "<br />"."\$nom_champ[$i]=".$nom_champ[$i]."<br />";
									// Pour la recopie, on exclut les champs nom initial du projet et id (auto_increment)
									if(($nom_champ[$i]!='projet')&&($nom_champ[$i]!='id')) {$sql.=",".$nom_champ[$i]."='".$tab[$i]."'";}
									//echo "$sql<br />";
								}
								$sql.=";";
								//echo "$sql<br />\n";
								$res2=mysqli_query($GLOBALS["mysqli"], $sql);
							}
						}
					}
				}
				else {
					$msg="Un projet du même nom '$projet' existe déjà.\n";
				}
			}
			else {
				$msg="Les caractères du nom de projet '$projet' ne sont pas valides.\n";
			}
		}
		else {
			$msg="Les caractères du nom de projet original '$projet_original' ne sont pas valides.\n";
		}
		unset($projet);
	}
	elseif(isset($_GET['csv_eleves_classes'])) {
		$csv="";
		if($_GET['csv_eleves_classes']==1) {
			$sql="SELECT elenoet,classe_future FROM gc_eleves_options geo, eleves e WHERE classe_future!='' AND classe_future!='Dep' AND classe_future!='Red' AND projet='$projet' AND e.login=geo.login AND e.elenoet!='';";
			$res=mysqli_query($GLOBALS["mysqli"], $sql);
			while($lig=mysqli_fetch_object($res)) {
				$csv.="$lig->elenoet;$lig->classe_future;\r\n";
			}

			$nom_fic=remplace_accents("g_eleves_classes_-_".$projet."_".strftime("%Y%m%d_%H%M%S"),"all").".csv";
		}
		else {
			$sql="SELECT login,classe_future FROM gc_eleves_options WHERE classe_future!='' AND classe_future!='Dep' AND classe_future!='Red' AND projet='$projet';";
			$res=mysqli_query($GLOBALS["mysqli"], $sql);
			while($lig=mysqli_fetch_object($res)) {
				$csv.="$lig->login;$lig->classe_future;\r\n";
			}

			$nom_fic=remplace_accents("login_ele_classe_-_".$projet."_".strftime("%Y%m%d_%H%M%S"),"all").".csv";
		}
		send_file_download_headers('text/x-csv',$nom_fic);
		echo echo_csv_encoded($csv);
		die();
	}
	elseif(isset($_GET['csv_eleves_options'])) {
		$csv="";

		$sql="SELECT elenoet,classe_future, liste_opt FROM gc_eleves_options geo, eleves e WHERE classe_future!='' AND classe_future!='Dep' AND classe_future!='Red' AND projet='$projet' AND e.login=geo.login AND e.elenoet!='';";
		$res=mysqli_query($GLOBALS["mysqli"], $sql);
		while($lig=mysqli_fetch_object($res)) {
			$csv.="$lig->elenoet;";
			$csv.=preg_replace("/\|/","!",preg_replace("/^\|/","",preg_replace("/\|$/","",$lig->liste_opt)));
			$csv.=";\r\n";
		}

		$nom_fic=remplace_accents("g_eleves_options_-_".$projet."_".strftime("%Y%m%d_%H%M%S"),"all").".csv";

		send_file_download_headers('text/x-csv',$nom_fic);
		echo echo_csv_encoded($csv);
		die();
	}
}

$truncate_tables=isset($_GET['truncate_tables']) ? $_GET['truncate_tables'] : NULL;
if($truncate_tables=='y') {
	$msg="<p>Nettoyage des tables Genèse des classes... <font color='red'>A FAIRE</font></p>\n";
	$sql="TRUNCATE TABLE ...;";
	//$del=mysql_query($sql);
}


//**************** EN-TETE *****************
$titre_page = "Genèse classe: Accueil";
//echo "<div class='noprint'>\n";
require_once("../lib/header.inc.php");
//echo "</div>\n";
//**************** FIN EN-TETE *****************

//debug_var();

//echo "<div class='noprint'>\n";
echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\" name='form1'>\n";
echo "<p class='bold'><a href='../accueil.php'>Accueil</a>";
//echo "</p>\n";
//echo "</div>\n";

if(!isset($projet)) {
	echo "</p>\n";
	echo "</form>\n";

	echo "<h2>Projets</h2>\n";
	echo "<blockquote>\n";

	echo "<table class='boireaus' summary='Action sur les projets'>\n";
	echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\" name='form_creer_projet'>\n";
	echo "<tr class='lig1'>\n";
	echo "<td style='text-align:left;'>\n";
	echo "Créer un nouveau projet&nbsp;: </td><td style='text-align:left;'><input type='text' name='projet' value='' /> <input type='submit' name='creer_projet' value='Créer' />\n";
	echo "</td>\n";
	echo "</tr>\n";
	echo "</form>\n";

	$sql="SELECT * FROM gc_projets ORDER BY projet;";
	$res=mysqli_query($GLOBALS["mysqli"], $sql);
	if(mysqli_num_rows($res)>0) {
		echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\" name='form_select_projet'>\n";
		echo "<tr class='lig-1'>\n";
		echo "<td style='text-align:left;'>\n";
		echo "Sélectionner un projet existant&nbsp;: </td><td style='text-align:left;'>";
		$lignes_select_projet="<select name='projet'>\n";
		while($lig=mysqli_fetch_object($res)) {
			$lignes_select_projet.="<option value='$lig->projet'>$lig->projet</option>\n";
		}
		$lignes_select_projet.="</select>\n";
		echo $lignes_select_projet;
		echo " <input type='submit' name='choix_projet' value='Valider' />\n";
		echo "</td>\n";
		echo "</tr>\n";
		echo "</form>\n";

		echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\" name='form_suppr'>\n";
		echo "<tr class='lig1'>\n";
		echo "<td style='text-align:left;'>\n";
		echo "<p>Supprimer un projet existant&nbsp;: <!--font color='red'>METTRE UN CONFIRM... ET ENSUITE VIRER LES ENREGISTREMENTS ASSOCIéS AU PROJET DANS TOUTES LES TABLES</font--></td><td style='text-align:left;'>";
		echo $lignes_select_projet;
		//echo " <input type='submit' name='suppr_projet' value='Supprimer' /></p>\n";
		echo " <input type='hidden' name='suppr_projet' value='Supprimer' />\n";

		echo " <input type='button' name='btn_suppr_projet' value='Supprimer' ";
		$themessage="Etes-vous sûr de vouloir supprimer le projet?";
		echo "onclick=\"confirm_submit('$themessage');\" />\n";

		echo "<script type='text/javascript'>
	function confirm_submit(themessage)
	{
		var is_confirmed = confirm(themessage);
		if(is_confirmed){
			document.form_suppr.submit();
		}
	}
</script>\n";

		echo "</td>\n";
		echo "</tr>\n";
		echo "</form>\n";



		echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."\" name='form_copie_projet'>\n";
		echo "<tr class='lig-1'>\n";
		echo "<td style='text-align:left;'>\n";
		echo "Faire une copie d'un projet existant&nbsp;: </td><td style='text-align:left;'>";
		echo $lignes_select_projet;
		echo " sous le nom <input type='text' name='projet_new' value='' />";
		echo " <input type='submit' name='copie_projet' value='Copier' /></p>\n";
		echo "</td>\n";
		echo "</tr>\n";
		echo "</form>\n";

	}
	echo "</table>\n";

	echo "</blockquote>\n";

}
else {
	echo " | <a href='index.php'>Autre projet</a>&nbsp;: ";
	$sql="SELECT DISTINCT projet FROM gc_projets ORDER BY projet;";
	$res_proj=mysqli_query($GLOBALS["mysqli"], $sql);
	echo "<select onchange='document.form1.submit();' name='projet'>\n";
	while ($lig_proj=mysqli_fetch_object($res_proj)) {
		echo "<option value='$lig_proj->projet'";
		if($lig_proj->projet==$projet) {echo "selected";}
		echo ">$lig_proj->projet</option>\n";
	}
	echo "</select>\n";
	echo "</p>\n";
	echo "</form>\n";

	echo "<h2>Projet $projet</h2>\n";
	echo "<blockquote>\n";

	// Le projet est choisi:
	// Il faut si les classes, options,... ne sont pas encore choisies, choisir les classes actuelles, les futures,... et les options
	// Pouvoir ajouter une option, une classe,...

	echo "<ol>\n";
	echo "<li><a href='select_classes.php?projet=$projet'>Choisir les classes (<i>actuelles et futures</i>)</a></li>\n";
	echo "<li><a href='select_options.php?projet=$projet'>Choisir les options</a></li>\n";
	echo "<li><a href='liste_options.php?projet=$projet'>Lister les options actuelles des élèves</a></li>\n";
	echo "<li><a href='import_options.php?projet=$projet'>Importer les options futures des élèves d'après un CSV</a></li>\n";
	echo "<li><a href='select_arriv_red.php?projet=$projet'>Sélection des élèves redoublants et/ou arrivants</a></li>\n";
	echo "<li><a href='saisie_contraintes_opt_classe.php?projet=$projet'>Saisir les contraintes sur les classes et options</a><br />(<i>pour exclure la présence de certaines options sur certaines classes</i>)</li>\n";
	echo "<li><a href='select_eleves_options.php?projet=$projet'>Saisir les options des élèves</a></li>\n";
	echo "<li>";
	echo "<a href='affect_eleves_classes.php?projet=$projet'>Affecter les élèves dans les classes</a>\n";
	echo "</li>\n";
	echo "<li>";
	echo "<a href='affiche_listes.php?projet=$projet'>Affichage de listes</a><br />&nbsp;";
	echo "</li>\n";
	echo "<li>Exporter les associations élèves/classes en CSV&nbsp;:<br />
	<a href='".$_SERVER['PHP_SELF']."?projet=$projet&amp;csv_eleves_classes=1'>Export au format requis pour l'initialisation CSV</a> c'est-à-dire ELENOET;CLASSE (*)<br />
	<a href='".$_SERVER['PHP_SELF']."?projet=$projet&amp;csv_eleves_classes=2'>Export au format LOGIN;CLASSE</a><br />
	&nbsp;<br />
	(*) Si vous faites un projet par niveau, il faudra concaténer les exports des différents projets pour effectuer une initialisation CSV.<br />
	De plus, seuls les élèves avec ELENOET renseigné seront exportés (<em>cela risque de ne pas être le cas pour les élèves nouveaux arrivants</em>).<br />&nbsp;
</li>\n";
	echo "<li><p>Exporter les associations élèves/options en CSV&nbsp;:<br />
	<a href='".$_SERVER['PHP_SELF']."?projet=$projet&amp;csv_eleves_options=1'>Export au format requis pour l'initialisation CSV</a> c'est-à-dire ELENOET;OPTION_1!OPTION_2!OPTION_3<br /></p>
	<p style='text-indent:-6em; margin-left:6em;'><em>Attention&nbsp;:</em> Pour le moment, seules les options définies dans le module Genèse des classes sont prises en compte dans le CSV.<br />
	Il faudrait le compléter avec les enseignements communs (<em>FRANC, MATHS, HIGEO, A-PLA,...</em>) pour ne pas supprimer l'inscription dans les enseignements communs lors de l'initialisation CSV.<br />
	Par ailleurs, là-aussi, les g_eleves_options.csv sont à concaténer si vous faites des projets par niveau.</p>
</li>\n";
	echo "</ol>\n";

	echo "</blockquote>\n";
}

echo "<p><i>NOTES</i>&nbsp;:</p>\n";
echo "<ul>\n";
echo "<li><p style='margin-bottom:0.5em;'>Ce module est destiné à permettre de préparer en fin d'année les classes de l'année scolaire suivante.</p></li>\n";
echo "<li><p style='margin-bottom:0.5em;'>Le principal indique les contraintes (<i>telles options sur telles classes uniquement,...</i>) et un ensemble de professeurs, cpe,... tente de fabriquer les classes en respectant les contraintes, en séparant certains élèves, en maintenant ensemble d'autres élèves,...<br />
Faire participer les professeurs et cpe permet d'avoir les points de vue en classe et hors des classes.</p></li>\n";
echo "<li><p style='margin-bottom:0.5em;'>Quelques éléments sur l'utilisation du dispositif&nbsp;:<br />
Les points 1 à 7 doivent être suivis dans l'ordre.<br />
Le point <strong>7.&nbsp;Saisir les options des élèves</strong> doit être validé au moins une fois pour enregistrer les moyennes générales,... dans la table 'gc_eleves_options'.<br />
Ensuite seulement, cette moyenne apparaitra dans les pages suivantes.<br />
Ces préparatifs effectués, on peut générer des listes d'élèves groupés par options afin de préparer sur papier les destinations possibles des élèves des différents groupes.<br />
Certains élèves doivent être affectés dans certaines classes de façon impérative du fait de leur jeu d'options.<br />
On affecte ensuite des élèves en tentant de créer des têtes de classes.<br />
On complète.<br />
On répartit les cas restants.<br />
Et enfin, on génère un affichage des listes de classes futures... ainsi que les regroupements de langues,...</p>
<p style='margin-bottom:0.5em;'>On procède éventuellement à quelques échanges, puis on présente des listes au principal qui accepte ou non la répartition proposée.</p>
</li>";

if((getSettingValue("active_module_absence")=='2')&&(getSettingValue("abs2_import_manuel_bulletin")!='y')&&(acces("/mod_abs2/admin/admin_table_totaux_absences.php", $_SESSION['statut']))) {
	echo "
<li>
<p style='margin-bottom:0.5em;'>Pour que les totaux d'absences, retards,... soient correctement affichés, il convient de <a href='../mod_abs2/admin/admin_table_totaux_absences.php'>remplir la table des totaux d'absences</a>.<br />
Après cette opération de remplissage, il faut valider une fois le formulaire du point numéro <strong>7.&nbsp;Saisir les options des élèves</strong></p>
</li>\n";
}

if(test_alerte_config_suhosin()) {
	$alerte_config_suhosin=alerte_config_suhosin();
	echo "<li>$alerte_config_suhosin</li>\n";
}
echo "</ul>\n";

require("../lib/footer.inc.php");
?>
