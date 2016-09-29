<?php

/* 
 * Célestin 270516
 * Ce fichier contient les fonctions de recopie
 */
header( 'content-type: text/html; charset=utf-8' );

include("./dbconnection.php");

echo "<br/>Opérion terminée!";
if (isset($_POST['classe']) && isset($_POST['periode']))
{
    $classe = $_POST['classe'];
    $periode = $_POST['periode'];
}


//echo "classe: ". $classe;
//echo "<br/> periode: ". $periode;

//On récupère toutes les matière de la clase
$matieres_classe = getMatieresClasse($classe);

for($j = 0; $j < count($matieres_classe); $j++){
    //Pour chaque matiere on recopie les notes
    $matiere = $matieres_classe[$j];
    
    //On récupère l'id du conteneur de la matière dans la classe pour la période courante
    $id_conteneur = getConteneur($periode, $classe, $matiere);
    
    if($periode==6){
        //Tester l'existance du premier devoir N° 6 dans la période

        for($i=1; $i<6; $i++){
            //On récupère les notes du devoir qu'on veut recopier
            $notes = getNotes($i, $matiere, $classe);
            
            if(count($notes)==0){
                //Si les notes n'ont pas encore été renseignées
                echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>".$i."</b>"; 
            }else{
                //On récupère le devoir dont on veut recopier les notes
                $id_devoir = getDevoir($id_conteneur, $i, $matiere);
                //Recopie des notes proprement dite
                recopierDevoirDansPeriode($id_devoir,$notes);
            }
        }
        
        $notes = getNotes(6, $matiere, $classe);
            
        if(count($notes)==0){
            //Si les notes n'ont pas encore été renseignées
            echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>".$i."</b>"; 
        }
        
        //On récupère les élèves de la classe
        $eleves = getElevesClasse($periode, $classe);
        
        //On calcule note de chaque élève
        calculerNotes($eleves, $id_conteneur, $matiere, $classe,$periode);
        
        
    }elseif ($periode==4) {
            //On récupère les notes du devoir qu'on veut recopier
            $notes = getNotes(3, $matiere, $classe);
            
            if(count($notes)==0){
                //Si les notes n'ont pas encore été renseignées
                echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>3</b>"; 
            }else{
                //On récupère le devoir dont on veut recopier les notes
                $id_devoir = getDevoir($id_conteneur, 3, $matiere);

                //Recopie des notes proprement dite
                recopierDevoirDansPeriode($id_devoir,$notes);
            } 
            
            $notes = getNotes(4, $matiere, $classe);
            
            if(count($notes)==0){
                //Si les notes n'ont pas encore été renseignées
                echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>".$i."</b>"; 
            }
            
            //On récupère les élèves de la classe
            $eleves = getElevesClasse($periode, $classe);

            //On calcule note de chaque élève
            calculerNotes($eleves, $id_conteneur, $matiere, $classe,$periode);
    }elseif ($periode==2) {
            //On récupère les notes du devoir qu'on veut recopier
            $notes = getNotes(1, $matiere, $classe);
            
            if(count($notes)==0){
                //Si les notes n'ont pas encore été renseignées
                echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>1</b>"; 
            }else{
                //On récupère le devoir dont on veut recopier les notes
                $id_devoir = getDevoir($id_conteneur, 1, $matiere);

                //Recopie des notes proprement dite
                recopierDevoirDansPeriode($id_devoir,$notes);
            }
            
            $notes = getNotes(2, $matiere, $classe);
            
            if(count($notes)==0){
                //Si les notes n'ont pas encore été renseignées
                echo "<br/>Les notes de la matiere <b>".$matiere."</b> n'ont pas été renseignées pour dand la période N° <b>".$i."</b>"; 
            }
            
            //On récupère les élèves de la classe
            $eleves = getElevesClasse($periode, $classe);

            //On calcule note de chaque élève
            calculerNotes($eleves, $id_conteneur, $matiere, $classe, $periode);
    }  else {
        die("PAS DE RECOPIE POUR CETTE PERIODE");
    }
    
    
    
}




/*
echo "<script type='text/javascript'>
	//window.close();
</script>\n";*/
    


//Célestin 280516
//Cette fonction teste l'existance d'un conteneur de note dans une classe
//Cette fonction teste si coneteneur de devoir exite 
//Crèe le conteneur s'il n'existe pas
//Retourne l'id du conteneur

function getConteneur($periode,$classe,$matiere){
       
    $sql = "SELECT cn_cahier_notes.id_cahier_notes as id "
        . "FROM groupes, j_groupes_classes, cn_cahier_notes "
        . "WHERE cn_cahier_notes.periode = :periode "
        . "AND cn_cahier_notes.id_groupe = j_groupes_classes.id_groupe "
        . "AND j_groupes_classes.id_classe = :classe "
        . "AND j_groupes_classes.id_groupe = groupes.id "
        . "AND groupes.name = :matiere ";

    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);

    $stmt->bindValue(':periode', $periode);  
    $stmt->bindValue(':matiere', $matiere);  
    $stmt->bindValue(':classe', $classe);
    
    
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
     
    
    //fich_debug_bull("/n \n <br/>--ICI- ".$eleve."-".$periode."-".$matiere."-".$devoir);
    $id_conteneur = 0;
    
    while ($row = $stmt->fetch()){	
        $id_conteneur = $row['id'];
    }
    
    if($id_conteneur==0){
        
        //Recherche du groupe
        $id_groupe = getGroupe($matiere, $classe);
        //Création de l'association matère, periode, groupe(matière, classe)
        $id_conteneur = createContenerCahierNote($id_groupe, $periode);
        
        
        //Insertion du conteneur
        createCnContener($matiere, $id_conteneur);
        
    }
    
    return $id_conteneur;
}

//Célestin 280516
//Cette function retourne le groupe (matère dans une classe) d'une matière dans une classe
function getGroupe($matiere, $classe){
    $sql = "SELECT id "
    . "FROM j_groupes_classes, groupes "
    . "WHERE j_groupes_classes.id_classe = :classe "
    . "AND groupes.name = :matiere "
    . "AND j_groupes_classes.id_groupe = groupes.id ";
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':matiere', $matiere);  
    $stmt->bindValue(':classe', $classe);  
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    //fich_debug_bull("/n \n <br/>--ICI- ".$eleve."-".$periode."-".$matiere."-".$devoir);
    $groupe = 0;
     
    while ($row = $stmt->fetch()){	
        $groupe = $row['id'];
    }
    
    if($groupe==0){
        die("<br/>Le groupe de la matière ".$matiere. " n'existe pas dans la classe ". $classe);
    }
    
    return $groupe;
}


//Célestin 280516
function createContenerCahierNote($id_groupe, $periode){
    $sql = "INSERT INTO  cn_cahier_notes(periode, id_groupe) VALUES(:periode, :id_groupe)";
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
    
    $stmt->bindValue(':periode', $periode);  
    $stmt->bindValue(':id_groupe', $id_groupe);
    $stmt->execute();
    
    return $con->connection->lastInsertId();
}


//Célestin 280516
//Cette fonction crée le Cn_conteneur d'une classe pour une période

function createCnContener($matiere, $id){
  $sql = "INSERT INTO  cn_conteneurs(id, id_racine, nom_court, nom_complet, description, mode, coef, arrondir, ponderation, display_parents, display_bulletin, parent, modele_id_conteneur ) "
        ."VALUES(:id, :id, :matiere, :matiere, '', '2', 1.0, 's1', 0.0, '0', '1', 0, 0)";
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
    
    $stmt->bindValue(':id', $id);  
    $stmt->bindValue(':matiere', $matiere); 
    $stmt->execute(); 
}


//Célestin 280516
//Cette fonction retourne toutes les matière dune classe
function getMatieresClasse($classe){
    $sql = "SELECT DISTINCT name "
    . "FROM j_groupes_classes, groupes "
    . "WHERE j_groupes_classes.id_classe = :classe "
    . "AND j_groupes_classes.id_groupe = groupes.id ";
    
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':classe', $classe);  
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    //fich_debug_bull("/n \n <br/>--ICI- ".$eleve."-".$periode."-".$matiere."-".$devoir);
    $matieres = "";
    $i = 0;
     
    while ($row = $stmt->fetch()){
        $matieres[$i] = $row['name'];
        $i++;
    }
    
    return $matieres;
}


//Célestin 280516
//Cétte fonction retourne l'id d'un devoir dans un conteneur
function getDevoir($id_conteneur, $evaluaton, $matiere){
    $sql = "SELECT id "
    . "FROM cn_devoirs "
    . "WHERE cn_devoirs.id_conteneur = :conteneur "
    . "AND cn_devoirs.nom_court = :evaluation";
    
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':evaluation', $evaluaton);  
    $stmt->bindValue(':conteneur', $id_conteneur);  
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    //fich_debug_bull("/n \n <br/>--ICI- ".$eleve."-".$periode."-".$matiere."-".$devoir);
    $devoir = 0;
     
    while ($row = $stmt->fetch()){	
        $devoir = $row['id'];
        deleteDevoir($devoir);
    }
    
    $devoir = createDevoir($id_conteneur,$evaluaton);
    return $devoir;
}



//Celestin 280516
//Cette function crèe un devoir et retourne son id
function createDevoir($idConteneur,$evaluaton){
    $sql = "INSERT INTO  cn_devoirs(id_conteneur, id_racine, nom_court, nom_complet, description, facultatif, 	date, coef, note_sur, ramener_sur_referentiel, display_parents, display_parents_app, date_ele_resp) "
          . "VALUES(:id_conteneur, :id_conteneur, :evaluaton, :evaluaton, '', 'O', :today, 1.0, 20, 'F', '1', '0', :today) ";
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
    
    $today = date('Y-m-d');
    
    $stmt->bindValue(':evaluaton', $evaluaton);  
    $stmt->bindValue(':id_conteneur', $idConteneur);
    $stmt->bindValue(':today', $today);
    $stmt->execute();
    
    return $con->connection->lastInsertId();
}

//Celestin 280515
//Cette function retourne les notes d'une sequence d'une matière dans une classe
//Affiche une message si les notes n'ont pas été renseignées
function getNotes($periode, $matiere, $classe){
     $sql = "SELECT cn_notes_devoirs.login as login, cn_notes_devoirs.note as note, cn_notes_devoirs.statut as statut "
        . "FROM groupes, j_groupes_classes, cn_cahier_notes, cn_devoirs, cn_notes_devoirs "
        . "WHERE cn_cahier_notes.periode = :periode "
        . "AND cn_cahier_notes.id_groupe = j_groupes_classes.id_groupe "
        . "AND j_groupes_classes.id_classe = :classe "
        . "AND j_groupes_classes.id_groupe = groupes.id "
        . "AND (groupes.description = :matiere OR groupes.name = :matiere) "
        . "AND cn_cahier_notes.id_cahier_notes = cn_devoirs.id_conteneur "
        . "AND cn_devoirs.nom_court = :periode "
        . "AND cn_devoirs.id = cn_notes_devoirs.id_devoir ";
     
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':periode', $periode);  
    $stmt->bindValue(':classe', $classe);  
    $stmt->bindValue(':matiere', $matiere);  
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    
    //fich_debug_bull("/n \n <br/>--ICI- ".$eleve."-".$periode."-".$matiere."-".$devoir);
    $notes = null;
    $k = 0;
    
    while ($row = $stmt->fetch()){	
        $notes[$k]['login'] = $row['login'];
        $notes[$k]['note'] = $row['note'];
        $notes[$k]['statut'] = $row['statut'];
        $k++;
    }
    
    //echo "<br/>-".$matiere."--".$classe."--".$periode."----nbr-".$k;
    
    return $notes;
}


//Célestin 280515
//Cette function recopie les notes d'une période vers une autre.
function recopierDevoirDansPeriode($devoir,$notes){
    
    $con = new Connexion();
    
    
    //On supprime d'abord les notes si elles existent
    $sql = "DELETE FROM  cn_notes_devoirs "
        . "WHERE  cn_notes_devoirs.id_devoir = :devoir";
    $stmt = $con->connection->prepare($sql);
    $stmt->bindValue(':devoir', $devoir);    
    $stmt->execute();
    
    //On insere les nouvelles nortes
    foreach ($notes as $note) {
        $sql = "INSERT INTO cn_notes_devoirs(login, note, id_devoir,statut) "
            . "VALUES(:login, :note, :devoir, :statut)";
        $stmt = $con->connection->prepare($sql);
        $stmt->bindValue(':devoir', $devoir);    
        $stmt->bindValue(':login', $note['login']);    
        $stmt->bindValue(':note', $note['note']);    
        $stmt->bindValue(':statut', $note['statut']);    
        $stmt->execute();
        //echo "<br/> NOTES INS".$note['login']."-".$note['note']."--".$note['statut'];
    } 
}

//Célesti  290516
//Cette fonction retourne la liste des élève d'un clase
function getElevesClasse($periode, $classe){
    $sql = "SELECT j_eleves_classes.login as login "
        . "FROM  j_eleves_classes "
        . "WHERE j_eleves_classes.id_classe = :classe "
        . "AND j_eleves_classes.periode = :periode ";
     
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':periode', $periode);  
    $stmt->bindValue(':classe', $classe);    
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    $eleves = null;
    $k = 0;
    
    while ($row = $stmt->fetch()){	
        $eleves[$k] = $row['login'];
        $k++;
    }
    
    return $eleves;
}


//Célestin 290516
//Cette fonction  calcule la moyenne des notes des élève à pour un devoir
function calculerNotes($eleves, $id_conteneur, $matiere, $classe,$periode){
    $groupe = getGroupe($matiere, $classe);
    foreach ($eleves as $eleve) {
        
        //On récupère les notes d'un élève à un devoir
        $notes = getEleveNotes($eleve, $id_conteneur);
        
        //On calcule la moyenne des notes
        $nbr = count($notes);
        if($nbr!=0){
            $note = 0;
            for($m = 0; $m<$nbr; $m++){
                $note = $note + $notes[$m];
            }
            $note = $note/$nbr;
            registerNote($note, $eleve, $id_conteneur);
            registerNoteBulletin($note, $eleve, $groupe,$periode);
        }
    }
}

//Célestin 290516
//Cette fonction retourne toutes les notes d'un élève à une période
function getEleveNotes($eleve, $id_conteneur){
    $sql = "SELECT cn_notes_devoirs.note as note "
        . "FROM  cn_devoirs, cn_conteneurs, cn_notes_devoirs "
        . "WHERE cn_conteneurs.id = :conteneur "
        . "AND cn_conteneurs.id = cn_devoirs.id_conteneur "
        . "AND cn_devoirs.id = cn_notes_devoirs.id_devoir "
        . "AND cn_notes_devoirs.login = :eleve "
        . "AND cn_notes_devoirs.statut!='v' "
        . "AND cn_notes_devoirs.statut!='-' "
        . "AND cn_notes_devoirs.statut!='abs' ";
     
    $con = new Connexion();
    $stmt = $con->connection->prepare($sql);
      
    $stmt->bindValue(':conteneur', $id_conteneur);  
    $stmt->bindValue(':eleve', $eleve);    
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
       
    $notes = null;
    $k = 0;
    
    while ($row = $stmt->fetch()){	
        $notes[$k] = $row['note'];
        $k++;
    }
    
    return $notes;
}


//Célestin 290516
//Cette fonction enregistre la moyenne des notes à un devoir
function registerNote($note, $eleve, $id_conteneur){
    $con = new Connexion();
    
    $sql = "DELETE FROM  cn_notes_conteneurs "
        . "WHERE  login = :login "
        . "AND id_conteneur = :id_conteneur";
    $stmt = $con->connection->prepare($sql);
    $stmt->bindValue(':login', $eleve);
    $stmt->bindValue(':id_conteneur', $id_conteneur);  
    $stmt->execute();
    
    
    $sql = "INSERT INTO  cn_notes_conteneurs(login, id_conteneur, note, statut, comment) "
            . "VALUES(:login, :id_conteneur, :note, 'y', '')";
    
    $stmt = $con->connection->prepare($sql);
    
    
    $stmt->bindValue(':login', $eleve);  
    $stmt->bindValue(':note', $note);
    $stmt->bindValue(':id_conteneur', $id_conteneur);
    $stmt->execute();
}


//Célestin 290516
//Cette funtion supprime un devoir
function deleteDevoir($devoir){
   $con = new Connexion();
    
   //Suppresion des notes
    $sql = "DELETE FROM  cn_notes_devoirs "
        . "WHERE  id_devoir = :devoir ";
    $stmt = $con->connection->prepare($sql);
    $stmt->bindValue(':devoir', $devoir);
    $stmt->execute();
    
    //Suppresion du devoir
    $sql = "DELETE FROM  cn_devoirs "
        . "WHERE  id = :devoir" ;
    $stmt = $con->connection->prepare($sql);
    $stmt->bindValue(':devoir', $devoir); 
    $stmt->execute();
}

//Célestin 300516
//Cette fonction rempli les notes dans le bulletin 
function registerNoteBulletin($note, $eleve, $groupe, $periode){
    $con = new Connexion();
    
    $sql = "DELETE FROM  matieres_notes "
        . "WHERE  login = :login "
        . "AND groupe = :groupe";
    $stmt = $con->connection->prepare($sql);
    $stmt->bindValue(':login', $eleve);
    $stmt->bindValue(':groupe', $groupe);  
    $stmt->execute();
    
    
    $sql = "INSERT INTO  matieres_notes(login, id_groupe, periode, note, rang) "
            . "VALUES(:login, :groupe, :periode, :note, 0)";
    
    $stmt = $con->connection->prepare($sql);
    
    
    $stmt->bindValue(':login', $eleve);  
    $stmt->bindValue(':note', $note);
    $stmt->bindValue(':groupe', $groupe);
    $stmt->bindValue(':periode', $periode);
    $stmt->execute();
}