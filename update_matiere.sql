UPDATE cn_conteneurs SET `nom_court` = "littérature", `nom_complet` = "littérature" WHERE `nom_court` = "littetrature"

UPDATE groupes SET `name` = "littérature", `description` = "littérature" WHERE `name` = "littetrature" 

UPDATE cn_conteneurs SET `nom_court` = "Dessin Technique", `nom_complet` = "Dessin Technique" WHERE `nom_court` = "DessinTechnique";

UPDATE groupes SET `name` = "Dessin Technique", `description` = "Dessin Technique" WHERE `name` = "DessinTechnique" ;


UPDATE cn_conteneurs SET `nom_court` = "Langue Francaise", `nom_complet` = "Langue Francaise" WHERE `nom_court` = "LangueFrancaise" OR `nom_complet` = "LangueFrancaise" ;

UPDATE groupes SET `name` = "Langue Francaise", `description` = "Langue Francaise" WHERE `name` = "LangueFrancaise" OR `description` = "LangueFrancaise";

UPDATE j_professeurs_matieres SET `id_matiere` = "Langue Francaise" WHERE `id_matiere` = "LangueFrancaise";

UPDATE `j_groupes_matieres` SET `id_matiere`="Langue Francaise" WHERE `id_matiere`="LangueFrancaise";

UPDATE `matieres` SET `matiere`="Langue Francaise", `nom_complet`="Langue Francaise" WHERE `matiere`="LangueFrancaise" OR `nom_complet` ="LangueFrancaise";







UPDATE cn_conteneurs SET `nom_court` = "Histoire du Costume", `nom_complet` = "Histoire du Costume" WHERE `nom_court` = "HistoireCoutume" OR `nom_complet` = "HistoireCoutume" ;

UPDATE groupes SET `name` = "Histoire du Costume", `description` = "Histoire du Costume" WHERE `name` = "HistoireCoutume" OR `description` = "HistoireCoutume";

UPDATE `matieres` SET `matiere`="Histoire du Costume", `nom_complet`="Histoire du Costume" WHERE `matiere`="HistoireCoutume" OR `nom_complet` ="HistoireCoutume";

UPDATE j_professeurs_matieres SET `id_matiere` = "Histoire du Costume" WHERE `id_matiere` = "HistoireCoutume";

UPDATE `j_groupes_matieres` SET `id_matiere`="Histoire du Costume" WHERE `id_matiere`="HistoireCoutume";

===========================================================================
UPDATE cn_conteneurs SET `nom_court` = "CATECHESE", `nom_complet` = "CATECHESE" WHERE `nom_court` = "Cathechèse" OR `nom_complet` = "Cathechèse" ;

UPDATE groupes SET `name` = "CATECHESE", `description` = "CATECHESE" WHERE `name` = "Cathechèse" OR `description` = "Cathechèse";

UPDATE `matieres` SET `matiere`="CATECHESE", `nom_complet`="CATECHESE" WHERE `matiere`="Cathechèse" OR `nom_complet` ="Cathechèse";

UPDATE j_professeurs_matieres SET `id_matiere` = "CATECHESE" WHERE `id_matiere` = "CAT";

UPDATE `j_groupes_matieres` SET `id_matiere`="CATECHESE" WHERE `id_matiere`="CAT";
================================================================================================

UPDATE cn_conteneurs SET `nom_court` = "Mathematiques", `nom_complet` = "Mathematiques" WHERE `nom_court` = "MATHS" OR `nom_complet` = "MATHS" ;

UPDATE groupes SET `name` = "Mathematiques", `description` = "Mathematiques" WHERE `name` = "MATHS" OR `description` = "MATHS";

UPDATE `matieres` SET `matiere`="Mathematiques", `nom_complet`="Mathematiques" WHERE `matiere`="MATHS" OR `nom_complet` ="MATHS";

UPDATE j_professeurs_matieres SET `id_matiere` = "Mathematiques" WHERE `id_matiere` = "MATHS";

UPDATE `j_groupes_matieres` SET `id_matiere`="Mathematiques" WHERE `id_matiere`="MATHS";



