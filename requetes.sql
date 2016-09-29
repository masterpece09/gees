======================== NOTE D UN ELEVE A UNE PERIODE =======================
SELECT note 
FROM cn_conteneurs, cn_notes_conteneurs , cn_cahier_notes, periodes, classes
WHERE cn_notes_conteneurs.login LIKE '%celestin%'
AND cn_conteneurs.id = cn_notes_conteneurs.id_conteneur
AND cn_conteneurs.nom_court LIKE '%EPS%'
AND cn_cahier_notes.id_cahier_notes = cn_conteneurs.id
AND cn_cahier_notes.periode = periodes.num_periode
AND periodes.nom_periode LIKE '%Trimestriel N°1%'
AND classes.id = periodes.id_classe 
AND classes.classe = '2nd c'

================================== NOTE D UN PLAGE A UNE PERIODE ======================
SELECT `sexe`, count(*) 
FROM `cn_cahier_notes`, `periodes`, `cn_conteneurs`, `cn_notes_conteneurs`, `eleves`
WHERE `periodes`.`num_periode` = 1 
AND `cn_cahier_notes`.`periode` = `periodes`.`num_periode`
AND `cn_cahier_notes`.`id_groupe` = 9
AND `periodes`.`id_classe` = 7
AND `cn_conteneurs`.`id` = `cn_cahier_notes`.`id_cahier_notes`
AND `cn_notes_conteneurs`.`id_conteneur` = `cn_conteneurs`.`id`
AND `eleves`.`login` = `cn_notes_conteneurs`.`login`
AND `cn_notes_conteneurs`.`note`>=10
AND `cn_notes_conteneurs`.`note`<18
GROUP BY (`sexe`)


=====================================================================
SELECT `sexe`, count(*) FROM `eleves` WHERE `login` IN (SELECT DISTINCT(`login`) FROM `j_eleves_classes` WHERE `id_classe` = 2) GROUP BY (sexe)


classe = 2 course = 4 periode = 1
classe = 2 course = 4 periode = 1
