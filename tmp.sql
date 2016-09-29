SELECT note, statut
    FROM cn_notes_devoirs, cn_devoirs, cn_conteneurs, cn_cahier_notes, periodes, j_eleves_classes
    WHERE j_eleves_classes.login = "G6112" 
    AND cn_notes_devoirs.id_devoir = cn_devoirs.id
    AND cn_devoirs.nom_court = 3
    AND cn_conteneurs.id = cn_devoirs.id_conteneur
    AND cn_conteneurs.nom_court = "Mathematiques"
    AND cn_cahier_notes.id_cahier_notes = cn_conteneurs.id
    AND cn_cahier_notes.periode = periodes.num_periode
    AND periodes.nom_periode LIKE "Trimestriel%2"
    AND j_eleves_classes.login = cn_notes_devoirs.login
    AND j_eleves_classes.id_classe = periodes.id_classe
    AND periodes.num_periode = j_eleves_classes.periode



SELECT note, statut
    FROM cn_notes_devoirs, cn_devoirs, cn_conteneurs, cn_cahier_notes, periodes, j_eleves_classes
    WHERE j_eleves_classes.login LIKE '%GTD005%' 
    AND cn_notes_devoirs.id_devoir = cn_devoirs.id
    AND cn_devoirs.nom_court LIKE '%3%'
    AND cn_conteneurs.id = cn_devoirs.id_conteneur
    AND cn_conteneurs.nom_court LIKE '%Philosophie%'
    AND cn_cahier_notes.id_cahier_notes = cn_conteneurs.id
    AND cn_cahier_notes.periode = periodes.num_periode
    AND periodes.nom_periode LIKE '%Trimestriel%2%'
    AND j_eleves_classes.login = cn_notes_devoirs.login
    AND j_eleves_classes.id_classe = periodes.id_classe
    AND periodes.num_periode = j_eleves_classes.periode




SELECT DISTINCT(note), statut
    FROM cn_notes_devoirs, cn_devoirs, cn_notes_devoirs, cn_cahier_notes, periodes
    WHERE login LIKE "GTD005" AND cn_notes_devoirs.id_devoir = cn_devoirs.id
    AND cn_devoirs.nom_court LIKE 3
    AND cn_conteneurs.id = cn_devoirs.id_conteneur
    AND cn_conteneurs.nom_court LIKE "Cathechèse"
    AND cn_cahier_notes.id_cahier_notes = cn_conteneurs.id
    AND cn_cahier_notes.periode = periodes.num_periode
    AND periodes.nom_periode LIKE "Trimestriel%2"
