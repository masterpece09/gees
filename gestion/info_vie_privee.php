<?php

/*
 *
 * Copyright 2001-2012 Thomas Belliard, Laurent Delineau, Edouard Hue, Eric Lebrun
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


//**************** EN-TETE *****************
require_once("../lib/header.inc.php");
//**************** FIN EN-TETE *************

?>
<H1 class='gepi'>GEES - Vie Privée</H1>
<?php
echo "<H2>1/ Cookies</H2>";

echo "A chacune de vos visites GEES tente de générer un cookie de session. L'acceptation de ce cookie par votre navigateur est obligatoire pour accéder au site. Ce cookie de session est un cookie temporaire exigé pour des

raisons de sécurité. Ce type de cookie n'enregistre pas d'information sur votre ordinateur, il vous attribue un numéro de session

 qu'il communique au serveur pour pouvoir suivre votre session en toute sécurité. Il est mis temporairement dans la mémoire de

  votre ordinateur et est exploitable uniquement durant le temps de connexion. Il est ensuite détruit lorsque vous vous déconnectez ou

  lorsque vous fermez toutes les fenêtres de votre navigateur.";



echo "<H2>2/ Informations transmises</H2>";



echo "Lors de l'ouverture d'une session certaines informations sont transmises au serveur :

<ul>

<li>le numéro de votre session (voir ci-dessus),</li>

<li>votre identifiant,</li>

<li>l'adresse IP de votre machine,</li>

<li>le type de votre navigateur,

<li>l'origine de la connexion au présent site,</li>

<li>les heures et dates de début et fin de la session.</li>

</ul>";

switch (getSettingValue("duree_conservation_logs")) {

case 30:

$duree="un mois";

break;

case 60:

$duree="deux mois";

break;

case 183:

$duree="six mois";

break;

case 365:

$duree="un an";

break;

}

echo "Pour des raisons de sécurité, ces informations sont conservées pendant <b>".$duree."</b> à partir de leur enregistrement.";



echo "<H2>3/ Sécurité</H2>";

echo "<b>Par mesure de sécurité, pensez à vous déconnecter à la fin de votre visite sur le site (lien en haut à droite).</b>";

require("../lib/footer.inc.php");
?>
