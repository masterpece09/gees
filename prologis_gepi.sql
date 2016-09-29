-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 24 Janvier 2016 à 07:11
-- Version du serveur: 5.5.42-37.1-log
-- Version de PHP: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `prologis_gepi`
--

-- --------------------------------------------------------

--
-- Structure de la table `absences`
--

DROP TABLE IF EXISTS `absences`;
CREATE TABLE IF NOT EXISTS `absences` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `periode` int(11) NOT NULL DEFAULT '0',
  `nb_absences` char(2) NOT NULL DEFAULT '',
  `non_justifie` char(2) NOT NULL DEFAULT '',
  `nb_retards` char(2) NOT NULL DEFAULT '',
  `appreciation` text NOT NULL,
  PRIMARY KEY (`login`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `absences`
--

INSERT INTO `absences` (`login`, `periode`, `nb_absences`, `non_justifie`, `nb_retards`, `appreciation`) VALUES
('alida', 1, '4', '2', '1', ''),
('kelly', 1, '2', '0', '1', ''),
('celestin', 1, '12', '5', '1', ''),
('sc_5', 1, '1', '1', '0', ''),
('celestin', 2, '0', '0', '0', 'Obsevons'),
('sc_5', 2, '0', '0', '0', 'Observation sg');

-- --------------------------------------------------------

--
-- Structure de la table `absences_actions`
--

DROP TABLE IF EXISTS `absences_actions`;
CREATE TABLE IF NOT EXISTS `absences_actions` (
  `id_absence_action` int(11) NOT NULL AUTO_INCREMENT,
  `init_absence_action` char(2) NOT NULL DEFAULT '',
  `def_absence_action` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_absence_action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `absences_actions`
--

INSERT INTO `absences_actions` (`id_absence_action`, `init_absence_action`, `def_absence_action`) VALUES
(1, 'RC', 'Renvoi du cours'),
(2, 'RD', 'Renvoi d&eacute;finitif'),
(3, 'LP', 'Lettre aux parents'),
(4, 'CE', 'Demande de convocation de l&#039;&eacute;l&egrave;ve en vie scolaire'),
(5, 'A', 'Aucune');

-- --------------------------------------------------------

--
-- Structure de la table `absences_creneaux_bis`
--

DROP TABLE IF EXISTS `absences_creneaux_bis`;
CREATE TABLE IF NOT EXISTS `absences_creneaux_bis` (
  `id_definie_periode` int(11) NOT NULL AUTO_INCREMENT,
  `nom_definie_periode` varchar(10) NOT NULL DEFAULT '',
  `heuredebut_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `heurefin_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `suivi_definie_periode` tinyint(4) NOT NULL,
  `type_creneaux` varchar(15) NOT NULL,
  PRIMARY KEY (`id_definie_periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `absences_eleves`
--

DROP TABLE IF EXISTS `absences_eleves`;
CREATE TABLE IF NOT EXISTS `absences_eleves` (
  `id_absence_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `type_absence_eleve` char(1) NOT NULL DEFAULT '',
  `eleve_absence_eleve` varchar(25) NOT NULL DEFAULT '0',
  `justify_absence_eleve` char(3) NOT NULL DEFAULT '',
  `info_justify_absence_eleve` text NOT NULL,
  `motif_absence_eleve` varchar(4) NOT NULL DEFAULT '',
  `info_absence_eleve` text NOT NULL,
  `d_date_absence_eleve` date NOT NULL DEFAULT '0000-00-00',
  `a_date_absence_eleve` date DEFAULT NULL,
  `d_heure_absence_eleve` time DEFAULT NULL,
  `a_heure_absence_eleve` time DEFAULT NULL,
  `saisie_absence_eleve` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_absence_eleve`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `absences_eleves`
--

INSERT INTO `absences_eleves` (`id_absence_eleve`, `type_absence_eleve`, `eleve_absence_eleve`, `justify_absence_eleve`, `info_justify_absence_eleve`, `motif_absence_eleve`, `info_absence_eleve`, `d_date_absence_eleve`, `a_date_absence_eleve`, `d_heure_absence_eleve`, `a_heure_absence_eleve`, `saisie_absence_eleve`) VALUES
(1, 'A', 'alexy', 'N', '', 'A', '', '2015-12-22', '2015-12-22', '08:00:00', '09:50:00', 'adonia'),
(2, 'A', 'tata', 'N', '', 'A', '', '2015-12-22', '2015-12-22', '08:00:00', '09:50:00', 'adonia'),
(3, 'A', 'kelly', 'N', '', 'A', '', '2015-12-22', '2015-12-22', '08:00:00', '11:00:00', 'math');

-- --------------------------------------------------------

--
-- Structure de la table `absences_gep`
--

DROP TABLE IF EXISTS `absences_gep`;
CREATE TABLE IF NOT EXISTS `absences_gep` (
  `id_seq` char(2) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `absences_motifs`
--

DROP TABLE IF EXISTS `absences_motifs`;
CREATE TABLE IF NOT EXISTS `absences_motifs` (
  `id_motif_absence` int(11) NOT NULL AUTO_INCREMENT,
  `init_motif_absence` char(2) NOT NULL DEFAULT '',
  `def_motif_absence` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_motif_absence`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `absences_motifs`
--

INSERT INTO `absences_motifs` (`id_motif_absence`, `init_motif_absence`, `def_motif_absence`) VALUES
(1, 'A', 'Aucun motif'),
(2, 'AS', 'Accident sport'),
(3, 'AT', 'Absent en retenue'),
(4, 'C', 'Dans la cour'),
(5, 'CF', 'Convenances familiales'),
(6, 'CO', 'Convocation bureau'),
(7, 'CS', 'Compétition sportive'),
(8, 'DI', 'Dispense d''E.P.S.'),
(9, 'ET', 'Erreur d''emploi du temps'),
(10, 'EX', 'Examen'),
(11, 'H', 'Hospitalisation'),
(12, 'JP', 'Justification par le Principal'),
(13, 'MA', 'Maladie'),
(14, 'OR', 'Conseiller'),
(15, 'PR', 'Réveil'),
(16, 'RC', 'Refus de venir en cours'),
(17, 'RE', 'Renvoi'),
(18, 'RT', 'Présent en retenue'),
(19, 'RV', 'Renvoi du cours'),
(20, 'SM', 'Refus de justification'),
(21, 'SP', 'Sortie pédagogique'),
(22, 'ST', 'Stage à l''extérieur'),
(23, 'T', 'Téléphone'),
(24, 'TR', 'Transport'),
(25, 'VM', 'Visite médicale'),
(26, 'IN', 'Infirmerie');

-- --------------------------------------------------------

--
-- Structure de la table `absences_rb`
--

DROP TABLE IF EXISTS `absences_rb`;
CREATE TABLE IF NOT EXISTS `absences_rb` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `eleve_id` varchar(30) NOT NULL,
  `retard_absence` varchar(1) NOT NULL DEFAULT 'A',
  `groupe_id` varchar(8) NOT NULL,
  `edt_id` int(5) NOT NULL DEFAULT '0',
  `jour_semaine` varchar(10) NOT NULL,
  `creneau_id` int(5) NOT NULL,
  `debut_ts` int(11) NOT NULL,
  `fin_ts` int(11) NOT NULL,
  `date_saisie` int(20) NOT NULL,
  `login_saisie` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eleve_debut_fin_retard` (`eleve_id`,`debut_ts`,`fin_ts`,`retard_absence`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `absences_rb`
--

INSERT INTO `absences_rb` (`id`, `eleve_id`, `retard_absence`, `groupe_id`, `edt_id`, `jour_semaine`, `creneau_id`, `debut_ts`, `fin_ts`, `date_saisie`, `login_saisie`) VALUES
(1, 'alexy', 'A', '4', 0, 'Mardi', 1, 1450767600, 1450774200, 1450757220, 'adonia'),
(2, 'tata', 'A', '4', 0, 'Mardi', 1, 1450767600, 1450774200, 1450757220, 'adonia'),
(3, 'appel', 'A', '4', 0, 'Mardi', 1, 1450767600, 1450774200, 1450757700, 'adonia'),
(4, 'kelly', 'A', '2', 0, 'Mardi', 1, 1450767600, 1450778400, 1450757880, 'math'),
(5, 'appel', 'A', '2', 0, 'Mardi', 1, 1450767600, 1450778400, 1450757880, 'math');

-- --------------------------------------------------------

--
-- Structure de la table `absences_repas`
--

DROP TABLE IF EXISTS `absences_repas`;
CREATE TABLE IF NOT EXISTS `absences_repas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `date_repas` date NOT NULL DEFAULT '0000-00-00',
  `id_groupe` varchar(8) NOT NULL,
  `eleve_id` varchar(30) NOT NULL,
  `pers_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `abs_prof`
--

DROP TABLE IF EXISTS `abs_prof`;
CREATE TABLE IF NOT EXISTS `abs_prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(50) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `abs_prof_divers`
--

DROP TABLE IF EXISTS `abs_prof_divers`;
CREATE TABLE IF NOT EXISTS `abs_prof_divers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `abs_prof_remplacement`
--

DROP TABLE IF EXISTS `abs_prof_remplacement`;
CREATE TABLE IF NOT EXISTS `abs_prof_remplacement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_absence` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `id_aid` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `jour` char(8) NOT NULL,
  `id_creneau` int(11) NOT NULL,
  `date_debut_r` datetime NOT NULL,
  `date_fin_r` datetime NOT NULL,
  `reponse` varchar(30) NOT NULL,
  `date_reponse` datetime NOT NULL,
  `login_user` varchar(50) NOT NULL,
  `commentaire_prof` text NOT NULL,
  `validation_remplacement` varchar(30) NOT NULL,
  `commentaire_validation` text NOT NULL,
  `salle` varchar(100) NOT NULL,
  `texte_famille` text NOT NULL,
  `info_famille` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acces_cdt`
--

DROP TABLE IF EXISTS `acces_cdt`;
CREATE TABLE IF NOT EXISTS `acces_cdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `chemin` varchar(255) NOT NULL DEFAULT '',
  `date1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acces_cdt_groupes`
--

DROP TABLE IF EXISTS `acces_cdt_groupes`;
CREATE TABLE IF NOT EXISTS `acces_cdt_groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_acces` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acces_cn`
--

DROP TABLE IF EXISTS `acces_cn`;
CREATE TABLE IF NOT EXISTS `acces_cn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `date_limite` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaires` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Acces exceptionnel au CN en periode close' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acces_exceptionnel_matieres_notes`
--

DROP TABLE IF EXISTS `acces_exceptionnel_matieres_notes`;
CREATE TABLE IF NOT EXISTS `acces_exceptionnel_matieres_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `date_limite` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaires` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Acces exceptionnel à la modif de notes du bulletin en periode close' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `aid`
--

DROP TABLE IF EXISTS `aid`;
CREATE TABLE IF NOT EXISTS `aid` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `nom` varchar(100) NOT NULL DEFAULT '',
  `numero` varchar(8) NOT NULL DEFAULT '0',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  `perso1` varchar(255) NOT NULL DEFAULT '',
  `perso2` varchar(255) NOT NULL DEFAULT '',
  `perso3` varchar(255) NOT NULL DEFAULT '',
  `productions` varchar(100) NOT NULL DEFAULT '',
  `resume` text NOT NULL,
  `famille` smallint(6) NOT NULL DEFAULT '0',
  `mots_cles` varchar(255) NOT NULL DEFAULT '',
  `adresse1` varchar(255) NOT NULL DEFAULT '',
  `adresse2` varchar(255) NOT NULL DEFAULT '',
  `public_destinataire` varchar(50) NOT NULL DEFAULT '',
  `contacts` text NOT NULL,
  `divers` text NOT NULL,
  `matiere1` varchar(100) NOT NULL DEFAULT '',
  `matiere2` varchar(100) NOT NULL DEFAULT '',
  `eleve_peut_modifier` enum('y','n') NOT NULL DEFAULT 'n',
  `prof_peut_modifier` enum('y','n') NOT NULL DEFAULT 'n',
  `cpe_peut_modifier` enum('y','n') NOT NULL DEFAULT 'n',
  `fiche_publique` enum('y','n') NOT NULL DEFAULT 'n',
  `affiche_adresse1` enum('y','n') NOT NULL DEFAULT 'n',
  `en_construction` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `aid_appreciations`
--

DROP TABLE IF EXISTS `aid_appreciations`;
CREATE TABLE IF NOT EXISTS `aid_appreciations` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_aid` varchar(100) NOT NULL DEFAULT '',
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  `statut` char(10) NOT NULL DEFAULT '',
  `note` float DEFAULT NULL,
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`id_aid`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `aid_config`
--

DROP TABLE IF EXISTS `aid_config`;
CREATE TABLE IF NOT EXISTS `aid_config` (
  `nom` char(100) NOT NULL DEFAULT '',
  `nom_complet` char(100) NOT NULL DEFAULT '',
  `note_max` int(11) NOT NULL DEFAULT '0',
  `order_display1` char(1) NOT NULL DEFAULT '0',
  `order_display2` int(11) NOT NULL DEFAULT '0',
  `type_note` char(5) NOT NULL DEFAULT '',
  `display_begin` int(11) NOT NULL DEFAULT '0',
  `display_end` int(11) NOT NULL DEFAULT '0',
  `message` varchar(40) NOT NULL,
  `display_nom` char(1) NOT NULL DEFAULT '',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  `display_bulletin` char(1) NOT NULL DEFAULT 'y',
  `bull_simplifie` char(1) NOT NULL DEFAULT 'y',
  `outils_complementaires` enum('y','n') NOT NULL DEFAULT 'n',
  `feuille_presence` enum('y','n') NOT NULL DEFAULT 'n',
  `autoriser_inscript_multiples` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`indice_aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `aid_familles`
--

DROP TABLE IF EXISTS `aid_familles`;
CREATE TABLE IF NOT EXISTS `aid_familles` (
  `ordre_affichage` smallint(6) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL DEFAULT '0',
  `type` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `aid_familles`
--

INSERT INTO `aid_familles` (`ordre_affichage`, `id`, `type`) VALUES
(0, 10, 'Information, presse'),
(1, 11, 'Philosophie et psychologie, pensée'),
(2, 12, 'Religions'),
(3, 13, 'Sciences sociales, société, humanitaire'),
(4, 14, 'Langues, langage'),
(5, 15, 'Sciences (sciences dures)'),
(6, 16, 'Techniques, sciences appliquées, médecine, cuisine...'),
(7, 17, 'Arts, loisirs et sports'),
(8, 18, 'Littérature, théâtre, poésie'),
(9, 19, 'Géographie et Histoire, civilisations anciennes');

-- --------------------------------------------------------

--
-- Structure de la table `aid_productions`
--

DROP TABLE IF EXISTS `aid_productions`;
CREATE TABLE IF NOT EXISTS `aid_productions` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `aid_productions`
--

INSERT INTO `aid_productions` (`id`, `nom`) VALUES
(1, 'Dossier papier'),
(2, 'Emission de radio'),
(3, 'Exposition'),
(4, 'Film'),
(5, 'Spectacle'),
(6, 'Réalisation plastique'),
(7, 'Réalisation technique ou scientifique'),
(8, 'Jeu vidéo'),
(9, 'Animation culturelle'),
(10, 'Maquette'),
(11, 'Site internet'),
(12, 'Diaporama'),
(13, 'Production musicale'),
(14, 'Production théâtrale'),
(15, 'Animation en milieu scolaire'),
(16, 'Programmation logicielle'),
(17, 'Journal');

-- --------------------------------------------------------

--
-- Structure de la table `aid_public`
--

DROP TABLE IF EXISTS `aid_public`;
CREATE TABLE IF NOT EXISTS `aid_public` (
  `ordre_affichage` smallint(6) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL DEFAULT '0',
  `public` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `aid_public`
--

INSERT INTO `aid_public` (`ordre_affichage`, `id`, `public`) VALUES
(3, 1, 'Lycéens'),
(2, 2, 'Collègiens'),
(1, 3, 'Ecoliers'),
(6, 4, 'Grand public'),
(5, 5, 'Experts (ou spécialistes)'),
(4, 6, 'Etudiants');

-- --------------------------------------------------------

--
-- Structure de la table `archivage_aids`
--

DROP TABLE IF EXISTS `archivage_aids`;
CREATE TABLE IF NOT EXISTS `archivage_aids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(200) NOT NULL,
  `nom` varchar(100) NOT NULL DEFAULT '',
  `id_type_aid` int(11) NOT NULL DEFAULT '0',
  `productions` varchar(100) NOT NULL DEFAULT '',
  `resume` text NOT NULL,
  `famille` smallint(6) NOT NULL DEFAULT '0',
  `mots_cles` text NOT NULL,
  `adresse1` varchar(255) NOT NULL DEFAULT '',
  `adresse2` varchar(255) NOT NULL DEFAULT '',
  `public_destinataire` varchar(50) NOT NULL DEFAULT '',
  `contacts` text NOT NULL,
  `divers` text NOT NULL,
  `matiere1` varchar(100) NOT NULL DEFAULT '',
  `matiere2` varchar(100) NOT NULL DEFAULT '',
  `fiche_publique` enum('y','n') NOT NULL DEFAULT 'n',
  `affiche_adresse1` enum('y','n') NOT NULL DEFAULT 'n',
  `en_construction` enum('y','n') NOT NULL DEFAULT 'n',
  `notes_moyenne` varchar(255) NOT NULL,
  `notes_min` varchar(255) NOT NULL,
  `notes_max` varchar(255) NOT NULL,
  `responsables` text NOT NULL,
  `eleves` text NOT NULL,
  `eleves_resp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `archivage_aid_eleve`
--

DROP TABLE IF EXISTS `archivage_aid_eleve`;
CREATE TABLE IF NOT EXISTS `archivage_aid_eleve` (
  `id_aid` int(11) NOT NULL DEFAULT '0',
  `id_eleve` varchar(255) NOT NULL,
  `eleve_resp` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_aid`,`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `archivage_appreciations_aid`
--

DROP TABLE IF EXISTS `archivage_appreciations_aid`;
CREATE TABLE IF NOT EXISTS `archivage_appreciations_aid` (
  `id_eleve` varchar(255) NOT NULL,
  `annee` varchar(200) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `id_aid` int(11) NOT NULL,
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  `note_eleve` varchar(50) NOT NULL,
  `note_moyenne_classe` varchar(255) NOT NULL,
  `note_min_classe` varchar(255) NOT NULL,
  `note_max_classe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_eleve`,`id_aid`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `archivage_disciplines`
--

DROP TABLE IF EXISTS `archivage_disciplines`;
CREATE TABLE IF NOT EXISTS `archivage_disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(200) NOT NULL,
  `INE` varchar(255) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `mef_code` varchar(50) NOT NULL,
  `num_periode` tinyint(4) NOT NULL,
  `nom_periode` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `matiere` varchar(255) NOT NULL,
  `code_matiere` varchar(255) NOT NULL,
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `effectif` smallint(6) NOT NULL,
  `prof` varchar(255) NOT NULL,
  `nom_prof` varchar(50) NOT NULL,
  `prenom_prof` varchar(50) NOT NULL,
  `note` varchar(255) NOT NULL,
  `moymin` varchar(255) NOT NULL,
  `moymax` varchar(255) NOT NULL,
  `moyclasse` varchar(255) NOT NULL,
  `repar_moins_8` float(4,2) NOT NULL,
  `repar_8_12` float(4,2) NOT NULL,
  `repar_plus_12` float(4,2) NOT NULL,
  `rang` tinyint(4) NOT NULL,
  `appreciation` mediumtext NOT NULL,
  `nb_absences` int(11) NOT NULL,
  `non_justifie` int(11) NOT NULL,
  `nb_retards` int(11) NOT NULL,
  `ordre_matiere` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `annee` (`annee`),
  KEY `INE` (`INE`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Contenu de la table `archivage_disciplines`
--

INSERT INTO `archivage_disciplines` (`id`, `annee`, `INE`, `classe`, `mef_code`, `num_periode`, `nom_periode`, `special`, `matiere`, `code_matiere`, `id_groupe`, `effectif`, `prof`, `nom_prof`, `prenom_prof`, `note`, `moymin`, `moymax`, `moyclasse`, `repar_moins_8`, `repar_8_12`, `repar_plus_12`, `rang`, `appreciation`, `nb_absences`, `non_justifie`, `nb_retards`, `ordre_matiere`) VALUES
(1, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 1, 'Séquentielle N°1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '', 4, 2, 1, 0),
(2, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 1, 'Séquentielle N°1', 'AVIS_CONSEIL', '', '', 0, 2, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(3, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'Histoire', '', 1, 2, 'M. Histoire H. ', 'Histoire', 'Histoire', '15.0', '12.0', '15.0', '13.5', 0.00, 0.00, 99.99, 1, '-', 0, 0, 0, 0),
(4, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'Mathematique', '', 2, 2, 'M. mathematique m. ', 'mathematique', 'mathematique', '14.0', '14.0', '18.0', '16', 0.00, 0.00, 99.99, 2, '0', 0, 0, 0, 12),
(5, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'PHYSIQUE COMPLET', '', 3, 2, 'M. physique p. ', 'physique', 'physique', '14.0', '12.0', '14.0', '13', 0.00, 0.00, 99.99, 1, '-', 0, 0, 0, 11),
(6, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 1, 'Séquentielle N°1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '', 2, 0, 1, 0),
(7, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 1, 'Séquentielle N°1', 'AVIS_CONSEIL', '', '', 0, 2, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(8, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'Histoire', '', 1, 2, 'M. Histoire H. ', 'Histoire', 'Histoire', '12.0', '12.0', '15.0', '13.5', 0.00, 0.00, 99.99, 2, '-', 0, 0, 0, 0),
(9, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'Mathematique', '', 2, 2, 'M. mathematique m. ', 'mathematique', 'mathematique', '18.0', '14.0', '18.0', '16', 0.00, 0.00, 99.99, 1, '0', 0, 0, 0, 12),
(10, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 1, 'Séquentielle N°1', '', 'PHYSIQUE COMPLET', '', 3, 2, 'M. physique p. ', 'physique', 'physique', '12.0', '12.0', '14.0', '13', 0.00, 0.00, 99.99, 2, '-', 0, 0, 0, 11),
(11, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 2, 'Séquentielle N°2', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(12, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 2, 'Séquentielle N°2', 'AVIS_CONSEIL', '', '', 0, 2, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(13, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'Histoire', '', 1, 2, 'M. Histoire H. ', 'Histoire', 'Histoire', '8.0', '8.0', '12.0', '10', 0.00, 50.00, 50.00, 0, '0', 0, 0, 0, 0),
(14, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'Mathematique', '', 2, 2, 'M. mathematique m. ', 'mathematique', 'mathematique', '14.0', '14.0', '18.0', '16', 0.00, 0.00, 99.99, 2, '0', 0, 0, 0, 12),
(15, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'PHYSIQUE COMPLET', '', 3, 2, 'M. physique p. ', 'physique', 'physique', '15.0', '15.0', '16.0', '15.5', 0.00, 0.00, 99.99, 2, '-', 0, 0, 0, 11),
(16, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 2, 'Séquentielle N°2', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(17, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 2, 'Séquentielle N°2', 'AVIS_CONSEIL', '', '', 0, 2, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(18, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'Histoire', '', 1, 2, 'M. Histoire H. ', 'Histoire', 'Histoire', '12.0', '8.0', '12.0', '10', 0.00, 50.00, 50.00, 0, '0', 0, 0, 0, 0),
(19, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'Mathematique', '', 2, 2, 'M. mathematique m. ', 'mathematique', 'mathematique', '18.0', '14.0', '18.0', '16', 0.00, 0.00, 99.99, 1, '0', 0, 0, 0, 12),
(20, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 2, 'Séquentielle N°2', '', 'PHYSIQUE COMPLET', '', 3, 2, 'M. physique p. ', 'physique', 'physique', '16.0', '15.0', '16.0', '15.5', 0.00, 0.00, 99.99, 1, '-', 0, 0, 0, 11),
(21, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 3, 'Trimestrielle 1', 'ABSENCES', '', '', 0, 0, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(22, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 3, 'Trimestrielle 1', 'AVIS_CONSEIL', '', '', 0, 0, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(23, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 3, 'Trimestrielle 1', 'ABSENCES', '', '', 0, 0, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(24, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 3, 'Trimestrielle 1', 'AVIS_CONSEIL', '', '', 0, 0, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(25, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 4, 'Période 8', 'ABSENCES', '', '', 0, 0, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(26, '2015/2016', 'LOGIN_alida', '3ième 1', '-1', 4, 'Période 8', 'AVIS_CONSEIL', '', '', 0, 0, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(27, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 4, 'Période 8', 'ABSENCES', '', '', 0, 0, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(28, '2015/2016', 'LOGIN_kelly', '3ième 1', '-1', 4, 'Période 8', 'AVIS_CONSEIL', '', '', 0, 0, 'ELoundou  Prénom et nom du signataire des bulletin', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(29, '2015/2016', '', '3ième 1', '', 0, 'ANNEE', 'GRP_ANNEE', 'Histoire', '', 1, 0, 'M. Histoire H. ', 'Histoire', 'Histoire', '', '11.5', '12', '11.75', 0.00, 50.00, 50.00, 0, '', 0, 0, 0, 0),
(30, '2015/2016', '', '3ième 1', '', 0, 'ANNEE', 'GRP_ANNEE', 'Mathematique', '', 2, 0, 'M. mathematique m. ', 'mathematique', 'mathematique', '', '14', '18', '16', 0.00, 0.00, 99.99, 0, '', 0, 0, 0, 12),
(31, '2015/2016', '', '3ième 1', '', 0, 'ANNEE', 'GRP_ANNEE', 'PHYSIQUE COMPLET', '', 3, 0, 'M. physique p. ', 'physique', 'physique', '', '14', '14.5', '14.25', 0.00, 0.00, 99.99, 0, '', 0, 0, 0, 11),
(32, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 1, 'Séquentielle N°1', 'ABSENCES', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(33, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 1, 'Séquentielle N°1', 'AVIS_CONSEIL', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(34, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 1, 'Séquentielle N°1', '', 'Histoire', '', 6, 1, 'M. Histoire H. ', 'Histoire', 'Histoire', '10.0', '10.0', '10.0', '10', 0.00, 99.99, 0.00, 1, '-', 0, 0, 0, 0),
(35, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 2, 'Séquentielle N°2', 'ABSENCES', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(36, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 2, 'Séquentielle N°2', 'AVIS_CONSEIL', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(37, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 2, 'Séquentielle N°2', '', 'Histoire', '', 6, 1, 'M. Histoire H. ', 'Histoire', 'Histoire', '12.0', '12.0', '12.0', '12', 0.00, 0.00, 99.99, 0, '-', 0, 0, 0, 0),
(38, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 3, 'Trimestrielle N°1', 'ABSENCES', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(39, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 3, 'Trimestrielle N°1', 'AVIS_CONSEIL', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(40, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 3, 'Trimestrielle N°1', '', 'Histoire', '', 6, 1, 'M. Histoire H. ', 'Histoire', 'Histoire', '11.0', '11.0', '11.0', '11', 0.00, 99.99, 0.00, 1, '-', 0, 0, 0, 0),
(41, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 4, 'Séquentielle N°3', 'ABSENCES', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(42, '2015/2016', 'LOGIN_abena_41', '4e', '-1', 4, 'Séquentielle N°3', 'AVIS_CONSEIL', '', '', 0, 1, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(43, '2015/2016', '', '4e', '', 0, 'ANNEE', 'GRP_ANNEE', 'Histoire', '', 6, 0, 'M. Histoire H. ', 'Histoire', 'Histoire', '', '11', '11', '11', 0.00, 99.99, 0.00, 0, '', 0, 0, 0, 0),
(44, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 1, 'sequentiellel1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(45, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 1, 'sequentiellel1', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(46, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 1, 'sequentiellel1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(47, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 1, 'sequentiellel1', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(48, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 2, 'sequentiellel2', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(49, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 2, 'sequentiellel2', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(50, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 2, 'sequentiellel2', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(51, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 2, 'sequentiellel2', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(52, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 3, 'Trimestrielle 1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(53, '2015/2016', 'LOGIN_abena_62', '6eme2', '-1', 3, 'Trimestrielle 1', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(54, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 3, 'Trimestrielle 1', 'ABSENCES', '', '', 0, 2, 'M. surveillant s. ', 'surveillant', 'surveillant', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(55, '2015/2016', 'LOGIN_tete_62', '6eme2', '-1', 3, 'Trimestrielle 1', 'AVIS_CONSEIL', '', '', 0, 2, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(56, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 1, 'Seq 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(57, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 1, 'Seq 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(58, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 1, 'Seq 1', '', 'INFORMATIQUE', '', 4, 1, 'Mlle NGUEKAME M. ', 'NGUEKAME', 'MARIE', '18.0', '18.0', '18.0', '18', 0.00, 0.00, 99.99, 1, '0TOTO', 0, 0, 0, 0),
(59, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 1, 'Seq 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(60, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 1, 'Seq 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(61, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 1, 'Seq 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(62, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 1, 'Seq 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(63, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 2, 'Seq 2', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(64, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 2, 'Seq 2', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(65, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 2, 'Seq 2', '', 'INFORMATIQUE', '', 4, 1, 'Mlle NGUEKAME M. ', 'NGUEKAME', 'MARIE', '18.0', '18.0', '18.0', '18', 0.00, 0.00, 99.99, 1, '0TOTO', 0, 0, 0, 0),
(66, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 2, 'Seq 2', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(67, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 2, 'Seq 2', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(68, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 2, 'Seq 2', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(69, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 2, 'Seq 2', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(70, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 3, 'Trim 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(71, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 3, 'Trim 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(72, '2015/2016', 'LOGIN_alexy', '6ième1', '-1', 3, 'Trim 1', '', 'INFORMATIQUE', '', 4, 1, 'Mlle NGUEKAME M. ', 'NGUEKAME', 'MARIE', '18.5', '18.5', '18.5', '18.5', 0.00, 0.00, 99.99, 1, '-', 0, 0, 0, 0),
(73, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 3, 'Trim 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(74, '2015/2016', 'LOGIN_tata', '6ième1', '-1', 3, 'Trim 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(75, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 3, 'Trim 1', 'ABSENCES', '', '', 0, 3, '', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(76, '2015/2016', 'LOGIN_toto', '6ième1', '-1', 3, 'Trim 1', 'AVIS_CONSEIL', '', '', 0, 3, 'JOSEPH-PRINCIPAL', '', '', '', '', '', '', 0.00, 0.00, 0.00, 0, '-', 0, 0, 0, 0),
(77, '2015/2016', '', '6ième1', '', 0, 'ANNEE', 'GRP_ANNEE', 'INFORMATIQUE', '', 4, 1, 'Mlle NGUEKAME M. ', 'NGUEKAME', 'MARIE', '', '18.166666666667', '18.166666666667', '18.166666666667', 0.00, 0.00, 99.99, 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `archivage_ects`
--

DROP TABLE IF EXISTS `archivage_ects`;
CREATE TABLE IF NOT EXISTS `archivage_ects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(255) NOT NULL COMMENT 'Annee scolaire',
  `ine` varchar(55) NOT NULL COMMENT 'Identifiant de l''eleve',
  `classe` varchar(255) NOT NULL COMMENT 'Classe de l''eleve',
  `num_periode` int(11) NOT NULL COMMENT 'Identifiant de la periode',
  `nom_periode` varchar(255) NOT NULL COMMENT 'Nom complet de la periode',
  `special` varchar(255) NOT NULL COMMENT 'Cle utilisee pour isoler certaines lignes (par exemple un credit ECTS pour une periode et non une matiere)',
  `matiere` varchar(255) DEFAULT NULL COMMENT 'Nom de l''enseignement',
  `profs` varchar(255) DEFAULT NULL COMMENT 'Liste des profs de l''enseignement',
  `valeur` decimal(10,0) NOT NULL COMMENT 'Nombre de crédits obtenus par l''eleve',
  `mention` varchar(255) NOT NULL COMMENT 'Mention obtenue',
  PRIMARY KEY (`id`,`ine`,`num_periode`,`special`),
  KEY `archivage_ects_FI_1` (`ine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `archivage_eleves`
--

DROP TABLE IF EXISTS `archivage_eleves`;
CREATE TABLE IF NOT EXISTS `archivage_eleves` (
  `ine` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `sexe` char(1) NOT NULL,
  `naissance` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`ine`),
  KEY `nom` (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `archivage_eleves`
--

INSERT INTO `archivage_eleves` (`ine`, `nom`, `prenom`, `sexe`, `naissance`) VALUES
('LOGIN_alida', 'ZOBO', 'Justine', 'F', '1995-10-05'),
('LOGIN_kelly', 'Meyo', 'NTSAMA', 'M', '1993-03-02'),
('LOGIN_abena_41', 'abena', 'abena', 'M', '2000-05-21'),
('LOGIN_abena_62', 'abena', 'abena', 'M', '2001-01-01'),
('LOGIN_tete_62', 'tete', 'tete', 'M', '2000-01-01'),
('LOGIN_alexy', 'NSTAMA', 'Alexy', 'F', '2013-10-10'),
('LOGIN_tata', 'tata', 'tata', 'M', '1993-01-01'),
('LOGIN_toto', 'toto', 'toto', 'M', '1991-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `archivage_eleves2`
--

DROP TABLE IF EXISTS `archivage_eleves2`;
CREATE TABLE IF NOT EXISTS `archivage_eleves2` (
  `annee` varchar(50) NOT NULL,
  `ine` varchar(50) NOT NULL,
  `doublant` enum('-','R') NOT NULL DEFAULT '-',
  `regime` varchar(255) NOT NULL,
  PRIMARY KEY (`ine`,`annee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `archivage_eleves2`
--

INSERT INTO `archivage_eleves2` (`annee`, `ine`, `doublant`, `regime`) VALUES
('2015/2016', 'LOGIN_alida', '-', 'd/p'),
('2015/2016', 'LOGIN_kelly', '-', 'd/p'),
('2015/2016', 'LOGIN_abena_41', '-', 'd/p'),
('2015/2016', 'LOGIN_abena_62', '-', 'd/p'),
('2015/2016', 'LOGIN_tete_62', '-', 'd/p'),
('2015/2016', 'LOGIN_alexy', '-', 'ext.'),
('2015/2016', 'LOGIN_tata', '-', 'd/p'),
('2015/2016', 'LOGIN_toto', '-', 'd/p');

-- --------------------------------------------------------

--
-- Structure de la table `archivage_engagements`
--

DROP TABLE IF EXISTS `archivage_engagements`;
CREATE TABLE IF NOT EXISTS `archivage_engagements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(100) NOT NULL,
  `ine` varchar(255) NOT NULL,
  `code_engagement` varchar(10) NOT NULL,
  `nom_engagement` varchar(100) NOT NULL,
  `description_engagement` text NOT NULL,
  `classe` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `archivage_types_aid`
--

DROP TABLE IF EXISTS `archivage_types_aid`;
CREATE TABLE IF NOT EXISTS `archivage_types_aid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(200) NOT NULL,
  `nom` varchar(100) NOT NULL DEFAULT '',
  `nom_complet` varchar(100) NOT NULL DEFAULT '',
  `note_sur` int(11) NOT NULL DEFAULT '0',
  `type_note` varchar(5) NOT NULL DEFAULT '',
  `display_bulletin` char(1) NOT NULL DEFAULT 'y',
  `outils_complementaires` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ateliers_config`
--

DROP TABLE IF EXISTS `ateliers_config`;
CREATE TABLE IF NOT EXISTS `ateliers_config` (
  `nom_champ` char(100) NOT NULL DEFAULT '',
  `content` char(255) NOT NULL DEFAULT '',
  `param` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `avis_conseil_classe`
--

DROP TABLE IF EXISTS `avis_conseil_classe`;
CREATE TABLE IF NOT EXISTS `avis_conseil_classe` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `periode` int(11) NOT NULL DEFAULT '0',
  `avis` text NOT NULL,
  `id_mention` int(11) NOT NULL DEFAULT '0',
  `statut` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`login`,`periode`),
  KEY `login` (`login`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `a_agregation_decompte`
--

DROP TABLE IF EXISTS `a_agregation_decompte`;
CREATE TABLE IF NOT EXISTS `a_agregation_decompte` (
  `eleve_id` int(11) NOT NULL COMMENT 'id de l''eleve',
  `date_demi_jounee` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date de la demi journée agrégée : 00:00 pour une matinée, 12:00 pour une après midi',
  `manquement_obligation_presence` tinyint(4) DEFAULT '0' COMMENT 'Cette demi journée est comptée comme absence',
  `non_justifiee` tinyint(4) DEFAULT '0' COMMENT 'Si cette demi journée est compté comme absence, y a-t-il une justification',
  `notifiee` tinyint(4) DEFAULT '0' COMMENT 'Si cette demi journée est compté comme absence, y a-t-il une notification à la famille',
  `retards` int(11) DEFAULT '0' COMMENT 'Nombre de retards total décomptés dans la demi journée',
  `retards_non_justifies` int(11) DEFAULT '0' COMMENT 'Nombre de retards non justifiés décomptés dans la demi journée',
  `motifs_absences` text COMMENT 'Liste des motifs (table a_motifs) associés à cette demi-journée d''absence',
  `motifs_retards` text COMMENT 'Liste des motifs (table a_motifs) associés aux retard de cette demi-journée',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`eleve_id`,`date_demi_jounee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table d''agregation des decomptes de demi journees d''absence et de retard';

-- --------------------------------------------------------

--
-- Structure de la table `a_justifications`
--

DROP TABLE IF EXISTS `a_justifications`;
CREATE TABLE IF NOT EXISTS `a_justifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire auto-incrementee',
  `nom` varchar(250) NOT NULL COMMENT 'Nom de la justification',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `sortable_rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Liste des justifications possibles pour une absence' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_lieux`
--

DROP TABLE IF EXISTS `a_lieux`;
CREATE TABLE IF NOT EXISTS `a_lieux` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cle primaire auto-incrementee',
  `nom` varchar(250) NOT NULL COMMENT 'Nom du lieu',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Lieu pour les types d''absence ou les saisies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_motifs`
--

DROP TABLE IF EXISTS `a_motifs`;
CREATE TABLE IF NOT EXISTS `a_motifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire auto-incrementee',
  `nom` varchar(250) NOT NULL COMMENT 'Nom du motif',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `sortable_rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Liste des motifs possibles pour une absence' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_notifications`
--

DROP TABLE IF EXISTS `a_notifications`;
CREATE TABLE IF NOT EXISTS `a_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui envoi la notification',
  `a_traitement_id` int(12) NOT NULL COMMENT 'cle etrangere du traitement qu''on notifie',
  `type_notification` int(5) DEFAULT NULL COMMENT 'type de notification (0 : email, 1 : courrier, 2 : sms)',
  `email` varchar(100) DEFAULT NULL COMMENT 'email de destination (pour le type email)',
  `telephone` varchar(100) DEFAULT NULL COMMENT 'numero du telephone de destination (pour le type sms)',
  `adr_id` varchar(10) DEFAULT NULL COMMENT 'cle etrangere vers l''adresse de destination (pour le type courrier)',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `statut_envoi` int(5) DEFAULT '0' COMMENT 'Statut de cet envoi (0 : etat initial, 1 : en cours, 2 : echec, 3 : succes, 4 : succes avec accuse de reception)',
  `date_envoi` datetime DEFAULT NULL COMMENT 'Date envoi',
  `erreur_message_envoi` text COMMENT 'Message d''erreur retourné par le service d''envoi',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_notifications_FI_1` (`utilisateur_id`),
  KEY `a_notifications_FI_2` (`a_traitement_id`),
  KEY `a_notifications_FI_3` (`adr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Notification (a la famille) des absences' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_saisies`
--

DROP TABLE IF EXISTS `a_saisies`;
CREATE TABLE IF NOT EXISTS `a_saisies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a saisi l''absence',
  `eleve_id` int(11) DEFAULT NULL COMMENT 'id_eleve de l''eleve objet de la saisie, egal à null si aucun eleve n''est saisi',
  `commentaire` text COMMENT 'commentaire de l''utilisateur',
  `debut_abs` datetime DEFAULT NULL COMMENT 'Debut de l''absence en timestamp UNIX',
  `fin_abs` datetime DEFAULT NULL COMMENT 'Fin de l''absence en timestamp UNIX',
  `id_edt_creneau` int(12) DEFAULT NULL COMMENT 'identifiant du creneaux de l''emploi du temps',
  `id_edt_emplacement_cours` int(12) DEFAULT NULL COMMENT 'identifiant du cours de l''emploi du temps',
  `id_groupe` int(11) DEFAULT NULL COMMENT 'identifiant du groupe pour lequel la saisie a ete effectuee',
  `id_classe` int(11) DEFAULT NULL COMMENT 'identifiant de la classe pour lequel la saisie a ete effectuee',
  `id_aid` int(11) DEFAULT NULL COMMENT 'identifiant de l''aid pour lequel la saisie a ete effectuee',
  `id_s_incidents` int(11) DEFAULT NULL COMMENT 'identifiant de la saisie d''incident discipline',
  `id_lieu` int(11) DEFAULT NULL COMMENT 'cle etrangere du lieu ou se trouve l''eleve',
  `deleted_by` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a supprimé la saisie',
  `created_at` datetime DEFAULT NULL COMMENT 'Date de creation de la saisie',
  `updated_at` datetime DEFAULT NULL COMMENT 'Date de modification de la saisie, y compris suppression, restauration et changement de version',
  `deleted_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_saisies_I_1` (`deleted_at`),
  KEY `a_saisies_I_2` (`debut_abs`),
  KEY `a_saisies_I_3` (`fin_abs`),
  KEY `a_saisies_FI_1` (`utilisateur_id`),
  KEY `a_saisies_FI_2` (`eleve_id`),
  KEY `a_saisies_FI_3` (`id_edt_creneau`),
  KEY `a_saisies_FI_4` (`id_edt_emplacement_cours`),
  KEY `a_saisies_FI_5` (`id_groupe`),
  KEY `a_saisies_FI_6` (`id_classe`),
  KEY `a_saisies_FI_7` (`id_aid`),
  KEY `a_saisies_FI_8` (`id_lieu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Chaque saisie d''absence doit faire l''objet d''une ligne dans la table a_saisies. Une saisie peut etre : une plage horaire longue durée (plusieurs jours), défini avec les champs debut_abs et fin_abs. Un creneau horaire, le jour etant precisé dans debut_abs. Un cours de l''emploi du temps, le jours du cours etant precisé dans debut_abs.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_saisies_version`
--

DROP TABLE IF EXISTS `a_saisies_version`;
CREATE TABLE IF NOT EXISTS `a_saisies_version` (
  `id` int(11) NOT NULL,
  `utilisateur_id` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a saisi l''absence',
  `eleve_id` int(11) DEFAULT NULL COMMENT 'id_eleve de l''eleve objet de la saisie, egal à null si aucun eleve n''est saisi',
  `commentaire` text COMMENT 'commentaire de l''utilisateur',
  `debut_abs` datetime DEFAULT NULL COMMENT 'Debut de l''absence en timestamp UNIX',
  `fin_abs` datetime DEFAULT NULL COMMENT 'Fin de l''absence en timestamp UNIX',
  `id_edt_creneau` int(12) DEFAULT NULL COMMENT 'identifiant du creneaux de l''emploi du temps',
  `id_edt_emplacement_cours` int(12) DEFAULT NULL COMMENT 'identifiant du cours de l''emploi du temps',
  `id_groupe` int(11) DEFAULT NULL COMMENT 'identifiant du groupe pour lequel la saisie a ete effectuee',
  `id_classe` int(11) DEFAULT NULL COMMENT 'identifiant de la classe pour lequel la saisie a ete effectuee',
  `id_aid` int(11) DEFAULT NULL COMMENT 'identifiant de l''aid pour lequel la saisie a ete effectuee',
  `id_s_incidents` int(11) DEFAULT NULL COMMENT 'identifiant de la saisie d''incident discipline',
  `id_lieu` int(11) DEFAULT NULL COMMENT 'cle etrangere du lieu ou se trouve l''eleve',
  `deleted_by` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a supprimé la saisie',
  `created_at` datetime DEFAULT NULL COMMENT 'Date de creation de la saisie',
  `updated_at` datetime DEFAULT NULL COMMENT 'Date de modification de la saisie, y compris suppression, restauration et changement de version',
  `deleted_at` datetime DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `version_created_at` datetime DEFAULT NULL,
  `version_created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `a_traitements`
--

DROP TABLE IF EXISTS `a_traitements`;
CREATE TABLE IF NOT EXISTS `a_traitements` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire auto-incremente',
  `utilisateur_id` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a fait le traitement',
  `a_type_id` int(4) DEFAULT NULL COMMENT 'cle etrangere du type d''absence',
  `a_motif_id` int(4) DEFAULT NULL COMMENT 'cle etrangere du motif d''absence',
  `a_justification_id` int(4) DEFAULT NULL COMMENT 'cle etrangere de la justification de l''absence',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `modifie_par_utilisateur_id` varchar(100) DEFAULT NULL COMMENT 'Login de l''utilisateur professionnel qui a modifie en dernier le traitement',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_traitements_I_1` (`deleted_at`),
  KEY `a_traitements_FI_1` (`utilisateur_id`),
  KEY `a_traitements_FI_2` (`a_type_id`),
  KEY `a_traitements_FI_3` (`a_motif_id`),
  KEY `a_traitements_FI_4` (`a_justification_id`),
  KEY `a_traitements_FI_5` (`modifie_par_utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Un traitement peut gerer plusieurs saisies et consiste à definir les motifs/justifications... de ces absences saisies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_types`
--

DROP TABLE IF EXISTS `a_types`;
CREATE TABLE IF NOT EXISTS `a_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cle primaire auto-incrementee',
  `nom` varchar(250) NOT NULL COMMENT 'Nom du type d''absence',
  `justification_exigible` tinyint(4) DEFAULT NULL COMMENT 'Ce type d''absence doit entrainer une justification de la part de la famille',
  `sous_responsabilite_etablissement` varchar(255) DEFAULT 'NON_PRECISE' COMMENT 'L''eleve est sous la responsabilite de l''etablissement. Typiquement : absence infirmerie, mettre la propriété à vrai car l''eleve est encore sous la responsabilité de l''etablissement. Possibilite : ''vrai''/''faux''/''non_precise''',
  `manquement_obligation_presence` varchar(50) DEFAULT 'NON_PRECISE' COMMENT 'L''eleve manque à ses obligations de presence (L''absence apparait sur le bulletin). Possibilite : ''vrai''/''faux''/''non_precise''',
  `retard_bulletin` varchar(50) DEFAULT 'NON_PRECISE' COMMENT 'La saisie est comptabilisée dans le bulletin en tant que retard. Possibilite : ''vrai''/''faux''/''non_precise''',
  `mode_interface` varchar(50) DEFAULT 'NON_PRECISE' COMMENT 'Enumeration des possibilités de l''interface de saisie de l''absence pour ce type : DEBUT_ABS, FIN_ABS, DEBUT_ET_FIN_ABS, NON_PRECISE, COMMENTAIRE_EXIGE, DISCIPLINE, CHECKBOX, CHECKBOX_HIDDEN',
  `commentaire` text COMMENT 'commentaire saisi par l''utilisateur',
  `id_lieu` int(11) DEFAULT NULL COMMENT 'cle etrangere du lieu ou se trouve l''élève',
  `sortable_rank` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_types_FI_1` (`id_lieu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Liste des types d''absences possibles dans l''etablissement' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `a_types_statut`
--

DROP TABLE IF EXISTS `a_types_statut`;
CREATE TABLE IF NOT EXISTS `a_types_statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cle primaire auto-incrementee',
  `id_a_type` int(11) NOT NULL COMMENT 'Cle etrangere de la table a_type',
  `statut` varchar(20) NOT NULL COMMENT 'Statut de l''utilisateur',
  PRIMARY KEY (`id`),
  KEY `a_types_statut_FI_1` (`id_a_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Liste des statuts autorises à saisir des types d''absences' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cc_dev`
--

DROP TABLE IF EXISTS `cc_dev`;
CREATE TABLE IF NOT EXISTS `cc_dev` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cn_dev` int(11) NOT NULL DEFAULT '0',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `nom_complet` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `arrondir` char(2) NOT NULL DEFAULT 's1',
  `vision_famille` text NOT NULL COMMENT 'Autorisation de voir pour les familles',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cc_eval`
--

DROP TABLE IF EXISTS `cc_eval`;
CREATE TABLE IF NOT EXISTS `cc_eval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dev` int(11) NOT NULL DEFAULT '0',
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `nom_complet` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note_sur` int(11) DEFAULT '5',
  `vision_famille` date NOT NULL COMMENT 'Autorisation de voir pour les familles',
  PRIMARY KEY (`id`),
  KEY `dev_date` (`id_dev`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cc_notes_eval`
--

DROP TABLE IF EXISTS `cc_notes_eval`;
CREATE TABLE IF NOT EXISTS `cc_notes_eval` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_eval` int(11) NOT NULL DEFAULT '0',
  `note` float(10,1) NOT NULL DEFAULT '0.0',
  `statut` varchar(4) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`login`,`id_eval`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classe` varchar(100) NOT NULL DEFAULT '',
  `nom_complet` varchar(100) NOT NULL DEFAULT '',
  `suivi_par` varchar(50) NOT NULL DEFAULT '',
  `formule` varchar(100) NOT NULL DEFAULT '',
  `format_nom` varchar(5) NOT NULL DEFAULT '',
  `format_nom_eleve` varchar(5) NOT NULL DEFAULT 'np',
  `display_rang` char(1) NOT NULL DEFAULT 'n',
  `display_address` char(1) NOT NULL DEFAULT 'n',
  `display_coef` char(1) NOT NULL DEFAULT 'y',
  `display_mat_cat` char(1) NOT NULL DEFAULT 'n',
  `display_nbdev` char(1) NOT NULL DEFAULT 'n',
  `display_moy_gen` char(1) NOT NULL DEFAULT 'y',
  `modele_bulletin_pdf` varchar(255) DEFAULT NULL,
  `rn_nomdev` char(1) NOT NULL DEFAULT 'n',
  `rn_toutcoefdev` char(1) NOT NULL DEFAULT 'n',
  `rn_coefdev_si_diff` char(1) NOT NULL DEFAULT 'n',
  `rn_datedev` char(1) NOT NULL DEFAULT 'n',
  `rn_sign_chefetab` char(1) NOT NULL DEFAULT 'n',
  `rn_sign_pp` char(1) NOT NULL DEFAULT 'n',
  `rn_sign_resp` char(1) NOT NULL DEFAULT 'n',
  `rn_sign_nblig` int(11) NOT NULL DEFAULT '3',
  `rn_formule` text NOT NULL,
  `ects_type_formation` varchar(255) NOT NULL DEFAULT '',
  `ects_parcours` varchar(255) NOT NULL DEFAULT '',
  `ects_code_parcours` varchar(255) NOT NULL DEFAULT '',
  `ects_domaines_etude` varchar(255) NOT NULL DEFAULT '',
  `ects_fonction_signataire_attestation` varchar(255) NOT NULL DEFAULT '',
  `apb_niveau` varchar(15) NOT NULL DEFAULT '',
  `rn_abs_2` varchar(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`),
  KEY `classe` (`classe`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`id`, `classe`, `nom_complet`, `suivi_par`, `formule`, `format_nom`, `format_nom_eleve`, `display_rang`, `display_address`, `display_coef`, `display_mat_cat`, `display_nbdev`, `display_moy_gen`, `modele_bulletin_pdf`, `rn_nomdev`, `rn_toutcoefdev`, `rn_coefdev_si_diff`, `rn_datedev`, `rn_sign_chefetab`, `rn_sign_pp`, `rn_sign_resp`, `rn_sign_nblig`, `rn_formule`, `ects_type_formation`, `ects_parcours`, `ects_code_parcours`, `ects_domaines_etude`, `ects_fonction_signataire_attestation`, `apb_niveau`, `rn_abs_2`) VALUES
(1, '3ième 1', '3ième 1', 'ELoundou  Prénom et nom du signataire des bulletin', 'Formule à insérer sur les bulletins ....', 'cni', 'np', 'y', 'y', 'y', 'n', 'y', 'y', '1', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 3, '', '', '', '', '', '', '', 'y'),
(2, '6ième1', '6ième1', 'JOSEPH-PRINCIPAL', '', 'cni', 'np', 'y', 'n', 'y', 'y', 'y', 'y', '1', 'y', 'n', 'n', 'n', 'y', 'y', 'y', 3, '', '', '', '', '', '', '', 'y'),
(3, '4e', '4e', '', '', 'cni', 'np', 'n', 'n', 'n', 'y', 'n', 'n', '3', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 3, '', '', '', '', '', '', '', 'n'),
(4, '6eme2', 'sixième2', '', '', 'cni', 'np', 'n', 'n', 'n', 'n', 'n', 'n', '1', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 3, '', '', '', '', '', '', '', 'n'),
(5, '5eme', 'cinquieme', '', '', 'cni', 'np', 'n', 'n', 'n', 'n', 'n', 'n', '1', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 3, '', '', '', '', '', '', '', 'n'),
(6, 'Tle C', 'Tle C', '', '', 'cni', 'np', 'y', 'y', 'y', 'y', 'y', 'y', '1', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 3, '', '', '', '', '', '', '', 'y'),
(7, '2nd c', 'seconde C', '', '', 'cni', 'np', 'n', 'n', 'n', 'y', 'n', 'n', '1', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 3, '', '', '', '', '', '', '', 'n');

-- --------------------------------------------------------

--
-- Structure de la table `classes_param`
--

DROP TABLE IF EXISTS `classes_param`;
CREATE TABLE IF NOT EXISTS `classes_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_classe` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_classe_name` (`id_classe`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Contenu de la table `classes_param`
--

INSERT INTO `classes_param` (`id`, `id_classe`, `name`, `value`) VALUES
(1, 1, 'rn_aff_classe_nom', '2'),
(2, 1, 'rn_app', 'y'),
(3, 1, 'rn_moy_classe', 'y'),
(4, 1, 'rn_moy_min_max_classe', 'y'),
(5, 1, 'rn_retour_ligne', 'y'),
(6, 1, 'rn_rapport_standard_min_font', '12'),
(7, 1, 'rn_adr_resp', 'n'),
(8, 1, 'rn_bloc_obs', 'y'),
(9, 1, 'rn_col_moy', 'y'),
(10, 1, 'rn_type_par_defaut', 'pdf'),
(11, 1, 'bull_prefixe_periode', ' '),
(12, 1, 'gepi_prof_suivi', 'professeur principal'),
(13, 2, 'rn_aff_classe_nom', '1'),
(14, 2, 'rn_app', 'n'),
(15, 2, 'rn_moy_classe', 'n'),
(16, 2, 'rn_moy_min_max_classe', 'n'),
(17, 2, 'rn_retour_ligne', 'n'),
(18, 2, 'rn_rapport_standard_min_font', 'n'),
(19, 2, 'rn_adr_resp', 'n'),
(20, 2, 'rn_bloc_obs', 'n'),
(21, 2, 'rn_col_moy', 'n'),
(22, 2, 'rn_type_par_defaut', 'html'),
(23, 2, 'bull_prefixe_periode', ' '),
(24, 2, 'gepi_prof_suivi', 'professeur principal'),
(25, 3, 'rn_aff_classe_nom', '1'),
(26, 3, 'rn_app', 'n'),
(27, 3, 'rn_moy_classe', 'n'),
(28, 3, 'rn_moy_min_max_classe', 'n'),
(29, 3, 'rn_retour_ligne', 'n'),
(30, 3, 'rn_rapport_standard_min_font', 'n'),
(31, 3, 'rn_adr_resp', 'n'),
(32, 3, 'rn_bloc_obs', 'n'),
(33, 3, 'rn_col_moy', 'n'),
(34, 3, 'rn_type_par_defaut', 'pdf'),
(35, 3, 'bull_prefixe_periode', ' '),
(36, 3, 'gepi_prof_suivi', 'professeur principal'),
(37, 4, 'rn_aff_classe_nom', '2'),
(38, 4, 'rn_app', 'n'),
(39, 4, 'rn_moy_classe', 'n'),
(40, 4, 'rn_moy_min_max_classe', 'n'),
(41, 4, 'rn_retour_ligne', 'n'),
(42, 4, 'rn_rapport_standard_min_font', 'n'),
(43, 4, 'rn_adr_resp', 'n'),
(44, 4, 'rn_bloc_obs', 'n'),
(45, 4, 'rn_col_moy', 'n'),
(46, 4, 'rn_type_par_defaut', 'pdf'),
(47, 4, 'bull_prefixe_periode', ' '),
(48, 4, 'gepi_prof_suivi', 'AP'),
(49, 5, 'rn_aff_classe_nom', '1'),
(50, 5, 'rn_app', 'n'),
(51, 5, 'rn_moy_classe', 'n'),
(52, 5, 'rn_moy_min_max_classe', 'n'),
(53, 5, 'rn_retour_ligne', 'n'),
(54, 5, 'rn_rapport_standard_min_font', 'n'),
(55, 5, 'rn_adr_resp', 'n'),
(56, 5, 'rn_bloc_obs', 'n'),
(57, 5, 'rn_col_moy', 'n'),
(58, 5, 'rn_type_par_defaut', 'html'),
(59, 5, 'bull_prefixe_periode', ' '),
(60, 5, 'gepi_prof_suivi', 'professeur principal'),
(61, 6, 'rn_aff_classe_nom', '2'),
(62, 6, 'rn_app', 'n'),
(63, 6, 'rn_moy_classe', 'n'),
(64, 6, 'rn_moy_min_max_classe', 'n'),
(65, 6, 'rn_retour_ligne', 'n'),
(66, 6, 'rn_rapport_standard_min_font', 'n'),
(67, 6, 'rn_adr_resp', 'n'),
(68, 6, 'rn_bloc_obs', 'n'),
(69, 6, 'rn_col_moy', 'n'),
(70, 6, 'rn_type_par_defaut', 'pdf'),
(71, 6, 'bull_prefixe_periode', ' '),
(72, 6, 'gepi_prof_suivi', 'professeur principal'),
(73, 7, 'rn_aff_classe_nom', '2'),
(74, 7, 'rn_app', 'n'),
(75, 7, 'rn_moy_classe', 'n'),
(76, 7, 'rn_moy_min_max_classe', 'n'),
(77, 7, 'rn_retour_ligne', 'n'),
(78, 7, 'rn_rapport_standard_min_font', 'n'),
(79, 7, 'rn_adr_resp', 'n'),
(80, 7, 'rn_bloc_obs', 'n'),
(81, 7, 'rn_col_moy', 'n'),
(82, 7, 'rn_type_par_defaut', 'html'),
(83, 7, 'bull_prefixe_periode', ' '),
(84, 7, 'gepi_prof_suivi', 'professeur principal');

-- --------------------------------------------------------

--
-- Structure de la table `cn_cahier_notes`
--

DROP TABLE IF EXISTS `cn_cahier_notes`;
CREATE TABLE IF NOT EXISTS `cn_cahier_notes` (
  `id_cahier_notes` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `periode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cahier_notes`,`id_groupe`,`periode`),
  KEY `groupe_periode` (`id_groupe`,`periode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `cn_cahier_notes`
--

INSERT INTO `cn_cahier_notes` (`id_cahier_notes`, `id_groupe`, `periode`) VALUES
(1, 1, 1),
(2, 1, 7),
(3, 2, 7),
(4, 3, 1),
(5, 3, 2),
(6, 3, 7),
(7, 4, 1),
(8, 4, 3),
(9, 4, 2),
(10, 3, 3),
(11, 1, 2),
(12, 1, 3),
(13, 6, 1),
(14, 6, 2),
(15, 6, 3),
(16, 7, 1),
(17, 7, 3),
(18, 7, 2),
(19, 9, 1),
(20, 9, 2),
(21, 8, 1),
(22, 8, 2),
(23, 8, 3),
(24, 9, 3),
(25, 9, 4),
(26, 8, 4),
(27, 9, 5),
(28, 9, 6),
(29, 8, 6),
(30, 8, 5);

-- --------------------------------------------------------

--
-- Structure de la table `cn_conteneurs`
--

DROP TABLE IF EXISTS `cn_conteneurs`;
CREATE TABLE IF NOT EXISTS `cn_conteneurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_racine` int(11) NOT NULL DEFAULT '0',
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `nom_complet` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `mode` char(1) NOT NULL DEFAULT '2',
  `coef` decimal(3,1) NOT NULL DEFAULT '1.0',
  `arrondir` char(2) NOT NULL DEFAULT 's1',
  `ponderation` decimal(3,1) NOT NULL DEFAULT '0.0',
  `display_parents` char(1) NOT NULL DEFAULT '0',
  `display_bulletin` char(1) NOT NULL DEFAULT '1',
  `parent` int(11) NOT NULL DEFAULT '0',
  `modele_id_conteneur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_racine` (`parent`,`id_racine`),
  KEY `racine_bulletin` (`id_racine`,`display_bulletin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `cn_conteneurs`
--

INSERT INTO `cn_conteneurs` (`id`, `id_racine`, `nom_court`, `nom_complet`, `description`, `mode`, `coef`, `arrondir`, `ponderation`, `display_parents`, `display_bulletin`, `parent`, `modele_id_conteneur`) VALUES
(1, 1, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(2, 2, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(3, 3, 'Mathematique', 'Mathematique', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(4, 4, 'PHYSIQUE COMPLET', 'PHYSIQUE COMPLET', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(5, 5, 'PHYSIQUE COMPLET', 'PHYSIQUE COMPLET', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(6, 6, 'PHYSIQUE COMPLET', 'PHYSIQUE COMPLET', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(7, 7, 'INFORMATIQUE', 'INFORMATIQUE', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(8, 8, 'INFORMATIQUE', 'INFORMATIQUE', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(9, 9, 'INFORMATIQUE', 'INFORMATIQUE', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(10, 10, 'PHYSIQUE COMPLET', 'PHYSIQUE COMPLET', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(11, 11, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(12, 12, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(13, 13, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(14, 14, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(15, 15, 'Histoire', 'Histoire', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(16, 16, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(17, 17, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(18, 18, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(19, 19, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(20, 20, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(21, 21, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(22, 22, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(23, 23, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(24, 24, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(25, 25, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(26, 26, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(27, 27, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(28, 28, 'EPS', 'EPS', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(29, 29, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0),
(30, 30, 'allemand', 'allemand', '', '2', '1.0', 's1', '0.0', '0', '1', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `cn_conteneurs_modele`
--

DROP TABLE IF EXISTS `cn_conteneurs_modele`;
CREATE TABLE IF NOT EXISTS `cn_conteneurs_modele` (
  `id_modele` int(11) NOT NULL AUTO_INCREMENT,
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_modele`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cn_conteneurs_modele_conteneurs`
--

DROP TABLE IF EXISTS `cn_conteneurs_modele_conteneurs`;
CREATE TABLE IF NOT EXISTS `cn_conteneurs_modele_conteneurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modele` int(11) NOT NULL DEFAULT '0',
  `id_racine` int(11) NOT NULL DEFAULT '0',
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `nom_complet` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `mode` char(1) NOT NULL DEFAULT '2',
  `coef` decimal(3,1) NOT NULL DEFAULT '1.0',
  `arrondir` char(2) NOT NULL DEFAULT 's1',
  `ponderation` decimal(3,1) NOT NULL DEFAULT '0.0',
  `display_parents` char(1) NOT NULL DEFAULT '0',
  `display_bulletin` char(1) NOT NULL DEFAULT '1',
  `parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_racine` (`parent`,`id_racine`),
  KEY `racine_bulletin` (`id_racine`,`display_bulletin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cn_devoirs`
--

DROP TABLE IF EXISTS `cn_devoirs`;
CREATE TABLE IF NOT EXISTS `cn_devoirs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conteneur` int(11) NOT NULL DEFAULT '0',
  `id_racine` int(11) NOT NULL DEFAULT '0',
  `nom_court` varchar(32) NOT NULL DEFAULT '',
  `nom_complet` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `facultatif` char(1) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coef` decimal(3,1) NOT NULL DEFAULT '0.0',
  `note_sur` int(11) DEFAULT '20',
  `ramener_sur_referentiel` char(1) NOT NULL DEFAULT 'F',
  `display_parents` char(1) NOT NULL DEFAULT '',
  `display_parents_app` char(1) NOT NULL DEFAULT '0',
  `date_ele_resp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conteneur_date` (`id_conteneur`,`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Contenu de la table `cn_devoirs`
--

INSERT INTO `cn_devoirs` (`id`, `id_conteneur`, `id_racine`, `nom_court`, `nom_complet`, `description`, `facultatif`, `date`, `coef`, `note_sur`, `ramener_sur_referentiel`, `display_parents`, `display_parents_app`, `date_ele_resp`) VALUES
(1, 1, 1, 'DS3', 'Devoir surveillé n°3', 'Durée 1h', 'O', '2015-12-15 00:00:00', '2.0', 20, 'F', '1', '0', '2015-12-15 00:00:00'),
(2, 2, 2, 'Séquence 1', 'Séquence 1', 'Séquence 1', 'O', '2015-12-15 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-15 00:00:00'),
(3, 2, 2, 'Séquence 2', 'Séquence 2', 'Séquence 2', 'O', '2015-12-15 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-15 00:00:00'),
(4, 3, 3, 'Séquence 1', 'Séquence 1', 'Séquence 1', 'O', '2015-12-15 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-15 00:00:00'),
(5, 3, 3, 'Séquence 2', 'Séquence 2', 'Séquence 2', 'O', '2015-12-15 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-15 00:00:00'),
(6, 6, 6, 'SEQ1', 'SEQ1', 'SEQ1 desc', 'O', '2015-12-21 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-21 00:00:00'),
(7, 7, 7, 'seq 1', 'seq 1', 'seq 1', 'O', '2015-12-21 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-21 00:00:00'),
(8, 8, 8, 'seq 1', 'seq 1', 'seq 1', 'O', '2015-12-21 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-21 00:00:00'),
(9, 8, 8, 'seq 2', 'seq 2', 'seq 2', 'O', '2015-12-21 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-21 00:00:00'),
(15, 4, 4, 'SEQ1', 'SEQ1', 'SEQ1', 'O', '2015-12-23 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-23 00:00:00'),
(27, 12, 12, 'SEQ1', 'SEQ1', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(26, 15, 15, 'SEQ2', 'SEQ2', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(24, 13, 13, 'SEQ1', 'SEQ1', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(22, 11, 11, 'seq2', 'seq2', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(25, 14, 14, 'SEQ2', 'SEQ2', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(28, 15, 15, 'SEQ1', 'SEQ1', '', 'O', '2015-12-30 00:00:00', '1.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(29, 16, 16, 'SEQ1', 'SEQ1', '', 'O', '2015-12-30 00:00:00', '2.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(30, 17, 17, 'SEQ1', 'SEQ1', '', 'O', '2015-12-30 00:00:00', '2.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(31, 18, 18, 'SEQ2', 'SEQ2', '', 'O', '2015-12-30 00:00:00', '2.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(34, 19, 19, '1', '1', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(33, 17, 17, 'SEQ2', 'SEQ2', '', 'O', '2015-12-30 00:00:00', '2.0', 20, 'F', '1', '0', '2015-12-30 00:00:00'),
(35, 20, 20, '1', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(36, 21, 21, '1', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(37, 22, 22, '1', '1', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(38, 20, 20, '2', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(39, 22, 22, '2', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(48, 23, 23, '3', '', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(47, 24, 24, '3', '3', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(49, 25, 25, '3', '3', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(50, 26, 26, '3', '', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(51, 25, 25, '4', '', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(52, 26, 26, '4', 'Nouvelle évaluation', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(53, 27, 27, '5', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00'),
(54, 28, 28, '5', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00'),
(55, 28, 28, '6', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00'),
(56, 28, 28, '1', '1', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(57, 28, 28, '2', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(58, 28, 28, '3', '3', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(59, 28, 28, '4', '', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(60, 29, 29, '1', '1', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(61, 29, 29, '2', '2', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(62, 29, 29, '3', '', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(63, 29, 29, '4', 'Nouvelle évaluation', '', 'O', '2016-01-02 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-02 00:00:00'),
(64, 30, 30, '5', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00'),
(65, 29, 29, '5', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00'),
(66, 29, 29, '6', '', '', 'O', '2016-01-05 00:00:00', '1.0', 20, 'F', '1', '0', '2016-01-05 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `cn_notes_conteneurs`
--

DROP TABLE IF EXISTS `cn_notes_conteneurs`;
CREATE TABLE IF NOT EXISTS `cn_notes_conteneurs` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_conteneur` int(11) NOT NULL DEFAULT '0',
  `note` float(10,1) NOT NULL DEFAULT '0.0',
  `statut` char(1) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  PRIMARY KEY (`login`,`id_conteneur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cn_notes_conteneurs`
--

INSERT INTO `cn_notes_conteneurs` (`login`, `id_conteneur`, `note`, `statut`, `comment`) VALUES
('kelly', 1, 12.0, 'y', ''),
('alida', 1, 15.0, 'y', ''),
('kelly', 2, 15.0, 'y', ''),
('alida', 2, 14.5, 'y', ''),
('kelly', 3, 15.0, 'y', ''),
('alida', 3, 14.5, 'y', ''),
('kelly', 6, 0.0, '', ''),
('alida', 6, 0.0, '', ''),
('alexy', 7, 16.0, 'y', ''),
('alexy', 8, 18.5, 'y', ''),
('kelly', 4, 17.0, 'y', ''),
('alida', 4, 12.0, 'y', ''),
('kelly', 11, 12.0, 'y', ''),
('alida', 11, 8.0, 'y', ''),
('abena_41', 13, 10.0, 'y', ''),
('abena_41', 14, 12.0, 'y', ''),
('abena_41', 15, 11.0, 'y', ''),
('abena_62', 16, 13.0, 'y', ''),
('tete_62', 16, 16.0, 'y', ''),
('tete_62', 17, 13.0, 'y', ''),
('abena_62', 17, 14.0, 'y', ''),
('abena_62', 18, 15.0, 'y', ''),
('tete_62', 18, 10.0, 'y', ''),
('celestin', 19, 12.0, 'y', ''),
('celestin', 20, 11.0, 'y', ''),
('sc_5', 20, 16.0, 'y', ''),
('celestin', 21, 11.0, 'y', ''),
('celestin', 22, 13.0, 'y', ''),
('sc_5', 22, 9.0, 'y', ''),
('sc_5', 21, 8.0, 'y', ''),
('sc_5', 19, 20.0, 'y', ''),
('sc_5', 24, 20.0, 'y', ''),
('sc_5', 23, 16.0, 'y', ''),
('celestin', 24, 14.0, 'y', ''),
('celestin', 23, 2.0, 'y', ''),
('celestin', 25, 15.0, 'y', ''),
('sc_5', 25, 17.0, 'y', ''),
('celestin', 26, 3.5, 'y', ''),
('sc_5', 26, 13.0, 'y', ''),
('tata', 7, 0.0, '', ''),
('toto', 7, 0.0, '', ''),
('sc_5', 27, 15.0, 'y', ''),
('celestin', 27, 19.0, 'y', ''),
('celestin', 28, 15.0, 'y', ''),
('sc_5', 28, 16.5, 'y', ''),
('celestin', 29, 10.0, 'y', ''),
('sc_5', 29, 13.5, 'y', ''),
('sc_5', 30, 18.0, 'y', ''),
('celestin', 30, 12.0, 'y', '');

-- --------------------------------------------------------

--
-- Structure de la table `cn_notes_devoirs`
--

DROP TABLE IF EXISTS `cn_notes_devoirs`;
CREATE TABLE IF NOT EXISTS `cn_notes_devoirs` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_devoir` int(11) NOT NULL DEFAULT '0',
  `note` float(10,1) NOT NULL DEFAULT '0.0',
  `comment` text NOT NULL,
  `statut` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`login`,`id_devoir`),
  KEY `devoir_statut` (`id_devoir`,`statut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cn_notes_devoirs`
--

INSERT INTO `cn_notes_devoirs` (`login`, `id_devoir`, `note`, `comment`, `statut`) VALUES
('kelly', 1, 12.0, '', ''),
('alida', 1, 15.0, '', ''),
('kelly', 2, 12.0, '', ''),
('alida', 2, 15.0, '', ''),
('kelly', 3, 18.0, '', ''),
('alida', 3, 14.0, '', ''),
('kelly', 4, 12.0, '', ''),
('alida', 4, 15.0, '', ''),
('kelly', 5, 18.0, '', ''),
('alida', 5, 14.0, '', ''),
('alexy', 7, 16.0, '', ''),
('alexy', 9, 19.0, '', ''),
('alexy', 8, 18.0, '', ''),
('kelly', 15, 17.0, '', ''),
('alida', 15, 12.0, '', ''),
('kelly', 22, 12.0, '', ''),
('alida', 22, 8.0, '', ''),
('abena_41', 24, 10.0, '', ''),
('abena_41', 25, 12.0, '', ''),
('abena_41', 26, 12.0, '', ''),
('abena_41', 28, 10.0, '', ''),
('abena_62', 29, 13.0, '', ''),
('tete_62', 29, 16.0, '', ''),
('abena_62', 30, 13.0, '', ''),
('tete_62', 30, 16.0, '', ''),
('abena_62', 31, 15.0, '', ''),
('tete_62', 31, 10.0, '', ''),
('abena_62', 33, 15.0, '', ''),
('tete_62', 33, 10.0, '', ''),
('celestin', 34, 12.0, '', ''),
('sc_5', 34, 20.0, '', ''),
('celestin', 35, 12.0, '', ''),
('sc_5', 35, 20.0, '', ''),
('celestin', 36, 11.0, '', ''),
('sc_5', 36, 8.0, '', ''),
('celestin', 37, 11.0, '', ''),
('sc_5', 37, 8.0, '', ''),
('celestin', 38, 10.0, '', ''),
('sc_5', 38, 12.0, '', ''),
('celestin', 39, 15.0, '', ''),
('sc_5', 39, 10.0, '', ''),
('sc_5', 47, 20.0, '', ''),
('celestin', 47, 14.0, '', ''),
('celestin', 48, 2.0, '', ''),
('sc_5', 48, 16.0, '', ''),
('celestin', 49, 14.0, '', ''),
('sc_5', 49, 20.0, '', ''),
('celestin', 50, 2.0, '', ''),
('sc_5', 50, 16.0, '', ''),
('celestin', 51, 16.0, '', ''),
('sc_5', 51, 14.0, '', ''),
('celestin', 52, 5.0, '', ''),
('sc_5', 52, 10.0, '', ''),
('celestin', 53, 19.0, '', ''),
('sc_5', 53, 15.0, '', ''),
('celestin', 54, 19.0, '', ''),
('sc_5', 54, 15.0, '', ''),
('celestin', 55, 19.0, '', ''),
('sc_5', 55, 18.0, '', ''),
('celestin', 56, 12.0, '', ''),
('sc_5', 56, 20.0, '', ''),
('celestin', 57, 10.0, '', ''),
('sc_5', 57, 12.0, '', ''),
('celestin', 58, 14.0, '', ''),
('sc_5', 58, 20.0, '', ''),
('celestin', 59, 16.0, '', ''),
('sc_5', 59, 14.0, '', ''),
('celestin', 60, 11.0, '', ''),
('sc_5', 60, 8.0, '', ''),
('celestin', 61, 15.0, '', ''),
('sc_5', 61, 10.0, '', ''),
('celestin', 62, 2.0, '', ''),
('sc_5', 62, 16.0, '', ''),
('celestin', 63, 5.0, '', ''),
('sc_5', 63, 10.0, '', ''),
('celestin', 64, 12.0, '', ''),
('sc_5', 64, 18.0, '', ''),
('celestin', 65, 12.0, '', ''),
('sc_5', 65, 18.0, '', ''),
('celestin', 66, 15.0, '', ''),
('sc_5', 66, 19.0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_types`
--

DROP TABLE IF EXISTS `commentaires_types`;
CREATE TABLE IF NOT EXISTS `commentaires_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentaire` text NOT NULL,
  `num_periode` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires_types_profs`
--

DROP TABLE IF EXISTS `commentaires_types_profs`;
CREATE TABLE IF NOT EXISTS `commentaires_types_profs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `app` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `communes`
--

DROP TABLE IF EXISTS `communes`;
CREATE TABLE IF NOT EXISTS `communes` (
  `code_commune_insee` varchar(50) NOT NULL,
  `departement` varchar(50) NOT NULL,
  `commune` varchar(255) NOT NULL,
  PRIMARY KEY (`code_commune_insee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ct_devoirs_documents`
--

DROP TABLE IF EXISTS `ct_devoirs_documents`;
CREATE TABLE IF NOT EXISTS `ct_devoirs_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ct_devoir` int(11) NOT NULL DEFAULT '0',
  `titre` varchar(255) NOT NULL DEFAULT '',
  `taille` int(11) NOT NULL DEFAULT '0',
  `emplacement` varchar(255) NOT NULL DEFAULT '',
  `visible_eleve_parent` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_devoirs_entry`
--

DROP TABLE IF EXISTS `ct_devoirs_entry`;
CREATE TABLE IF NOT EXISTS `ct_devoirs_entry` (
  `id_ct` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `date_ct` int(11) NOT NULL DEFAULT '0',
  `id_login` varchar(32) DEFAULT NULL,
  `id_sequence` int(11) NOT NULL DEFAULT '0',
  `contenu` text NOT NULL,
  `vise` char(1) NOT NULL DEFAULT 'n',
  `date_visibilite_eleve` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp précisant quand les devoirs sont portés à la connaissance des élèves',
  PRIMARY KEY (`id_ct`),
  KEY `id_groupe` (`id_groupe`),
  KEY `groupe_date` (`id_groupe`,`date_ct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_devoirs_faits`
--

DROP TABLE IF EXISTS `ct_devoirs_faits`;
CREATE TABLE IF NOT EXISTS `ct_devoirs_faits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ct` int(11) unsigned NOT NULL,
  `login` varchar(255) NOT NULL,
  `etat` varchar(50) NOT NULL,
  `date_initiale` datetime DEFAULT NULL,
  `date_modif` datetime DEFAULT NULL,
  `commentaire` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_documents`
--

DROP TABLE IF EXISTS `ct_documents`;
CREATE TABLE IF NOT EXISTS `ct_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ct` int(11) NOT NULL DEFAULT '0',
  `titre` varchar(255) NOT NULL DEFAULT '',
  `taille` int(11) NOT NULL DEFAULT '0',
  `emplacement` varchar(255) NOT NULL DEFAULT '',
  `visible_eleve_parent` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_entry`
--

DROP TABLE IF EXISTS `ct_entry`;
CREATE TABLE IF NOT EXISTS `ct_entry` (
  `id_ct` int(11) NOT NULL AUTO_INCREMENT,
  `heure_entry` time NOT NULL DEFAULT '00:00:00',
  `id_groupe` int(11) NOT NULL,
  `date_ct` int(11) NOT NULL DEFAULT '0',
  `id_login` varchar(32) DEFAULT NULL,
  `id_sequence` int(11) NOT NULL DEFAULT '0',
  `contenu` text NOT NULL,
  `vise` char(1) NOT NULL DEFAULT 'n',
  `visa` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_ct`),
  KEY `id_groupe` (`id_groupe`),
  KEY `id_date_heure` (`id_groupe`,`date_ct`,`heure_entry`),
  KEY `date_ct` (`date_ct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_private_entry`
--

DROP TABLE IF EXISTS `ct_private_entry`;
CREATE TABLE IF NOT EXISTS `ct_private_entry` (
  `id_ct` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cle primaire de la cotice privee',
  `heure_entry` time NOT NULL DEFAULT '00:00:00' COMMENT 'heure de l''entree',
  `date_ct` int(11) NOT NULL DEFAULT '0' COMMENT 'date du compte rendu',
  `contenu` text NOT NULL COMMENT 'contenu redactionnel du compte rendu',
  `id_groupe` int(11) NOT NULL COMMENT 'Cle etrangere du groupe auquel appartient le compte rendu',
  `id_login` varchar(32) DEFAULT NULL COMMENT 'Cle etrangere de l''utilisateur auquel appartient le compte rendu',
  `id_sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ct`),
  KEY `ct_private_entry_FI_1` (`id_groupe`),
  KEY `ct_private_entry_FI_2` (`id_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Notice privee du cahier de texte' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_sequences`
--

DROP TABLE IF EXISTS `ct_sequences`;
CREATE TABLE IF NOT EXISTS `ct_sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ct_types_documents`
--

DROP TABLE IF EXISTS `ct_types_documents`;
CREATE TABLE IF NOT EXISTS `ct_types_documents` (
  `id_type` bigint(21) NOT NULL AUTO_INCREMENT,
  `titre` text NOT NULL,
  `extension` varchar(10) NOT NULL DEFAULT '',
  `upload` enum('oui','non') NOT NULL DEFAULT 'oui',
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `extension` (`extension`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Contenu de la table `ct_types_documents`
--

INSERT INTO `ct_types_documents` (`id_type`, `titre`, `extension`, `upload`) VALUES
(1, 'JPEG', 'jpg', 'oui'),
(2, 'PNG', 'png', 'oui'),
(3, 'GIF', 'gif', 'oui'),
(4, 'BMP', 'bmp', 'oui'),
(5, 'Photoshop', 'psd', 'oui'),
(6, 'TIFF', 'tif', 'oui'),
(7, 'AIFF', 'aiff', 'oui'),
(8, 'Windows Media', 'asf', 'oui'),
(9, 'Windows Media', 'avi', 'oui'),
(10, 'Midi', 'mid', 'oui'),
(12, 'QuickTime', 'mov', 'oui'),
(13, 'MP3', 'mp3', 'oui'),
(14, 'MPEG', 'mpg', 'oui'),
(15, 'Ogg', 'ogg', 'oui'),
(16, 'QuickTime', 'qt', 'oui'),
(17, 'RealAudio', 'ra', 'oui'),
(18, 'RealAudio', 'ram', 'oui'),
(19, 'RealAudio', 'rm', 'oui'),
(20, 'Flash', 'swf', 'oui'),
(21, 'WAV', 'wav', 'oui'),
(22, 'Windows Media', 'wmv', 'oui'),
(23, 'Adobe Illustrator', 'ai', 'oui'),
(24, 'BZip', 'bz2', 'oui'),
(25, 'C source', 'c', 'oui'),
(26, 'Debian', 'deb', 'oui'),
(27, 'Word', 'doc', 'oui'),
(29, 'LaTeX DVI', 'dvi', 'oui'),
(30, 'PostScript', 'eps', 'oui'),
(31, 'GZ', 'gz', 'oui'),
(32, 'C header', 'h', 'oui'),
(33, 'HTML', 'html', 'oui'),
(34, 'Pascal', 'pas', 'oui'),
(35, 'PDF', 'pdf', 'oui'),
(36, 'PowerPoint', 'ppt', 'oui'),
(37, 'PostScript', 'ps', 'oui'),
(38, 'gr', 'gr', 'oui'),
(39, 'RTF', 'rtf', 'oui'),
(40, 'StarOffice', 'sdd', 'oui'),
(41, 'StarOffice', 'sdw', 'oui'),
(42, 'Stuffit', 'sit', 'oui'),
(43, 'OpenOffice Calc', 'sxc', 'oui'),
(44, 'OpenOffice Impress', 'sxi', 'oui'),
(45, 'OpenOffice', 'sxw', 'oui'),
(46, 'LaTeX', 'tex', 'oui'),
(47, 'TGZ', 'tgz', 'oui'),
(48, 'texte', 'txt', 'oui'),
(49, 'GIMP multi-layer', 'xcf', 'oui'),
(50, 'Excel', 'xls', 'oui'),
(51, 'XML', 'xml', 'oui'),
(52, 'Zip', 'zip', 'oui'),
(53, 'Texte OpenDocument', 'odt', 'oui'),
(54, 'Classeur OpenDocument', 'ods', 'oui'),
(55, 'Présentation OpenDocument', 'odp', 'oui'),
(56, 'Dessin OpenDocument', 'odg', 'oui'),
(57, 'Base de données OpenDocument', 'odb', 'oui'),
(58, 'GeoGebra', 'ggb', 'oui'),
(59, 'Word', 'docx', 'oui'),
(60, 'PowerPoint', 'pptx', 'oui'),
(61, 'Excel', 'xlsx', 'oui');

-- --------------------------------------------------------

--
-- Structure de la table `droits`
--

DROP TABLE IF EXISTS `droits`;
CREATE TABLE IF NOT EXISTS `droits` (
  `id` varchar(200) NOT NULL DEFAULT '',
  `administrateur` char(1) NOT NULL DEFAULT '',
  `professeur` char(1) NOT NULL DEFAULT '',
  `cpe` char(1) NOT NULL DEFAULT '',
  `scolarite` char(1) NOT NULL DEFAULT '',
  `eleve` char(1) NOT NULL DEFAULT '',
  `responsable` char(1) NOT NULL DEFAULT '',
  `secours` char(1) NOT NULL DEFAULT '',
  `autre` char(1) NOT NULL DEFAULT 'F',
  `description` varchar(255) NOT NULL DEFAULT '',
  `statut` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droits`
--

INSERT INTO `droits` (`id`, `administrateur`, `professeur`, `cpe`, `scolarite`, `eleve`, `responsable`, `secours`, `autre`, `description`, `statut`) VALUES
('/mod_ooo/rapport_incident.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Modèle Ooo : Rapport Incident', ''),
('/mod_ooo/gerer_modeles_ooo.php', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'F', 'Modèle Ooo : Gérer et utiliser les modèles', ''),
('/mod_ooo/ooo_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Modèle Ooo : Admin', ''),
('/mod_ooo/retenue.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Modèle Ooo : Retenue', ''),
('/mod_ooo/formulaire_retenue.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Modèle Ooo : formulaire retenue', ''),
('/mod_ooo/index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Modèle Ooo: Index : Index', ''),
('/mod_discipline/update_colonne_retenue.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Affichage d une imprimante pour le responsable d un incident', ''),
('/absences/index.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/absences/saisie_absences.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/accueil_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', ' ', ''),
('/accueil_modules.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '', ''),
('/accueil.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', ' ', ''),
('/accueil_professeur.php', 'V', 'V', 'F', 'F', 'F', 'F', 'V', 'F', ' ', ''),
('/aid/add_aid.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Configuration des AID', ''),
('/aid/config_aid.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des AID', ''),
('/aid/export_csv_aid.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des AID', ''),
('/aid/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des AID', ''),
('/aid/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des AID', ''),
('/aid/index2.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des AID (profs, élèves)', ''),
('/aid/modify_aid.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des AID (profs, élèves)', ''),
('/aid/modify_aid_new.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des AID (profs, élèves)', ''),
('/lib/confirm_query.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', '', ''),
('/bulletin/edit.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Edition des bulletins', '1'),
('/bulletin/param_bull.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Edition des bulletins', '1'),
('/bulletin/verif_bulletins.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Vérification du remplissage des bulletins', ''),
('/bulletin/verrouillage.php', 'F', 'F', 'F', 'V', 'F', 'F', 'F', 'F', '(de)Verrouillage des périodes', ''),
('/cahier_notes_admin/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des carnets de notes', ''),
('/cahier_notes/add_modif_conteneur.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/add_modif_dev.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/index.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/saisie_notes.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/toutes_notes.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/visu_releve_notes.php', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Visualisation et impression des relevés de notes', ''),
('/cahier_texte_admin/admin_ct.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des cahier de textes', ''),
('/cahier_texte_admin/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des cahier de textes', ''),
('/cahier_texte_admin/modify_limites.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des cahier de textes', ''),
('/cahier_texte_admin/modify_type_doc.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des cahier de textes', ''),
('/cahier_texte/index.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte/traite_doc.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/index.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_edition_compte_rendu.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_edition_notice_privee.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_duplication_notice.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_affichage_duplication_notice.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_deplacement_notice.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_affichage_deplacement_notice.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_suppression_notice.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_enregistrement_compte_rendu.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_enregistrement_notice_privee.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_edition_devoir.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_enregistrement_devoir.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_affichages_liste_notices.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/ajax_affichage_dernieres_notices.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/traite_doc.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/exportcsv.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de textes', '1'),
('/cahier_texte_2/consultation.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Consultation des cahiers de textes', ''),
('/cahier_texte_2/see_all.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Consultation des cahiers de texte', ''),
('/cahier_texte_2/creer_sequence.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de texte - s&eacute;quences', '1'),
('/cahier_texte_2/creer_seq_ajax_step1.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahier de texte - s&eacute;quences', '1'),
('/classes/classes_ajout.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/classes_const.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/cpe_resp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Affectation des CPE aux classes', ''),
('/classes/duplicate_class.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/eleve_options.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/modify_nom_class.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/periodes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/classes/prof_suivi.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/eleves/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des élèves', ''),
('/eleves/import_eleves_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des élèves', ''),
('/eleves/index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des élèves', ''),
('/eleves/modify_eleve.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des élèves', ''),
('/etablissements/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des établissements', ''),
('/etablissements/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des établissements', ''),
('/etablissements/modify_etab.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des établissements', ''),
('/gestion/accueil_sauve.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Restauration, suppression et sauvegarde de la base', ''),
('/gestion/gestion_base_test.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'gestion données de test', ''),
('/gestion/savebackup.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Téléchargement de sauvegardes la base', ''),
('/gestion/efface_base.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Restauration, suppression et sauvegarde de la base', ''),
('/gestion/gestion_connect.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des connexions', ''),
('/gestion/help_import.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation de l''année scolaire', ''),
('/gestion/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '', ''),
('/gestion/import_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation de l''année scolaire', ''),
('/gestion/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '', ''),
('/gestion/modify_impression.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des paramètres de la feuille de bienvenue', ''),
('/gestion/param_gen.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration générale', ''),
('/gestion/traitement_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation de l''année scolaire', ''),
('/groupes/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition des groupes', ''),
('/groupes/add_group.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Ajout de groupes', ''),
('/groupes/edit_group.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition de groupes', ''),
('/groupes/edit_eleves.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Edition des élèves des groupes', ''),
('/groupes/edit_class.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition des groupes de la classe', ''),
('/groupes/edit_class_grp_lot.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Affectation des matières aux professeurs', ''),
('/init_csv/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/responsables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/disciplines.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/professeurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/eleves_classes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/prof_disc_classes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_csv/eleves_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV de l''année scolaire', ''),
('/init_scribe/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_scribe/professeurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_scribe/eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_scribe/eleves_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_scribe/prof_disc_classes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_scribe/disciplines.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation scribe de l''ann?e scolaire', ''),
('/init_lcs/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation LCS de l''ann?e scolaire', ''),
('/init_lcs/eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation LCS de l''ann?e scolaire', ''),
('/init_lcs/professeurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation LCS de l''ann?e scolaire', ''),
('/init_lcs/disciplines.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation LCS de l''ann?e scolaire', ''),
('/init_lcs/affectations.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation LCS de l''ann?e scolaire', ''),
('/matieres/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des matières', ''),
('/matieres/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des matières', ''),
('/matieres/matieres_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Importation des matières en CSV', ''),
('/matieres/matieres_categories.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition des catégories de matière', ''),
('/matieres/modify_matiere.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des matières', ''),
('/matieres/matieres_param.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/prepa_conseil/edit_limite.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Edition des bulletins simplifiés (documents de travail)', ''),
('/prepa_conseil/help.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', '', ''),
('/prepa_conseil/index1.php', 'F', 'V', 'F', 'V', 'F', 'F', 'V', 'F', 'Visualisation des notes et appréciations', '1'),
('/prepa_conseil/index2.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des notes par classes', ''),
('/prepa_conseil/index3.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Edition des bulletins simplifiés (documents de travail)', ''),
('/prepa_conseil/visu_aid.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Visualisation des notes et appréciations AID', ''),
('/prepa_conseil/visu_toutes_notes.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des notes par classes', ''),
('/responsables/index.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration et gestion des responsables élèves', ''),
('/responsables/modify_resp.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration et gestion des responsables élèves', ''),
('/saisie/help.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', '', ''),
('/saisie/import_class_csv.php', 'F', 'V', 'F', 'V', 'F', 'F', 'V', 'F', '', ''),
('/saisie/import_note_app.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', '', ''),
('/saisie/index.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', '', ''),
('/saisie/saisie_aid.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Saisie des notes et appréciations AID', ''),
('/saisie/saisie_appreciations.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Saisie des appréciations du bulletins', ''),
('/saisie/saisie_avis.php', 'F', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Saisie des avis du conseil de classe', ''),
('/saisie/saisie_avis1.php', 'F', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Saisie des avis du conseil de classe', ''),
('/saisie/saisie_avis2.php', 'F', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Saisie des avis du conseil de classe', ''),
('/saisie/saisie_notes.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Saisie des notes du bulletins', ''),
('/saisie/traitement_csv.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Saisie des notes du bulletins', ''),
('/utilisateurs/change_pwd.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/help.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/import_prof_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/impression_bienvenue.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/reset_passwords.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Réinitialisation des mots de passe', ''),
('/utilisateurs/modify_user.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des utilisateurs', ''),
('/utilisateurs/mon_compte.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'Gestion du compte (informations personnelles, mot de passe, ...)', ''),
('/utilisateurs/tab_profs_matieres.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Affectation des matieres aux professeurs', ''),
('/visualisation/classe_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/eleve_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/eleve_eleve.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/evol_eleve_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/evol_eleve.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/index.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/stats_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/classes/classes_param.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des classes', ''),
('/fpdf/imprime_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', '', ''),
('/etablissements/import_etab_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration et gestion des établissements', ''),
('/saisie/import_app_cons.php', 'F', 'V', 'F', 'V', 'F', 'F', 'V', 'F', 'Importation csv des avis du conseil de classe', ''),
('/messagerie/index.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion de la messagerie', ''),
('/absences/import_absences_gep.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/absences/seq_gep_absences.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/utilitaires/clean_tables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Maintenance', ''),
('/gestion/contacter_admin.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', '', ''),
('/mod_absences/gestion/gestion_absences.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/gestion_absences_liste.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/impression_absences.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/select.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/ajout_ret.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/ajout_dip.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/ajout_inf.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/ajout_abs.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/bilan_absence.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/bilan.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/gestion/lettre_aux_parents.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Gestion des absences', ''),
('/mod_absences/lib/tableau.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', '', ''),
('/mod_absences/lib/tableau_pdf.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', '', ''),
('/mod_absences/admin/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_absences/admin/admin_motifs_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/edt_organisation/admin_periodes_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_absences/lib/liste_absences.php', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'F', '', ''),
('/mod_absences/lib/graphiques.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', '', ''),
('/mod_absences/professeurs/prof_ajout_abs.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Ajout des absences en classe', ''),
('/mod_trombinoscopes/trombinoscopes.php', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'Visualiser le trombinoscope', ''),
('/mod_trombinoscopes/trombi_impr.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualiser le trombinoscope', ''),
('/mod_trombinoscopes/trombinoscopes_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '(des)activation du module trombinoscope', ''),
('/groupes/visu_profs_class.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des équipes pédagogiques', ''),
('/groupes/popup.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des équipes pédagogiques', ''),
('/cahier_notes/index2.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des moyennes des carnets de notes', ''),
('/cahier_notes/visu_toutes_notes2.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des moyennes des carnets de notes', ''),
('/utilitaires/verif_groupes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Vérification des incohérences d appartenances à des groupes', ''),
('/visualisation/affiche_eleve.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/draw_graphe.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/draw_graphe_star.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/visualisation/draw_graphe_svg.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Visualisation graphique des résultats scolaires', ''),
('/groupes/mes_listes.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Accès aux CSV des listes d élèves', ''),
('/groupes/get_csv.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Génération de CSV élèves', ''),
('/visualisation/choix_couleurs.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Choix des couleurs des graphiques des résultats scolaires', ''),
('/visualisation/couleur.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Choix d une couleur pour le graphique des résultats scolaires', ''),
('/gestion/config_prefs.php', 'V', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Définition des préférences d utilisateurs', ''),
('/utilitaires/recalcul_moy_conteneurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Recalcul des moyennes des conteneurs', ''),
('/classes/scol_resp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Affectation des comptes scolarité aux classes', ''),
('/mod_absences/lib/fiche_eleve.php', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'F', 'Fiche du suivie de l''élève', ''),
('/referencement.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Référencement de Gepi sur la base centralisée des utilisateurs de Gepi', ''),
('/mod_absences/admin/admin_actions_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des actions absences', ''),
('/saisie/commentaires_types.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Saisie de commentaires-types', ''),
('/cahier_notes/releve_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Relevé de note au format PDF', ''),
('/impression/parametres_impression_pdf.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des listes PDF; réglage des paramètres', ''),
('/impression/impression_serie.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des listes (PDF) en série', ''),
('/impression/impression.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression rapide d une listes (PDF) ', ''),
('/impression/liste_pdf.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des listes (PDF)', ''),
('/init_xml/lecture_xml_sconet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/init_pp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/clean_tables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/step2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/step1.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/disciplines_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/prof_disc_classe_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/lecture_xml_sts_emp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/prof_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/init_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/save_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/responsables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml/step3.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/responsables/maj_import.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Mise à jour depuis Sconet', ''),
('/responsables/conversion.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Conversion des données responsables', ''),
('/utilisateurs/create_responsable.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Création des utilisateurs au statut responsable', ''),
('/utilisateurs/create_eleve.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Création des utilisateurs au statut élève', ''),
('/utilisateurs/edit_responsable.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition des utilisateurs au statut responsable', ''),
('/utilisateurs/edit_eleve.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Edition des utilisateurs au statut élève', ''),
('/cahier_texte/consultation.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Consultation des cahiers de texte', ''),
('/cahier_texte/see_all.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Consultation des cahiers de texte', ''),
('/cahier_texte/visu_prof_jour.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Acces_a_son_cahier_de_textes_personnel', ''),
('/gestion/droits_acces.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Paramétrage des droits d accès', ''),
('/groupes/visu_profs_eleve.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Consultation équipe pédagogique', ''),
('/saisie/impression_avis.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des avis trimestrielles des conseils de classe.', ''),
('/impression/avis_pdf.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des avis trimestrielles des conseils de classe. Module PDF', ''),
('/impression/parametres_impression_pdf_avis.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Impression des avis conseil classe PDF; reglage des parametres', ''),
('/utilisateurs/password_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Export des identifiants et mots de passe en csv', ''),
('/impression/password_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Impression des identifiants et des mots de passe en PDF', ''),
('/bulletin/buletin_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Bulletin scolaire au format PDF', ''),
('/mod_absences/gestion/etiquette_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Etiquette au format PDF', ''),
('/mod_absences/lib/export_csv.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Fichier d''exportation en csv des absences', ''),
('/mod_absences/gestion/statistiques.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistique du module vie scolaire', '1'),
('/mod_absences/lib/graph_camembert.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'graphique camembert', ''),
('/mod_absences/lib/graph_ligne.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'graphique camembert', ''),
('/edt_organisation/admin_horaire_ouverture.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Définition des horaires d''ouverture de l''établissement', ''),
('/edt_organisation/admin_config_semaines.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des types de semaines', ''),
('/mod_absences/gestion/fiche_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Fiche récapitulatif des absences', ''),
('/mod_absences/lib/graph_double_ligne.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'graphique absence et retard sur le même graphique', ''),
('/bulletin/param_bull_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'page de gestion des parametres du bulletin pdf', ''),
('/bulletin/bulletin_pdf_avec_modele_classe.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'page generant le bulletin pdf en fonction du modele affecte a la classe ', ''),
('/gestion/security_panel.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'panneau de controle des atteintes a la securite', ''),
('/gestion/security_policy.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'definition des politiques de securite', ''),
('/gestion/options_connect.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Options de connexions', ''),
('/mod_absences/gestion/alert_suivi.php', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'système d''alerte de suivi d''élève', ''),
('/gestion/efface_photos.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Suppression des photos non associées à des élèves', ''),
('/responsables/gerer_adr.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des adresses de responsables', ''),
('/responsables/choix_adr_existante.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Choix adresse de responsable existante', ''),
('/cahier_notes/export_cahier_notes.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Export CSV/ODS du cahier de notes', ''),
('/cahier_notes/import_cahier_notes.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Import CSV du cahier de notes', ''),
('/eleves/add_eleve.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Gestion des élèves', ''),
('/saisie/export_class_ods.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Export ODS des notes/appréciations', ''),
('/gestion/gestion_temp_dir.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des dossiers temporaires d utilisateurs', ''),
('/gestion/param_couleurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Définition des couleurs pour Gepi', ''),
('/utilisateurs/creer_remplacant.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'script de création d un remplaçant', ''),
('/mod_absences/gestion/lettre_pdf.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Publipostage des lettres d absences PDF', '1'),
('/accueil_simpl_prof.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Page d accueil simplifiée pour les profs', ''),
('/init_xml2/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/step1.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/step2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/step3.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/responsables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/matieres.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/professeurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/prof_disc_classe_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/init_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/init_pp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/clean_tables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/init_xml2/clean_temp.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/mod_annees_anterieures/conservation_annee_anterieure.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Conservation des données antérieures', ''),
('/mod_annees_anterieures/consultation_annee_anterieure.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Consultation des données d années antérieures', ''),
('/mod_annees_anterieures/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Index données antérieures', ''),
('/mod_annees_anterieures/popup_annee_anterieure.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Consultation des données antérieures', ''),
('/mod_annees_anterieures/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Activation/désactivation du module données antérieures', ''),
('/mod_annees_anterieures/nettoyer_annee_anterieure.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Suppression de données antérieures', ''),
('/mod_annees_anterieures/archivage_aid.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fiches projets', '1'),
('/responsables/maj_import1.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Mise à jour depuis Sconet', ''),
('/responsables/maj_import2.php', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Mise à jour depuis Sconet', ''),
('/mod_annees_anterieures/corriger_ine.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Correction d INE dans la table annees_anterieures', ''),
('/mod_annees_anterieures/liste_eleves_ajax.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Recherche d élèves', ''),
('/mod_annees_anterieures/gerer_annees_anterieures.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les années antérieures', ''),
('/mod_absences/lib/graph_double_ligne_fiche.php', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'F', 'Graphique de la fiche élève', '1'),
('/mod_absences/admin/admin_config_calendrier.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Définir les différentes périodes', ''),
('/edt_organisation/index_edt.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des emplois du temps', ''),
('/edt_organisation/edt_initialiser.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation des emplois du temps', ''),
('/edt_organisation/effacer_cours.php', 'V', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Effacer un cours des emplois du temps', ''),
('/edt_organisation/edt_calendrier.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation du calendrier', ''),
('/edt_organisation/ajouter_salle.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des salles', ''),
('/edt_organisation/edt_parametrer.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les paramètres EdT', ''),
('/edt_organisation/voir_groupe.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Voir les groupes de Gepi', ''),
('/edt_organisation/modif_edt_tempo.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Modification temporaire des EdT', ''),
('/edt_organisation/edt_init_xml.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation EdT par xml', ''),
('/edt_organisation/edt_init_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'initialisation EdT par csv', ''),
('/edt_organisation/edt_init_csv2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'initialisation EdT par un autre csv', ''),
('/edt_organisation/edt_init_texte.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'initialisation EdT par un fichier texte', ''),
('/edt_organisation/edt_init_concordance.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'initialisation EdT par un fichier texte', ''),
('/edt_organisation/edt_init_concordance2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'initialisation EdT par un autre fichier csv', ''),
('/edt_organisation/modifier_cours.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Modifier un cours', ''),
('/edt_organisation/modifier_cours_popup.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Modifier un cours', ''),
('/edt_organisation/edt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Régler le module emploi du temps', ''),
('/edt_organisation/edt_eleve.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Régler le module emploi du temps', ''),
('/edt_organisation/edt_param_couleurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Régler les couleurs des matières (EdT)', ''),
('/edt_organisation/ajax_edtcouleurs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Modifier les couleurs des affichages des emplois du temps.', ''),
('/utilisateurs/creer_statut.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Ajouter et gérer des statuts personnalisés', ''),
('/utilisateurs/creer_statut_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Autoriser la création des statuts personnalisés', ''),
('/edt_gestion_gr/edt_aff_gr.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les groupes du module EdT', ''),
('/edt_gestion_gr/edt_ajax_win.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les groupes du module EdT', ''),
('/edt_gestion_gr/edt_liste_eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les groupes du module EdT', ''),
('/edt_gestion_gr/edt_liste_profs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les groupes du module EdT', ''),
('/edt_gestion_gr/edt_win.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les groupes du module EdT', ''),
('/absences/import_absences_sconet.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/bulletin/export_modele_pdf.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'exportation en csv des modeles de bulletin pdf', ''),
('/absences/consulter_absences.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Consulter les absences', ''),
('/mod_absences/professeurs/bilan_absences_professeur.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Bilan des absences pour chaque professeur', ''),
('/mod_absences/professeurs/bilan_absences_classe.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Bilan des absences pour chaque professeur', ''),
('/mod_absences/gestion/voir_absences_viescolaire.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter les absences du jour', ''),
('/mod_absences/gestion/bilan_absences_quotidien.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter les absences par créneau', ''),
('/mod_absences/gestion/bilan_absences_quotidien_pdf.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter les absences par créneau en pdf', ''),
('/mod_absences/gestion/bilan_absences_classe.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter les absences par classe', ''),
('/mod_absences/gestion/bilan_repas_quotidien.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter l inscription aux repas', ''),
('/mod_absences/absences.php', 'F', 'F', 'F', 'F', 'F', 'V', 'F', 'F', 'Consulter les absences de son enfant', ''),
('/mod_absences/admin/interface_abs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Paramétrer les interfaces des professeurs', ''),
('/absences/import_absences_gepi.php', 'F', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Page d''importation des absences de gepi mod_absences', '1'),
('/saisie/ajax_appreciations.php', 'F', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Sauvegarde des appréciations du bulletins', ''),
('/lib/change_mode_header.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'Page AJAX pour changer la variable cacher_header', '1'),
('/saisie/recopie_moyennes.php', 'F', 'F', 'F', 'F', 'F', 'F', 'V', 'F', 'Recopie des moyennes', ''),
('/groupes/fusion_group.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fusionner des groupes', ''),
('/gestion/security_panel_archives.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'page archive du panneau de sécurité', ''),
('/responsables/corrige_ele_id.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Correction des ELE_ID d apres Sconet', ''),
('/mod_inscription/inscription_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '(De)activation du module inscription', ''),
('/mod_inscription/inscription_index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'accès au module configuration', ''),
('/mod_inscription/inscription_config.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration du module inscription', ''),
('/mod_inscription/help.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration du module inscription', ''),
('/aid/index_fiches.php', 'V', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'Outils complémentaires de gestion des AIDs', ''),
('/aid/visu_fiches.php', 'V', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'Outils complémentaires de gestion des AIDs', ''),
('/aid/modif_fiches.php', 'V', 'V', 'V', 'F', 'V', 'V', 'F', 'F', 'Outils complémentaires de gestion des AIDs', ''),
('/aid/config_aid_fiches_projet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des outils complémentaires de gestion des AIDs', ''),
('/aid/config_aid_matieres.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des outils complémentaires de gestion des AIDs', ''),
('/aid/config_aid_productions.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Configuration des outils complémentaires de gestion des AIDs', ''),
('/classes/acces_appreciations.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Configuration de la restriction d accès aux appréciations pour les élèves et responsables', ''),
('/mod_notanet/rouen/fiches_brevet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Accès aux fiches brevet', ''),
('/mod_notanet/poitiers/fiches_brevet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Accès aux fiches brevet', ''),
('/mod_notanet/notanet_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion du module NOTANET', ''),
('/mod_notanet/index.php', 'V', 'V', 'F', 'V', 'F', 'F', 'V', 'F', 'Notanet: Accueil', ''),
('/mod_notanet/extract_moy.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Extraction des moyennes', ''),
('/mod_notanet/corrige_extract_moy.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Extraction des moyennes', ''),
('/mod_notanet/select_eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Associations élèves/type de brevet', ''),
('/mod_notanet/select_matieres.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Associations matières/type de brevet', ''),
('/mod_notanet/saisie_app.php', 'F', 'V', 'F', 'F', 'F', 'F', 'V', 'F', 'Notanet: Saisie des appréciations', ''),
('/mod_notanet/generer_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Génération de CSV', ''),
('/mod_notanet/choix_generation_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Génération de CSV', ''),
('/mod_notanet/verrouillage_saisie_app.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: (Dé)Verrouillage des saisies', ''),
('/mod_notanet/verif_saisies.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Notanet: Verification avant impression des fiches brevet', ''),
('/bulletin/bull_index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Edition des bulletins', '1'),
('/cahier_notes/visu_releve_notes_bis.php', 'F', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'Relevé de notes', '1'),
('/cahier_notes/param_releve_html.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Paramètres du relevé de notes', '1'),
('/classes/changement_eleve_classe.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Changement de classe pour un élève', '1'),
('/mod_notanet/saisie_avis.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Notanet: Saisie avis chef etablissement', ''),
('/mod_notanet/poitiers/param_fiche_brevet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet: Paramètres d impression', ''),
('/mod_notanet/saisie_b2i_a2.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Notanet: Saisie socles B2i et A2', ''),
('/eleves/liste_eleves.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Lister des élèves', ''),
('/eleves/visu_eleve.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Consultation_d_un_eleve', ''),
('/cahier_texte_admin/rss_cdt_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gérer les flux rss du cdt', ''),
('/matieres/suppr_matiere.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Suppression d une matiere', ''),
('/eleves/import_bull_eleve.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Importation bulletin élève', ''),
('/eleves/export_bull_eleve.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Exportation bulletin élève', ''),
('/cahier_texte_admin/visa_ct.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Page de signature des cahiers de texte', ''),
('/saisie/saisie_cmnt_type_prof.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Saisie appréciations-types pour les profs', ''),
('/saisie/export_cmnt_type_prof.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Export des appréciations-types pour les profs', ''),
('/mod_ent/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion de l intégration de GEPI dans un ENT', ''),
('/mod_ent/gestion_ent_eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion de l intégration de GEPI dans un ENT', ''),
('/mod_ent/gestion_ent_profs.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion de l intégration de GEPI dans un ENT', ''),
('/mod_ent/miseajour_ent_eleves.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion de l intégration de GEPI dans un ENT', ''),
('/mod_discipline/traiter_incident.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Traitement', ''),
('/mod_discipline/saisie_incident.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Saisie incident', ''),
('/mod_discipline/occupation_lieu_heure.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Occupation lieu', ''),
('/mod_discipline/liste_sanctions_jour.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Liste', ''),
('/mod_discipline/index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Index', ''),
('/mod_discipline/incidents_sans_protagonistes.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Incidents sans protagonistes', ''),
('/mod_discipline/edt_eleve.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: EDT élève', ''),
('/mod_discipline/ajout_sanction.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Ajout sanction', ''),
('/mod_discipline/saisie_sanction.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Saisie sanction', ''),
('/mod_discipline/definir_roles.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définition des rôles', ''),
('/mod_discipline/definir_lieux.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définition des lieux', ''),
('/mod_discipline/definir_mesures.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définition des mesures', ''),
('/mod_discipline/sauve_role.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Svg rôle incident', ''),
('/mod_discipline/definir_autres_sanctions.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définir types sanctions', ''),
('/mod_discipline/liste_retenues_jour.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Liste des retenues du jour', ''),
('/mod_discipline/avertir_famille.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Avertir famille incident', ''),
('/mod_discipline/avertir_famille_html.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Avertir famille incident', ''),
('/mod_discipline/sauve_famille_avertie.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Svg famille avertie', ''),
('/mod_discipline/discipline_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Discipline: Activation/desactivation du module', ''),
('/aid/annees_anterieures_accueil.php', 'V', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'Configuration des AID', ''),
('/saisie/saisie_secours_eleve.php', 'F', 'F', 'F', 'F', 'F', 'F', 'V', 'F', 'Saisie notes/appréciations pour un élève en compte secours', ''),
('/classes/classes_ajax_lib.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Page appelée via ajax.', ''),
('/responsables/dedoublonnage_adresses.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Dédoublonnage des adresses responsables', ''),
('/bulletin/index.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Edition des bulletins', '1'),
('/mod_ects/ects_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Module ECTS : Admin', ''),
('/mod_ects/index_saisie.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Module ECTS : Accueil saisie', ''),
('/mod_ects/saisie_ects.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Module ECTS : Saisie', ''),
('/mod_ects/edition.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Module ECTS : Edition des documents', ''),
('/mod_ooo/documents_ects.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Module ECTS : Génération des documents', ''),
('/mod_ects/recapitulatif.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Module ECTS : Recapitulatif globaux', ''),
('/mod_notanet/fb_rouen_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fiches brevet PDF pour Rouen', ''),
('/mod_notanet/fb_montpellier_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fiches brevet PDF pour Montpellier', ''),
('/mod_plugins/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Ajouter/enlever des plugins', ''),
('/mod_genese_classes/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Accueil', ''),
('/mod_genese_classes/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Activation/désactivation', ''),
('/mod_genese_classes/select_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Choix des options', ''),
('/mod_genese_classes/select_eleves_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Choix des options des élèves', ''),
('/mod_genese_classes/select_classes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Choix des classes', ''),
('/mod_genese_classes/saisie_contraintes_opt_classe.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Saisie des contraintes options/classes', ''),
('/mod_genese_classes/liste_classe_fut.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Liste des classes futures (appel ajax)', ''),
('/mod_genese_classes/affiche_listes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Affichage de listes', ''),
('/mod_genese_classes/genere_ods.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Génération d un fichier ODS de listes', ''),
('/mod_genese_classes/affect_eleves_classes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Affectation des élèves', ''),
('/mod_genese_classes/select_arriv_red.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Sélection des arrivants/redoublants', '');
INSERT INTO `droits` (`id`, `administrateur`, `professeur`, `cpe`, `scolarite`, `eleve`, `responsable`, `secours`, `autre`, `description`, `statut`) VALUES
('/mod_genese_classes/liste_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Liste des options de classes existantes', ''),
('/mod_genese_classes/import_options.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génèse des classes: Import options depuis CSV', ''),
('/eleves/import_communes.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Import des communes de naissance', ''),
('/mod_notanet/fb_lille_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fiches brevet PDF pour Lille', ''),
('/mod_notanet/fb_creteil_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Fiches brevet PDF pour Creteil', ''),
('/mod_discipline/disc_stat.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Statistiques', ''),
('/mod_epreuve_blanche/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Epreuves blanches: Activation/désactivation du module', ''),
('/mod_examen_blanc/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Examens blancs: Activation/désactivation du module', ''),
('/mod_epreuve_blanche/index.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Accueil', ''),
('/mod_epreuve_blanche/transfert_cn.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Transfert vers carnet de notes', ''),
('/mod_epreuve_blanche/saisie_notes.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Saisie des notes', ''),
('/mod_epreuve_blanche/genere_emargement.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Génération émargement', ''),
('/mod_epreuve_blanche/definir_salles.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Définir les salles', ''),
('/mod_epreuve_blanche/attribuer_copies.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Attribuer les copies aux professeurs', ''),
('/mod_epreuve_blanche/bilan.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Bilan', ''),
('/mod_epreuve_blanche/genere_etiquettes.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Génération étiquettes', ''),
('/mod_examen_blanc/saisie_notes.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Examen blanc: Saisie devoir hors enseignement', ''),
('/mod_examen_blanc/index.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Examen blanc: Accueil', ''),
('/mod_examen_blanc/releve.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Examen blanc: Relevé', ''),
('/mod_examen_blanc/bull_exb.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Examen blanc: Bulletins', ''),
('/saisie/saisie_synthese_app_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Synthèse des appréciations sur le groupe classe.', ''),
('/gestion/saisie_message_connexion.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Saisie de messages de connexion.', ''),
('/groupes/repartition_ele_grp.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Répartir des élèves dans des groupes', ''),
('/prepa_conseil/edit_limite_bis.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Edition des bulletins simplifiés (documents de travail)', ''),
('/prepa_conseil/index2bis.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des notes par classes', ''),
('/prepa_conseil/index3bis.php', 'F', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Edition des bulletins simplifiés (documents de travail)', ''),
('/prepa_conseil/visu_toutes_notes_bis.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des notes par classes', ''),
('/utilitaires/import_pays.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des pays', ''),
('/mod_apb/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion du module Admissions PostBac', ''),
('/mod_apb/index.php', 'F', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'Export XML pour le système Admissions Post-Bac', ''),
('/mod_apb/export_xml.php', 'F', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'Export XML pour le système Admissions Post-Bac', ''),
('/mod_gest_aid/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestionnaire d''AID', ''),
('/saisie/ajax_edit_limite.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Edition des bulletins simplifiés (documents de travail)', ''),
('/mod_discipline/check_nature_incident.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Discipline: Recherche de natures d incident', ''),
('/groupes/signalement_eleves.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Groupes: signalement des erreurs d affectation élève', ''),
('/bulletin/envoi_mail.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Envoi de mail via ajax', ''),
('/mod_discipline/destinataires_alertes.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Parametrage des destinataires de mail d alerte', ''),
('/init_scribe_ng/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - index', ''),
('/init_scribe_ng/etape1.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 1', ''),
('/init_scribe_ng/etape2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 2', ''),
('/init_scribe_ng/etape3.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 3', ''),
('/init_scribe_ng/etape4.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 4', ''),
('/init_scribe_ng/etape5.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 5', ''),
('/init_scribe_ng/etape6.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 6', ''),
('/init_scribe_ng/etape7.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation Scribe NG - etape 7', ''),
('/mod_abs2/admin/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_motifs_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_lieux_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_types_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_justifications_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_actions_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/admin/admin_table_agregation.php', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Administration du module absences', ''),
('/mod_abs2/index.php', 'F', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Administration du module absences', ''),
('/mod_abs2/saisir_groupe.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Affichage du formulaire de saisie de absences', ''),
('/mod_abs2/absences_du_jour.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Affichage des absences du jour', ''),
('/mod_abs2/enregistrement_saisie_groupe.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Enregistrement des saisies d un groupe', ''),
('/mod_abs2/liste_saisies.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Liste des saisies', ''),
('/mod_abs2/liste_traitements.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Liste des traitements', ''),
('/mod_abs2/liste_notifications.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Liste des notifications', ''),
('/mod_abs2/liste_saisies_selection_traitement.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Liste des saisits pour faire les traitement', ''),
('/mod_abs2/visu_saisie.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Visualisation d une saisies', ''),
('/mod_abs2/visu_traitement.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Visualisation d une saisie', ''),
('/mod_abs2/visu_notification.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Visualisation d une notification', ''),
('/mod_abs2/enregistrement_modif_saisie.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Modification d une saisies', ''),
('/mod_abs2/enregistrement_modif_traitement.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Modification d un traitement', ''),
('/mod_abs2/enregistrement_modif_notification.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Modification d une notification', ''),
('/mod_abs2/generer_notification.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'generer une notification', ''),
('/mod_abs2/saisir_eleve.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'V', 'Saisir l absence d un eleve', ''),
('/mod_abs2/enregistrement_saisie_eleve.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'V', 'Enregistrer absence d un eleve', ''),
('/mod_abs2/creation_traitement.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Crer un traitement', ''),
('/mod_discipline/saisie_incident_abs2.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Saisir un incident relatif a une absence', ''),
('/mod_abs2/tableau_des_appels.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Visualisation du tableaux des saisies', ''),
('/mod_abs2/bilan_du_jour.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Visualisation du bilan du jour', ''),
('/mod_abs2/extraction_saisies.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Extraction des saisies', ''),
('/mod_abs2/extraction_demi-journees.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Extraction des saisies', ''),
('/mod_abs2/ajax_edt_eleve.php', 'V', 'F', 'V', 'V', 'F', 'F', 'V', 'F', 'Affichage edt', ''),
('/mod_abs2/bilan_individuel.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Bilan individuel des absences eleve', ''),
('/mod_abs2/totaux_du_jour.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'V', 'Totaux du jour des absences', ''),
('/mod_abs2/statistiques.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistiques des absences', ''),
('/mod_abs2/generer_notifications_par_lot.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Génération groupée des courriers', ''),
('/mod_abs2/bilan_parent.php', 'F', 'F', 'F', 'F', 'F', 'V', 'F', 'F', 'Affichage parents des absences de leurs enfants', ''),
('/mod_abs2/stat_justifications.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistiques des justifications des absences', ''),
('/mod_abs2/liste_eleves.php', 'F', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Liste des élèves avec les filtes absence', ''),
('/saisie/validation_corrections.php', 'V', 'V', 'F', 'V', 'F', 'F', 'V', 'F', 'Validation des corrections proposées par des professeurs après la cloture d une période', ''),
('/gestion/param_ordre_item.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Modifier l ordre des items dans les menus', ''),
('/mod_discipline/definir_categories.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définir les catégories', ''),
('/mod_discipline/stats2/index.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Module discipline: Statistiques', ''),
('/bulletin/autorisation_exceptionnelle_saisie_app.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Autorisation exceptionnelle de saisie d appréciation', ''),
('/init_csv/export_tables.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation CSV: Export tables', ''),
('/mod_trombinoscopes/trombino_pdf.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Trombinoscopes PDF', ''),
('/mod_trombinoscopes/trombino_decoupe.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Génération d une grille PDF pour les trombinoscopes,...', ''),
('/groupes/menage_eleves_groupes.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Groupes: Desinscription des eleves sans notes ni appreciations', ''),
('/statistiques/export_donnees_bulletins.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Export de données des bulletins', ''),
('/statistiques/index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistiques: Index', ''),
('/statistiques/classes_effectifs.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistiques: classe, effectifs', ''),
('/mod_annees_anterieures/ajax_bulletins.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'V', 'Accès aux bulletins d années antérieures', ''),
('/lib/ajax_signaler_faute.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Possibilité de signaler une faute de frappe dans une appréciation', ''),
('/eleves/ajax_modif_eleve.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Enregistrement des modifications élève', ''),
('/classes/ajouter_periode.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Classes: Ajouter des périodes', ''),
('/classes/supprimer_periode.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Classes: Supprimer des périodes', ''),
('/groupes/visu_mes_listes.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Accès aux listes d élèves', ''),
('/cahier_notes/index_cc.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/add_modif_cc_dev.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/add_modif_cc_eval.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/saisie_notes_cc.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_notes/visu_cc.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/mod_discipline/delegation.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Discipline: Définir les délégations pour exclusion temporaire', ''),
('/mef/admin_mef.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Mef : administration des niveau et formations', ''),
('/mef/associer_eleve_mef.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Mef : administration des niveau et formations', ''),
('/mef/enregistrement_eleve_mef.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Mef : administration des niveau et formations', ''),
('/responsables/synchro_mail.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Synchronisation des mail responsables', ''),
('/eleves/synchro_mail.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Synchronisation des mail élèves', ''),
('/cahier_texte_2/archivage_cdt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Archivage des CDT', ''),
('/documents/archives/index.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Archives des CDT', ''),
('/saisie/saisie_vocabulaire.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Saisie de vocabulaire', ''),
('/mod_epreuve_blanche/genere_liste_affichage.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Epreuve blanche: Génération listes affichage', ''),
('/cahier_texte_2/ajax_devoirs_classe.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Cahiers de textes : Devoirs d une classe pour tel jour', ''),
('/cahier_texte_2/ajax_liste_notices_privees.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Cahiers de textes : Liste des notices privées', ''),
('/mod_ooo/publipostage_ooo.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'V', 'Modèle Ooo : Publipostage', ''),
('/saisie/saisie_mentions.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Saisie de mentions', ''),
('/mod_discipline/visu_disc.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Discipline: Accès élève/parent', ''),
('/mod_discipline/definir_natures.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Définir les natures', ''),
('/init_xml2/traite_csv_udt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des enseignements via un Export CSV UDT', ''),
('/init_xml2/init_alternatif.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Initialisation année scolaire', ''),
('/mod_sso_table/index.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion de la table de correspondance sso', ''),
('/mod_examen_blanc/copie_exam.php', 'V', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'Examen blanc: Copie', ''),
('/gestion/changement_d_annee.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Changement d''année.', ''),
('/absences/import_absences_csv.php', 'F', 'F', 'V', 'F', 'F', 'F', 'V', 'F', 'Saisie des absences', ''),
('/statistiques/stat_connexions.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Statistiques de connexion', ''),
('/groupes/check_enseignements.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Controle des enseignements', ''),
('/lib/ajax_corriger_app.php', 'F', 'V', 'F', 'V', 'F', 'F', 'F', 'V', 'Correction appreciation', ''),
('/mod_annees_anterieures/archivage_bull_pdf.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Génération archives bulletins PDF', ''),
('/mod_notanet/OOo/imprime_ooo.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Imprime fiches brevet openDocument', ''),
('/mod_notanet/OOo/fiches_brevet.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Fiches brevet openDocument', ''),
('/eleves/modif_sexe.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Eleves: Modification ajax du sexe d un eleve', ''),
('/cahier_texte_2/correction_notices_cdt_formules_maths.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Correction des notices CDT', ''),
('/gestion/gestion_signature.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion signature', ''),
('/mod_abs2/saisir_groupe_plan.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Affichage du formulaire de saisie de absences sur plan de classe', ''),
('/matieres/matiere_ajax_lib.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Ajax', ''),
('/gestion/gestion_infos_actions.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Gestion des actions en attente signalées en page d accueil.', '1'),
('/responsables/maj_import3.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Mise à jour Sconet', ''),
('/responsables/consult_maj_sconet.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Consultation des compte-rendus de mise à jour Sconet', ''),
('/mod_discipline/mod_discipline_extraction_ooo.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline : Extrait OOo des incidents', ''),
('/cahier_notes/visu_releve_notes_ter.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Relevé de notes : accès parents et élèves', '1'),
('/utilisateurs/modif_par_lots.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Personnels : Traitements par lots', '1'),
('/bulletin/index_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Bulletins : Activation du module bulletins', '1'),
('/a_lire.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'A lire...', ''),
('/mod_alerte/admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Dispositif d alerte : Administration du module', ''),
('/mod_alerte/form_message.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Dispositif d alerte', ''),
('/cahier_notes/autorisation_exceptionnelle_saisie.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Autorisation exceptionnelle de saisie dans le carnet de notes.', ''),
('/bulletin/autorisation_exceptionnelle_saisie_note.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Autorisation exceptionnelle de saisie de notes du bulletin.', ''),
('/cahier_notes/copie_dev.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Carnet de notes', '1'),
('/cahier_texte_2/consultation2.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'V', 'Cahiers de textes: Consultation', ''),
('/mod_trombinoscopes/plan_de_classe.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Plan de classe', ''),
('/eleves/cherche_login.php', 'V', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Ajax: Recherche d un login', ''),
('/classes/ajout_eleve_classe.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Enregistrement des inscriptions élève/classe', ''),
('/mod_abs2/export_stat.php', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Exports statistiques', ''),
('/mod_abs2/calcul_score.php', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Exports statistiques', ''),
('/mod_abs2/admin/admin_table_totaux_absences.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '', ''),
('/responsables/infos_parent.php', 'F', 'F', 'F', 'F', 'F', 'V', 'F', 'F', '', ''),
('/cahier_texte_2/ajax_cdt.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Enregistrement des modifications sur CDT', ''),
('/cahier_notes_admin/creation_conteneurs_par_lots.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Création de conteneurs/boites par lots', '1'),
('/mod_abs2/traitements_par_lots.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Abs2: Creation lot de traitements', ''),
('/cahier_notes/visu_cc_elv.php', 'F', 'F', 'F', 'F', 'V', 'V', 'F', 'F', 'Carnet de notes - visualisation par les élèves', ''),
('/mod_discipline/aide.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'Discipline : Aide', ''),
('/eleves/recherche.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Effectuer une recherche sur une personne', ''),
('/classes/dates_classes.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Définition de dates pour les classes', ''),
('/mod_discipline/definir_bilan_periode.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Discipline: Définir les sanctions/avertissements de fin de période', ''),
('/mod_discipline/imprimer_bilan_periode.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Imprimer les avertissements de fin de période', ''),
('/mod_discipline/saisie_avertissement_fin_periode.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Discipline: Saisie des sanctions/avertissements de fin de période', ''),
('/mod_discipline/afficher_incidents_eleve.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Discipline: Affichage des incidents pour un élève.', ''),
('/groupes/grp_groupes_edit_eleves.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Edition des élèves des groupes de groupes', ''),
('/groupes/modify_grp_group.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Gestion des groupes de groupes', ''),
('/mod_abs2/saisie_bulletin.php', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'Saisie des absences et appréciations sur les bulletins', ''),
('/gestion/admin_nomenclatures.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des nomenclatures', ''),
('/cahier_texte_2/correction_notices_url_absolues_docs_joints.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Correction des notices CDT', ''),
('/mod_notanet/saisie_notes.php', 'V', 'V', 'F', 'V', 'F', 'F', 'V', 'F', 'Notanet: Saisie notes', ''),
('/edt/index_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'EDT ICAL : Administration', ''),
('/edt/index.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'EDT ICAL : Index', ''),
('/cahier_texte_admin/suppr_docs_joints_cdt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Suppression des documents joints aux CDT', ''),
('/mod_abs_prof/index.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Absences et remplacements de professeurs', ''),
('/mod_abs_prof/saisir_absence.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Saisie des absences de professeurs', ''),
('/mod_abs_prof/proposer_remplacement.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Proposer des remplacements aux professeurs', ''),
('/mod_abs_prof/attribuer_remplacement.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Attribuer les remplacements de professeurs', ''),
('/mod_abs_prof/index_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Absences/remplacements de professeurs : Administration', ''),
('/mod_abs_prof/afficher_remplacements.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Afficher les remplacements de professeurs', ''),
('/mod_engagements/index_admin.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Engagements', ''),
('/mod_engagements/saisie_engagements.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Saisie des engagements', ''),
('/mod_engagements/imprimer_documents.php', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'F', 'Imprimer documents', ''),
('/mod_engagements/saisie_engagements_user.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Saisie des engagements pour un utilisateur', ''),
('/groupes/correction_inscriptions_grp_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Correction des inscriptions dans des groupes d après un CSV', ''),
('/edt_organisation/import_edt_edt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des EDT depuis un XML EDT', ''),
('/mod_engagements/extraction_engagements.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Extraction des engagements', ''),
('/cahier_texte_2/cdt_choix_caracteres.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'Choix de caractères spéciaux pour le CDT2', ''),
('/cahier_texte_2/ajax_affichage_car_spec.php', 'F', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'CDT2: Caractères spéciaux à insérer', ''),
('/groupes/maj_inscript_ele_d_apres_edt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des inscriptions élèves depuis un XML EDT', ''),
('/eleves/resume_ele.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'Accueil élève résumé', ''),
('/mod_abs_prof/consulter_remplacements.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Consulter les remplacements de professeurs', ''),
('/groupes/export_groupes_sconet.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Exporter les groupes Gepi vers Sconet', ''),
('/eleves/ajax_consultation.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'V', 'Recherches/consultations classes/élèves via ajax', ''),
('/classes/info_dates_classes.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Informer des dates d événements pour les classes', ''),
('/cahier_notes/extraction_notes_cn.php', 'F', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'Extraction et export des notes des carnets de notes', ''),
('/etablissements/chercheRNE.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Recherche des RNE sans établissements', ''),
('/classes/dates_classes2.php', 'V', 'F', 'V', 'V', 'F', 'F', 'F', 'F', 'Définition de dates pour les classes', ''),
('/classes/export_ele_opt.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Export options élèves', ''),
('/mod_discipline/saisie_pointages.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Discipline: Pointages petits incidents', ''),
('/mod_discipline/param_pointages.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Discipline: Definir les types de pointages de petits incidents', ''),
('/mod_abs2/visu_eleve_calendrier.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Absences2 : Visualisation absences élève dans un calendrier', ''),
('/mod_notanet/recherche_ine.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Notanet : Recherche INE', ''),
('/visualisation/graphes_classe.php', 'F', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Tous les graphes sur une page pour une classe donnée', ''),
('/lib/ajax_action.php', 'V', 'V', 'V', 'V', 'F', 'F', 'V', 'F', 'Action ajax', ''),
('/mod_genese_classes/affiche_listes2.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Genèse des classes: Affichage de listes (2)', ''),
('/edt/import_vacances_ics.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'EDT : Import des vacances depuis l ICAL officiel EducNat', ''),
('/edt/index2.php', 'V', 'V', 'V', 'V', 'V', 'V', 'V', 'F', 'EDT 2 : Index', ''),
('/bulletin/bulletins_et_conseils_classes.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Bulletins et conseils de classe', ''),
('/aid/popup.php', 'V', 'V', 'V', 'V', 'F', 'F', 'F', 'F', 'Visualisation des membres d un AID', ''),
('/init_xml2/traite_xml_edt.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Import des enseignements via un Export XML EDT', ''),
('/mod_sso_table/traite_export_csv.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'SSO table : Export CSV', ''),
('/mod_sso_table/publipostage.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'SSO table : Publipostage', ''),
('/mod_ent/index_lea.php', 'V', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'Rapprochement des comptes ENT/GEPI : ENT LEA', '');

-- --------------------------------------------------------

--
-- Structure de la table `droits_acces_fichiers`
--

DROP TABLE IF EXISTS `droits_acces_fichiers`;
CREATE TABLE IF NOT EXISTS `droits_acces_fichiers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fichier` varchar(255) NOT NULL,
  `identite` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `droits_aid`
--

DROP TABLE IF EXISTS `droits_aid`;
CREATE TABLE IF NOT EXISTS `droits_aid` (
  `id` varchar(200) NOT NULL DEFAULT '',
  `public` char(1) NOT NULL DEFAULT '',
  `professeur` char(1) NOT NULL DEFAULT '',
  `cpe` char(1) NOT NULL DEFAULT '',
  `scolarite` char(1) NOT NULL DEFAULT '',
  `eleve` char(1) NOT NULL DEFAULT '',
  `responsable` char(1) NOT NULL DEFAULT 'F',
  `secours` char(1) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `statut` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `droits_aid`
--

INSERT INTO `droits_aid` (`id`, `public`, `professeur`, `cpe`, `scolarite`, `eleve`, `responsable`, `secours`, `description`, `statut`) VALUES
('nom', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('numero', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('perso1', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('perso2', 'F', 'F', 'V', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('productions', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Production', '1'),
('resume', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Résumé', '1'),
('famille', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Famille', '1'),
('mots_cles', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Mots clés', '1'),
('adresse1', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Adresse publique', '1'),
('adresse2', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Adresse privée', '1'),
('public_destinataire', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Public destinataire', '1'),
('contacts', 'F', 'V', 'F', 'F', 'V', 'F', 'F', 'Contacts, ressources', '1'),
('divers', 'F', 'V', 'F', 'F', 'V', 'F', 'F', 'Divers', '1'),
('matiere1', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Discipline principale', '1'),
('matiere2', 'V', 'V', 'F', 'F', 'V', 'F', 'F', 'Discipline secondaire', '1'),
('eleve_peut_modifier', '-', '-', '-', '-', '-', '-', '-', 'A préciser', '1'),
('cpe_peut_modifier', '-', '-', '-', '-', '-', '-', '-', 'A préciser', '1'),
('prof_peut_modifier', '-', '-', '-', '-', '-', '-', '-', 'A préciser', '0'),
('fiche_publique', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('affiche_adresse1', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('en_construction', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'A préciser', '1'),
('perso3', 'V', 'F', 'V', 'F', 'F', 'F', 'F', 'A préciser', '0');

-- --------------------------------------------------------

--
-- Structure de la table `droits_speciaux`
--

DROP TABLE IF EXISTS `droits_speciaux`;
CREATE TABLE IF NOT EXISTS `droits_speciaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_statut` int(11) NOT NULL,
  `nom_fichier` varchar(200) NOT NULL,
  `autorisation` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `droits_statut`
--

DROP TABLE IF EXISTS `droits_statut`;
CREATE TABLE IF NOT EXISTS `droits_statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_statut` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `droits_utilisateurs`
--

DROP TABLE IF EXISTS `droits_utilisateurs`;
CREATE TABLE IF NOT EXISTS `droits_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_statut` int(11) NOT NULL,
  `login_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `d_dates_evenements`
--

DROP TABLE IF EXISTS `d_dates_evenements`;
CREATE TABLE IF NOT EXISTS `d_dates_evenements` (
  `id_ev` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `texte_avant` text NOT NULL,
  `texte_apres` text NOT NULL,
  `texte_apres_ele_resp` text NOT NULL,
  `date_debut` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `d_dates_evenements_classes`
--

DROP TABLE IF EXISTS `d_dates_evenements_classes`;
CREATE TABLE IF NOT EXISTS `d_dates_evenements_classes` (
  `id_ev_classe` int(11) NOT NULL AUTO_INCREMENT,
  `id_ev` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `date_evenement` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_salle` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ev_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `d_dates_evenements_utilisateurs`
--

DROP TABLE IF EXISTS `d_dates_evenements_utilisateurs`;
CREATE TABLE IF NOT EXISTS `d_dates_evenements_utilisateurs` (
  `id_ev` int(11) NOT NULL,
  `statut` varchar(20) NOT NULL,
  KEY `id_ev_u` (`id_ev`,`statut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `eb_copies`
--

DROP TABLE IF EXISTS `eb_copies`;
CREATE TABLE IF NOT EXISTS `eb_copies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_ele` varchar(255) NOT NULL,
  `n_anonymat` varchar(255) NOT NULL,
  `id_salle` int(11) NOT NULL DEFAULT '-1',
  `login_prof` varchar(255) NOT NULL,
  `note` float(10,1) NOT NULL DEFAULT '0.0',
  `statut` varchar(255) NOT NULL DEFAULT '',
  `id_epreuve` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eb_epreuves`
--

DROP TABLE IF EXISTS `eb_epreuves`;
CREATE TABLE IF NOT EXISTS `eb_epreuves` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type_anonymat` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `etat` varchar(255) NOT NULL,
  `note_sur` int(11) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eb_groupes`
--

DROP TABLE IF EXISTS `eb_groupes`;
CREATE TABLE IF NOT EXISTS `eb_groupes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_epreuve` int(11) unsigned NOT NULL,
  `id_groupe` int(11) unsigned NOT NULL,
  `transfert` varchar(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eb_profs`
--

DROP TABLE IF EXISTS `eb_profs`;
CREATE TABLE IF NOT EXISTS `eb_profs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_epreuve` int(11) unsigned NOT NULL,
  `login_prof` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eb_salles`
--

DROP TABLE IF EXISTS `eb_salles`;
CREATE TABLE IF NOT EXISTS `eb_salles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `salle` varchar(255) NOT NULL,
  `id_epreuve` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ects_credits`
--

DROP TABLE IF EXISTS `ects_credits`;
CREATE TABLE IF NOT EXISTS `ects_credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) NOT NULL COMMENT 'Identifiant de l''eleve',
  `num_periode` int(11) NOT NULL COMMENT 'Identifiant de la periode',
  `id_groupe` int(11) NOT NULL COMMENT 'Identifiant du groupe',
  `valeur` varchar(255) DEFAULT NULL,
  `mention` varchar(255) DEFAULT NULL,
  `mention_prof` varchar(255) DEFAULT NULL COMMENT 'Mention presaisie par le prof',
  PRIMARY KEY (`id`,`id_eleve`,`num_periode`,`id_groupe`),
  KEY `ects_credits_FI_1` (`id_eleve`),
  KEY `ects_credits_FI_2` (`id_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ects_global_credits`
--

DROP TABLE IF EXISTS `ects_global_credits`;
CREATE TABLE IF NOT EXISTS `ects_global_credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) NOT NULL COMMENT 'Identifiant de l''eleve',
  `mention` varchar(255) NOT NULL COMMENT 'Mention obtenue',
  PRIMARY KEY (`id`,`id_eleve`),
  KEY `ects_global_credits_FI_1` (`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_calendrier`
--

DROP TABLE IF EXISTS `edt_calendrier`;
CREATE TABLE IF NOT EXISTS `edt_calendrier` (
  `id_calendrier` int(11) NOT NULL AUTO_INCREMENT,
  `classe_concerne_calendrier` text NOT NULL,
  `nom_calendrier` varchar(100) NOT NULL DEFAULT '',
  `debut_calendrier_ts` varchar(11) NOT NULL,
  `fin_calendrier_ts` varchar(11) NOT NULL,
  `jourdebut_calendrier` date NOT NULL DEFAULT '0000-00-00',
  `heuredebut_calendrier` time NOT NULL DEFAULT '00:00:00',
  `jourfin_calendrier` date NOT NULL DEFAULT '0000-00-00',
  `heurefin_calendrier` time NOT NULL DEFAULT '00:00:00',
  `numero_periode` tinyint(4) NOT NULL DEFAULT '0',
  `etabferme_calendrier` tinyint(4) NOT NULL,
  `etabvacances_calendrier` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_calendrier`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `edt_calendrier`
--

INSERT INTO `edt_calendrier` (`id_calendrier`, `classe_concerne_calendrier`, `nom_calendrier`, `debut_calendrier_ts`, `fin_calendrier_ts`, `jourdebut_calendrier`, `heuredebut_calendrier`, `jourfin_calendrier`, `heurefin_calendrier`, `numero_periode`, `etabferme_calendrier`, `etabvacances_calendrier`) VALUES
(1, '7;1;3;5;4;2;6;', 'Nouvelle période', '1451692800', '1454284740', '2016-01-02', '00:00:00', '2016-01-31', '23:59:00', 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `edt_classes`
--

DROP TABLE IF EXISTS `edt_classes`;
CREATE TABLE IF NOT EXISTS `edt_classes` (
  `id_edt_classe` int(11) NOT NULL AUTO_INCREMENT,
  `groupe_edt_classe` int(11) NOT NULL,
  `prof_edt_classe` varchar(25) NOT NULL,
  `matiere_edt_classe` varchar(10) NOT NULL,
  `semaine_edt_classe` varchar(5) NOT NULL,
  `jour_edt_classe` tinyint(4) NOT NULL,
  `datedebut_edt_classe` date NOT NULL,
  `datefin_edt_classe` date NOT NULL,
  `heuredebut_edt_classe` time NOT NULL,
  `heurefin_edt_classe` time NOT NULL,
  `salle_edt_classe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_edt_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_corresp`
--

DROP TABLE IF EXISTS `edt_corresp`;
CREATE TABLE IF NOT EXISTS `edt_corresp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `champ` varchar(100) NOT NULL DEFAULT '',
  `nom_edt` varchar(255) NOT NULL DEFAULT '',
  `nom_gepi` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_corresp2`
--

DROP TABLE IF EXISTS `edt_corresp2`;
CREATE TABLE IF NOT EXISTS `edt_corresp2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `mat_code_edt` varchar(255) NOT NULL DEFAULT '',
  `nom_groupe_edt` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_cours`
--

DROP TABLE IF EXISTS `edt_cours`;
CREATE TABLE IF NOT EXISTS `edt_cours` (
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` varchar(10) NOT NULL,
  `id_aid` varchar(10) NOT NULL,
  `id_salle` varchar(3) NOT NULL,
  `jour_semaine` varchar(10) NOT NULL,
  `id_definie_periode` varchar(3) NOT NULL,
  `duree` varchar(10) NOT NULL DEFAULT '2',
  `heuredeb_dec` varchar(3) NOT NULL DEFAULT '0',
  `id_semaine` varchar(10) NOT NULL DEFAULT '0',
  `id_calendrier` varchar(3) NOT NULL DEFAULT '0',
  `modif_edt` varchar(3) NOT NULL DEFAULT '0',
  `login_prof` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cours`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_creneaux`
--

DROP TABLE IF EXISTS `edt_creneaux`;
CREATE TABLE IF NOT EXISTS `edt_creneaux` (
  `id_definie_periode` int(11) NOT NULL AUTO_INCREMENT,
  `nom_definie_periode` varchar(10) NOT NULL DEFAULT '',
  `heuredebut_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `heurefin_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `suivi_definie_periode` tinyint(4) NOT NULL,
  `type_creneaux` varchar(15) NOT NULL,
  `jour_creneau` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_definie_periode`),
  KEY `heures_debut_fin` (`heuredebut_definie_periode`,`heurefin_definie_periode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `edt_creneaux`
--

INSERT INTO `edt_creneaux` (`id_definie_periode`, `nom_definie_periode`, `heuredebut_definie_periode`, `heurefin_definie_periode`, `suivi_definie_periode`, `type_creneaux`, `jour_creneau`) VALUES
(1, 'M1', '08:00:00', '08:55:00', 1, 'cours', ''),
(2, 'M2', '08:55:00', '09:50:00', 1, 'cours', ''),
(3, 'M3', '10:05:00', '11:00:00', 1, 'cours', ''),
(4, 'M4', '11:00:00', '11:55:00', 1, 'cours', ''),
(5, 'M5', '11:55:00', '12:30:00', 1, 'cours', ''),
(6, 'S1', '13:30:00', '14:25:00', 1, 'cours', ''),
(7, 'S2', '14:25:00', '15:20:00', 1, 'cours', ''),
(8, 'S3', '15:35:00', '16:30:00', 1, 'cours', ''),
(9, 'S4', '16:30:00', '17:30:00', 1, 'cours', ''),
(10, 'S5', '17:30:00', '18:25:00', 1, 'cours', ''),
(11, 'P1', '09:50:00', '10:05:00', 1, 'pause', ''),
(12, 'P2', '15:20:00', '15:35:00', 1, 'pause', ''),
(13, 'R', '12:00:00', '13:00:00', 1, 'repas', ''),
(14, 'R1', '13:00:00', '13:30:00', 1, 'pause', '');

-- --------------------------------------------------------

--
-- Structure de la table `edt_creneaux_bis`
--

DROP TABLE IF EXISTS `edt_creneaux_bis`;
CREATE TABLE IF NOT EXISTS `edt_creneaux_bis` (
  `id_definie_periode` int(11) NOT NULL AUTO_INCREMENT,
  `nom_definie_periode` varchar(10) NOT NULL DEFAULT '',
  `heuredebut_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `heurefin_definie_periode` time NOT NULL DEFAULT '00:00:00',
  `suivi_definie_periode` tinyint(4) NOT NULL,
  `type_creneaux` varchar(15) NOT NULL,
  PRIMARY KEY (`id_definie_periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_dates_special`
--

DROP TABLE IF EXISTS `edt_dates_special`;
CREATE TABLE IF NOT EXISTS `edt_dates_special` (
  `id_edt_date_special` int(11) NOT NULL AUTO_INCREMENT,
  `nom_edt_date_special` varchar(200) NOT NULL,
  `debut_edt_date_special` date NOT NULL,
  `fin_edt_date_special` date NOT NULL,
  PRIMARY KEY (`id_edt_date_special`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_eleves_lignes`
--

DROP TABLE IF EXISTS `edt_eleves_lignes`;
CREATE TABLE IF NOT EXISTS `edt_eleves_lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `date_naiss` varchar(255) NOT NULL DEFAULT '',
  `sexe` varchar(255) NOT NULL DEFAULT '',
  `n_national` varchar(255) NOT NULL DEFAULT '',
  `classe` varchar(255) NOT NULL DEFAULT '',
  `groupes` varchar(255) NOT NULL DEFAULT '',
  `option_1` varchar(255) NOT NULL DEFAULT '',
  `option_2` varchar(255) NOT NULL DEFAULT '',
  `option_3` varchar(255) NOT NULL DEFAULT '',
  `option_4` varchar(255) NOT NULL DEFAULT '',
  `option_5` varchar(255) NOT NULL DEFAULT '',
  `option_6` varchar(255) NOT NULL DEFAULT '',
  `option_7` varchar(255) NOT NULL DEFAULT '',
  `option_8` varchar(255) NOT NULL DEFAULT '',
  `option_9` varchar(255) NOT NULL DEFAULT '',
  `option_10` varchar(255) NOT NULL DEFAULT '',
  `option_11` varchar(255) NOT NULL DEFAULT '',
  `option_12` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_ics`
--

DROP TABLE IF EXISTS `edt_ics`;
CREATE TABLE IF NOT EXISTS `edt_ics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_classe` int(11) NOT NULL,
  `classe_ics` varchar(100) NOT NULL DEFAULT '',
  `prof_ics` varchar(200) NOT NULL DEFAULT '',
  `matiere_ics` varchar(100) NOT NULL DEFAULT '',
  `salle_ics` varchar(100) NOT NULL DEFAULT '',
  `jour_semaine` varchar(10) NOT NULL DEFAULT '',
  `num_semaine` varchar(10) NOT NULL DEFAULT '',
  `annee` char(4) NOT NULL DEFAULT '',
  `date_debut` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_fin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_ics_matiere`
--

DROP TABLE IF EXISTS `edt_ics_matiere`;
CREATE TABLE IF NOT EXISTS `edt_ics_matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matiere` varchar(100) NOT NULL DEFAULT '',
  `matiere_ics` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_ics_prof`
--

DROP TABLE IF EXISTS `edt_ics_prof`;
CREATE TABLE IF NOT EXISTS `edt_ics_prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_prof` varchar(100) NOT NULL DEFAULT '',
  `prof_ics` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_init`
--

DROP TABLE IF EXISTS `edt_init`;
CREATE TABLE IF NOT EXISTS `edt_init` (
  `id_init` int(11) NOT NULL AUTO_INCREMENT,
  `ident_export` varchar(100) NOT NULL,
  `nom_export` varchar(200) NOT NULL,
  `nom_gepi` varchar(200) NOT NULL,
  PRIMARY KEY (`id_init`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_lignes`
--

DROP TABLE IF EXISTS `edt_lignes`;
CREATE TABLE IF NOT EXISTS `edt_lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) NOT NULL DEFAULT '',
  `classe` varchar(255) NOT NULL DEFAULT '',
  `mat_code` varchar(255) NOT NULL DEFAULT '',
  `mat_libelle` varchar(255) NOT NULL DEFAULT '',
  `prof_nom` varchar(255) NOT NULL DEFAULT '',
  `prof_prenom` varchar(255) NOT NULL DEFAULT '',
  `salle` varchar(255) NOT NULL DEFAULT '',
  `jour` varchar(255) NOT NULL DEFAULT '',
  `h_debut` varchar(255) NOT NULL DEFAULT '',
  `duree` varchar(255) NOT NULL DEFAULT '',
  `frequence` varchar(10) NOT NULL DEFAULT '',
  `alternance` varchar(10) NOT NULL DEFAULT '',
  `effectif` varchar(255) NOT NULL DEFAULT '',
  `modalite` varchar(255) NOT NULL DEFAULT '',
  `co_ens` varchar(255) NOT NULL DEFAULT '',
  `pond` varchar(255) NOT NULL DEFAULT '',
  `traitement` varchar(100) NOT NULL DEFAULT '',
  `details_cours` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `edt_semaines`
--

DROP TABLE IF EXISTS `edt_semaines`;
CREATE TABLE IF NOT EXISTS `edt_semaines` (
  `id_edt_semaine` int(11) NOT NULL AUTO_INCREMENT,
  `num_edt_semaine` int(11) NOT NULL DEFAULT '0',
  `type_edt_semaine` varchar(10) NOT NULL DEFAULT '',
  `num_semaines_etab` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_edt_semaine`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Contenu de la table `edt_semaines`
--

INSERT INTO `edt_semaines` (`id_edt_semaine`, `num_edt_semaine`, `type_edt_semaine`, `num_semaines_etab`) VALUES
(1, 1, 'A', 0),
(2, 2, 'A', 0),
(3, 3, 'A', 0),
(4, 4, 'A', 0),
(5, 5, 'A', 0),
(6, 6, 'A', 0),
(7, 7, 'A', 0),
(8, 8, 'A', 0),
(9, 9, 'A', 0),
(10, 10, 'A', 0),
(11, 11, 'A', 0),
(12, 12, 'A', 0),
(13, 13, 'A', 0),
(14, 14, 'A', 0),
(15, 15, 'A', 0),
(16, 16, 'A', 0),
(17, 17, 'A', 0),
(18, 18, 'A', 0),
(19, 19, 'A', 0),
(20, 20, 'A', 0),
(21, 21, 'A', 0),
(22, 22, 'A', 0),
(23, 23, 'A', 0),
(24, 24, 'A', 0),
(25, 25, 'A', 0),
(26, 26, 'A', 0),
(27, 27, 'A', 0),
(28, 28, 'A', 0),
(29, 29, 'A', 0),
(30, 30, 'A', 0),
(31, 31, 'A', 0),
(32, 32, 'A', 0),
(33, 33, 'A', 0),
(34, 34, 'A', 0),
(35, 35, 'A', 0),
(36, 36, 'A', 0),
(37, 37, 'A', 0),
(38, 38, 'A', 0),
(39, 39, 'A', 0),
(40, 40, 'A', 0),
(41, 41, 'A', 0),
(42, 42, 'A', 0),
(43, 43, 'A', 0),
(44, 44, 'A', 0),
(45, 45, 'A', 0),
(46, 46, 'A', 0),
(47, 47, 'A', 0),
(48, 48, 'A', 0),
(49, 49, 'A', 0),
(50, 50, 'A', 0),
(51, 51, 'A', 0),
(52, 52, 'A', 0),
(53, 53, 'A', 0);

-- --------------------------------------------------------

--
-- Structure de la table `edt_setting`
--

DROP TABLE IF EXISTS `edt_setting`;
CREATE TABLE IF NOT EXISTS `edt_setting` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `reglage` varchar(30) NOT NULL,
  `valeur` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reglage` (`reglage`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `edt_setting`
--

INSERT INTO `edt_setting` (`id`, `reglage`, `valeur`) VALUES
(1, 'nom_creneaux_s', '1'),
(2, 'edt_aff_salle', 'nom'),
(3, 'edt_aff_matiere', 'long'),
(4, 'edt_aff_creneaux', 'noms'),
(5, 'edt_aff_init_infos', 'oui'),
(6, 'edt_aff_couleur', 'nb'),
(7, 'edt_aff_init_infos2', 'oui'),
(8, 'aff_cherche_salle', 'tous'),
(9, 'param_menu_edt', 'mouseover'),
(10, 'scolarite_modif_cours', 'y'),
(11, 'edt_aff_couleur_salle', 'nb'),
(12, 'edt_aff_couleur_prof', 'nb');

-- --------------------------------------------------------

--
-- Structure de la table `edt_tempo`
--

DROP TABLE IF EXISTS `edt_tempo`;
CREATE TABLE IF NOT EXISTS `edt_tempo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col1` varchar(255) NOT NULL DEFAULT '',
  `col2` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE IF NOT EXISTS `eleves` (
  `no_gep` varchar(50) NOT NULL COMMENT 'Ancien numero GEP, Numero national de l''eleve',
  `login` varchar(50) NOT NULL COMMENT 'Login de l''eleve, est conserve pour le login utilisateur',
  `nom` varchar(50) NOT NULL COMMENT 'Nom eleve',
  `prenom` varchar(50) NOT NULL COMMENT 'Prenom eleve',
  `sexe` varchar(1) NOT NULL COMMENT 'M ou F',
  `naissance` date NOT NULL COMMENT 'Date de naissance AAAA-MM-JJ',
  `lieu_naissance` varchar(50) NOT NULL DEFAULT '' COMMENT 'Code de Sconet',
  `elenoet` varchar(50) NOT NULL COMMENT 'Numero interne de l''eleve dans l''etablissement',
  `ereno` varchar(50) NOT NULL COMMENT 'Plus utilise',
  `ele_id` varchar(10) NOT NULL DEFAULT '' COMMENT 'cle utilise par Sconet dans ses fichiers xml',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Courriel de l''eleve',
  `tel_pers` varchar(255) NOT NULL DEFAULT '' COMMENT 'Telephone personnel de l''eleve',
  `tel_port` varchar(255) NOT NULL DEFAULT '' COMMENT 'Telephone portable de l''eleve',
  `tel_prof` varchar(255) NOT NULL DEFAULT '' COMMENT 'Telephone professionnel (?) de l''eleve',
  `id_eleve` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cle primaire autoincremente',
  `date_entree` datetime DEFAULT NULL COMMENT 'Timestamp d''entrée de l''élève de l''établissement (début d''inscription)',
  `date_sortie` datetime DEFAULT NULL COMMENT 'Timestamp de sortie de l''élève de l''établissement (fin d''inscription)',
  `mef_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'code mef de la formation de l''eleve',
  `id_mef` int(11) DEFAULT NULL COMMENT 'cle externe pour le jointure avec mef',
  PRIMARY KEY (`id_eleve`),
  KEY `eleves_FI_1` (`mef_code`),
  KEY `I_referenced_j_eleves_classes_FK_1_1` (`login`),
  KEY `I_referenced_responsables2_FK_1_2` (`ele_id`),
  KEY `I_referenced_archivage_ects_FK_1_3` (`no_gep`),
  KEY `ele_id` (`ele_id`),
  KEY `eleves_FK_1` (`id_mef`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Liste des eleves de l''etablissement' AUTO_INCREMENT=11 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`no_gep`, `login`, `nom`, `prenom`, `sexe`, `naissance`, `lieu_naissance`, `elenoet`, `ereno`, `ele_id`, `email`, `tel_pers`, `tel_port`, `tel_prof`, `id_eleve`, `date_entree`, `date_sortie`, `mef_code`, `id_mef`) VALUES
('', 'alida', 'ZOBO', 'Justine', 'F', '1995-10-05', '', '15X001', '', 'e000000001', 'alida@gmail.com', '', '', '', 1, NULL, NULL, '-1', NULL),
('', 'kelly', 'Meyo', 'NTSAMA', 'M', '1993-03-02', '', '15x002', '', 'e000000002', 'kelly@gmail.com', '', '', '', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-1', NULL),
('', 'alexy', 'NSTAMA', 'Alexy', 'F', '2013-10-10', '', '', '', 'e000000003', '', '', '', '', 3, NULL, NULL, '-1', NULL),
('', 'toto', 'toto', 'toto', 'M', '1991-01-01', '', '', '', 'e000000004', '', '', '', '', 4, NULL, NULL, '-1', NULL),
('', 'tata', 'tata', 'tata', 'M', '1993-01-01', '', '', '', 'e000000005', '', '', '', '', 5, NULL, NULL, '-1', NULL),
('', 'abena_41', 'abena', 'abena', 'M', '2000-05-21', '', '15x003', '', 'e000000006', '', '', '', '', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-1', NULL),
('', 'abena_62', 'abena', 'abena', 'M', '2001-01-01', '', '150', '', 'e000000007', '', '', '', '', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-1', NULL),
('', 'tete_62', 'tete', 'tete', 'M', '2000-01-01', '', '131', '', 'e000000008', '', '', '', '', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-1', NULL),
('', 'celestin', 'celestin', 'celestin', 'M', '2006-01-12', '', '151', '', 'e000000009', '', '', '', '', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', NULL),
('', 'sc_5', 'lina', 'lina', 'M', '1996-05-20', '', '515', '', 'e000000010', '', '', '', '', 10, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `eleves_groupes_settings`
--

DROP TABLE IF EXISTS `eleves_groupes_settings`;
CREATE TABLE IF NOT EXISTS `eleves_groupes_settings` (
  `login` varchar(50) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  PRIMARY KEY (`id_groupe`,`login`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `engagements`
--

DROP TABLE IF EXISTS `engagements`;
CREATE TABLE IF NOT EXISTS `engagements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `conseil_de_classe` varchar(10) NOT NULL,
  `ConcerneEleve` varchar(10) NOT NULL,
  `ConcerneResponsable` varchar(10) NOT NULL,
  `SaisieScol` varchar(10) NOT NULL,
  `SaisieCpe` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `engagements`
--

INSERT INTO `engagements` (`id`, `code`, `nom`, `description`, `type`, `conseil_de_classe`, `ConcerneEleve`, `ConcerneResponsable`, `SaisieScol`, `SaisieCpe`) VALUES
(1, 'C', 'Délégué de classe', 'Délégué de classe', 'id_classe', 'yes', 'yes', '', 'yes', ''),
(2, 'V', 'Délégué du conseil de la vie lycéenne', 'Délégué du conseil de la vie lycéenne', '', '', 'yes', '', 'yes', ''),
(3, 'A', 'Membre du conseil d''administration', 'Membre du conseil d''administration', '', '', 'yes', '', 'yes', ''),
(4, 'E', 'Membre du comité d''éducation à la santé et à la citoyenneté', 'Membre du comité d''éducation à la santé et à la citoyenneté', '', '', '', '', 'yes', ''),
(5, 'S', 'Membre de l''association sportive', 'Membre de l''association sportive', '', '', 'yes', '', 'yes', '');

-- --------------------------------------------------------

--
-- Structure de la table `engagements_user`
--

DROP TABLE IF EXISTS `engagements_user`;
CREATE TABLE IF NOT EXISTS `engagements_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_engagement` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `id_type` varchar(20) NOT NULL,
  `valeur` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etablissements`
--

DROP TABLE IF EXISTS `etablissements`;
CREATE TABLE IF NOT EXISTS `etablissements` (
  `id` char(8) NOT NULL DEFAULT '',
  `nom` char(50) NOT NULL DEFAULT '',
  `niveau` char(50) NOT NULL DEFAULT '',
  `type` char(50) NOT NULL DEFAULT '',
  `cp` varchar(10) NOT NULL,
  `ville` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etablissements`
--

INSERT INTO `etablissements` (`id`, `nom`, `niveau`, `type`, `cp`, `ville`) VALUES
('999', 'étranger', 'aucun', 'aucun', '999', ''),
('jeandarc', 'sainte JEAN D''ARC', 'college', 'prive', '130', 'Nkongsamba'),
('steMoniq', 'ste Monique', 'college', 'prive', '130', 'Nkongsamba');

-- --------------------------------------------------------

--
-- Structure de la table `etiquettes_formats`
--

DROP TABLE IF EXISTS `etiquettes_formats`;
CREATE TABLE IF NOT EXISTS `etiquettes_formats` (
  `id_etiquette_format` int(11) NOT NULL AUTO_INCREMENT,
  `nom_etiquette_format` varchar(150) NOT NULL,
  `xcote_etiquette_format` float NOT NULL,
  `ycote_etiquette_format` float NOT NULL,
  `espacementx_etiquette_format` float NOT NULL,
  `espacementy_etiquette_format` float NOT NULL,
  `largeur_etiquette_format` float NOT NULL,
  `hauteur_etiquette_format` float NOT NULL,
  `nbl_etiquette_format` tinyint(4) NOT NULL,
  `nbh_etiquette_format` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_etiquette_format`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `etiquettes_formats`
--

INSERT INTO `etiquettes_formats` (`id_etiquette_format`, `nom_etiquette_format`, `xcote_etiquette_format`, `ycote_etiquette_format`, `espacementx_etiquette_format`, `espacementy_etiquette_format`, `largeur_etiquette_format`, `hauteur_etiquette_format`, `nbl_etiquette_format`, `nbh_etiquette_format`) VALUES
(1, 'Avery - A4 - 63,5 x 33,9 mm', 2, 2, 5, 5, 63.5, 33, 3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `ex_classes`
--

DROP TABLE IF EXISTS `ex_classes`;
CREATE TABLE IF NOT EXISTS `ex_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_exam` int(11) unsigned NOT NULL,
  `id_classe` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ex_examens`
--

DROP TABLE IF EXISTS `ex_examens`;
CREATE TABLE IF NOT EXISTS `ex_examens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `intitule` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `etat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ex_groupes`
--

DROP TABLE IF EXISTS `ex_groupes`;
CREATE TABLE IF NOT EXISTS `ex_groupes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_exam` int(11) unsigned NOT NULL,
  `matiere` varchar(50) NOT NULL,
  `id_groupe` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_dev` int(11) NOT NULL DEFAULT '0',
  `valeur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ex_matieres`
--

DROP TABLE IF EXISTS `ex_matieres`;
CREATE TABLE IF NOT EXISTS `ex_matieres` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_exam` int(11) unsigned NOT NULL,
  `matiere` varchar(255) NOT NULL,
  `coef` decimal(3,1) NOT NULL DEFAULT '1.0',
  `bonus` char(1) NOT NULL DEFAULT 'n',
  `ordre` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ex_notes`
--

DROP TABLE IF EXISTS `ex_notes`;
CREATE TABLE IF NOT EXISTS `ex_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ex_grp` int(11) unsigned NOT NULL,
  `login` varchar(50) NOT NULL DEFAULT '',
  `note` float(10,1) NOT NULL DEFAULT '0.0',
  `statut` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_affichages`
--

DROP TABLE IF EXISTS `gc_affichages`;
CREATE TABLE IF NOT EXISTS `gc_affichages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_aff` int(11) unsigned NOT NULL,
  `id_req` int(11) unsigned NOT NULL,
  `projet` varchar(255) NOT NULL,
  `nom_requete` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `valeur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_divisions`
--

DROP TABLE IF EXISTS `gc_divisions`;
CREATE TABLE IF NOT EXISTS `gc_divisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projet` varchar(255) NOT NULL,
  `id_classe` smallint(6) unsigned NOT NULL,
  `classe` varchar(100) NOT NULL DEFAULT '',
  `statut` enum('actuelle','future','red','arriv') NOT NULL DEFAULT 'future',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_eleves_options`
--

DROP TABLE IF EXISTS `gc_eleves_options`;
CREATE TABLE IF NOT EXISTS `gc_eleves_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `profil` enum('GC','C','RAS','B','TB') NOT NULL DEFAULT 'RAS',
  `moy` varchar(255) NOT NULL,
  `nb_absences` varchar(255) NOT NULL,
  `non_justifie` varchar(255) NOT NULL,
  `nb_retards` varchar(255) NOT NULL,
  `projet` varchar(255) NOT NULL,
  `id_classe_actuelle` varchar(255) NOT NULL,
  `classe_future` varchar(255) NOT NULL,
  `liste_opt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_ele_arriv_red`
--

DROP TABLE IF EXISTS `gc_ele_arriv_red`;
CREATE TABLE IF NOT EXISTS `gc_ele_arriv_red` (
  `login` varchar(50) NOT NULL,
  `statut` enum('Arriv','Red') NOT NULL,
  `projet` varchar(255) NOT NULL,
  PRIMARY KEY (`login`,`projet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gc_noms_affichages`
--

DROP TABLE IF EXISTS `gc_noms_affichages`;
CREATE TABLE IF NOT EXISTS `gc_noms_affichages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_aff` int(11) NOT NULL,
  `projet` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_options`
--

DROP TABLE IF EXISTS `gc_options`;
CREATE TABLE IF NOT EXISTS `gc_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projet` varchar(255) NOT NULL,
  `opt` varchar(255) NOT NULL,
  `type` enum('lv1','lv2','lv3','autre') NOT NULL,
  `obligatoire` enum('o','n') NOT NULL,
  `exclusive` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_options_classes`
--

DROP TABLE IF EXISTS `gc_options_classes`;
CREATE TABLE IF NOT EXISTS `gc_options_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projet` varchar(255) NOT NULL,
  `opt_exclue` varchar(255) NOT NULL,
  `classe_future` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `gc_projets`
--

DROP TABLE IF EXISTS `gc_projets`;
CREATE TABLE IF NOT EXISTS `gc_projets` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `projet` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `recalcul_rang` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_name` (`id`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `groupes`
--

INSERT INTO `groupes` (`id`, `name`, `description`, `recalcul_rang`) VALUES
(1, 'Histoire', 'Histoire', 'nnnynn'),
(2, 'Math', 'Mathematique', 'nnnyyynn'),
(3, 'PHYSIQUE', 'PHYSIQUE COMPLET', 'nnnyyynn'),
(4, 'INF', 'INFORMATIQUE', 'nnn'),
(5, 'Histoire', 'Histoire', 'nnn'),
(6, 'Histoire', 'Histoire', 'nnnn'),
(7, 'allemand1', 'allemand', 'nnn'),
(8, 'allemand1', 'allemand', 'nnnnnn'),
(9, 'EPS', 'EPS', 'nnnnnn');

-- --------------------------------------------------------

--
-- Structure de la table `groupes_param`
--

DROP TABLE IF EXISTS `groupes_param`;
CREATE TABLE IF NOT EXISTS `groupes_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `grp_groupes`
--

DROP TABLE IF EXISTS `grp_groupes`;
CREATE TABLE IF NOT EXISTS `grp_groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_court` varchar(20) NOT NULL,
  `nom_complet` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `grp_groupes_admin`
--

DROP TABLE IF EXISTS `grp_groupes_admin`;
CREATE TABLE IF NOT EXISTS `grp_groupes_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grp_groupe` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `grp_groupes_groupes`
--

DROP TABLE IF EXISTS `grp_groupes_groupes`;
CREATE TABLE IF NOT EXISTS `grp_groupes_groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grp_groupe` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `horaires_etablissement`
--

DROP TABLE IF EXISTS `horaires_etablissement`;
CREATE TABLE IF NOT EXISTS `horaires_etablissement` (
  `id_horaire_etablissement` int(11) NOT NULL AUTO_INCREMENT,
  `date_horaire_etablissement` date NOT NULL,
  `jour_horaire_etablissement` varchar(15) NOT NULL,
  `ouverture_horaire_etablissement` time NOT NULL,
  `fermeture_horaire_etablissement` time NOT NULL,
  `pause_horaire_etablissement` time NOT NULL,
  `ouvert_horaire_etablissement` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_horaire_etablissement`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `horaires_etablissement`
--

INSERT INTO `horaires_etablissement` (`id_horaire_etablissement`, `date_horaire_etablissement`, `jour_horaire_etablissement`, `ouverture_horaire_etablissement`, `fermeture_horaire_etablissement`, `pause_horaire_etablissement`, `ouvert_horaire_etablissement`) VALUES
(1, '0000-00-00', 'lundi', '08:00:00', '17:30:00', '00:45:00', 1),
(2, '0000-00-00', 'mardi', '08:00:00', '17:30:00', '00:45:00', 1),
(3, '0000-00-00', 'mercredi', '08:00:00', '12:00:00', '00:00:00', 1),
(4, '0000-00-00', 'jeudi', '08:00:00', '17:30:00', '00:45:00', 1),
(5, '0000-00-00', 'vendredi', '08:00:00', '17:30:00', '00:45:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `infos_actions`
--

DROP TABLE IF EXISTS `infos_actions`;
CREATE TABLE IF NOT EXISTS `infos_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_titre` (`id`,`titre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `infos_actions`
--

INSERT INTO `infos_actions` (`id`, `titre`, `description`, `date`) VALUES
(1, 'La table ''modele_bulletin'' n''existe pas : 15/12/2015 à 13:34:31', 'Forcez une <a href=''/gepi/utilitaires/maj.php''>mise à jour de la base</a> et si cela ne suffit pas, <a href=''/gepi/bulletin/test_modele_bull.php''>testez les tables modèles de bulletins PDF</a>.', '2015-12-15 13:34:31'),
(2, 'La table ''modele_bulletin'' n''existe pas : 15/12/2015 à 14:27:39', 'Forcez une <a href=''/gepi/utilitaires/maj.php''>mise à jour de la base</a> et si cela ne suffit pas, <a href=''/gepi/bulletin/test_modele_bull.php''>testez les tables modèles de bulletins PDF</a>.', '2015-12-15 14:27:39'),
(3, 'Paramétrage csrf_mode requis', 'Vous devez effectuer un choix de paramétrage pour la protection contre les attaques CSRF&nbsp;: <a href=''gestion/security_policy.php#csrf_mode''>Paramétrage</a>', '2015-12-15 14:28:17'),
(4, 'Contrôle des index dans les documents des CDT requis', 'Il a existé un bug dans la création des fichiers index.html protégeant d''accès anormaux les documents joints aux cahiers de textes.<br />Il est recommandé de lancer une vérification de présence des index&nbsp;: <a href=''cahier_texte_admin/index.php?ajout_index_documents=y''>Contrôler</a>', '2015-12-15 14:28:17');

-- --------------------------------------------------------

--
-- Structure de la table `infos_actions_destinataires`
--

DROP TABLE IF EXISTS `infos_actions_destinataires`;
CREATE TABLE IF NOT EXISTS `infos_actions_destinataires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_info` int(11) NOT NULL,
  `nature` enum('statut','individu') DEFAULT 'individu',
  `valeur` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_info` (`id_info`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `infos_actions_destinataires`
--

INSERT INTO `infos_actions_destinataires` (`id`, `id_info`, `nature`, `valeur`) VALUES
(1, 1, 'statut', 'administrateur'),
(2, 2, 'statut', 'administrateur'),
(3, 3, 'statut', 'administrateur'),
(4, 4, 'statut', 'administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `inscription_items`
--

DROP TABLE IF EXISTS `inscription_items`;
CREATE TABLE IF NOT EXISTS `inscription_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL DEFAULT '',
  `heure` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inscription_j_login_items`
--

DROP TABLE IF EXISTS `inscription_j_login_items`;
CREATE TABLE IF NOT EXISTS `inscription_j_login_items` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aidcateg_super_gestionnaires`
--

DROP TABLE IF EXISTS `j_aidcateg_super_gestionnaires`;
CREATE TABLE IF NOT EXISTS `j_aidcateg_super_gestionnaires` (
  `indice_aid` int(11) NOT NULL,
  `id_utilisateur` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aidcateg_utilisateurs`
--

DROP TABLE IF EXISTS `j_aidcateg_utilisateurs`;
CREATE TABLE IF NOT EXISTS `j_aidcateg_utilisateurs` (
  `indice_aid` int(11) NOT NULL,
  `id_utilisateur` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aid_eleves`
--

DROP TABLE IF EXISTS `j_aid_eleves`;
CREATE TABLE IF NOT EXISTS `j_aid_eleves` (
  `id_aid` varchar(100) NOT NULL DEFAULT '',
  `login` varchar(60) NOT NULL DEFAULT '',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aid`,`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aid_eleves_resp`
--

DROP TABLE IF EXISTS `j_aid_eleves_resp`;
CREATE TABLE IF NOT EXISTS `j_aid_eleves_resp` (
  `id_aid` varchar(100) NOT NULL DEFAULT '',
  `login` varchar(60) NOT NULL DEFAULT '',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aid`,`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aid_utilisateurs`
--

DROP TABLE IF EXISTS `j_aid_utilisateurs`;
CREATE TABLE IF NOT EXISTS `j_aid_utilisateurs` (
  `id_aid` varchar(100) NOT NULL DEFAULT '',
  `id_utilisateur` varchar(50) NOT NULL DEFAULT '',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aid`,`id_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_aid_utilisateurs_gest`
--

DROP TABLE IF EXISTS `j_aid_utilisateurs_gest`;
CREATE TABLE IF NOT EXISTS `j_aid_utilisateurs_gest` (
  `id_aid` varchar(100) NOT NULL DEFAULT '',
  `id_utilisateur` varchar(50) NOT NULL DEFAULT '',
  `indice_aid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aid`,`id_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_classes`
--

DROP TABLE IF EXISTS `j_eleves_classes`;
CREATE TABLE IF NOT EXISTS `j_eleves_classes` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `rang` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`id_classe`,`periode`),
  KEY `id_classe` (`id_classe`),
  KEY `login_periode` (`login`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_classes`
--

INSERT INTO `j_eleves_classes` (`login`, `id_classe`, `periode`, `rang`) VALUES
('kelly', 1, 1, 1),
('kelly', 1, 2, 1),
('alida', 1, 8, 0),
('alida', 1, 1, 2),
('alida', 1, 2, 2),
('abena_41', 3, 3, 1),
('abena_41', 3, 2, 1),
('abena_41', 3, 1, 1),
('kelly', 1, 8, 0),
('kelly', 1, 7, 0),
('alida', 1, 7, 0),
('alexy', 2, 1, 1),
('alexy', 2, 2, 1),
('alexy', 2, 3, 1),
('tata', 2, 1, 0),
('tata', 2, 2, 0),
('tata', 2, 3, 0),
('toto', 2, 1, 0),
('toto', 2, 2, 0),
('toto', 2, 3, 0),
('abena_41', 3, 4, 0),
('abena_62', 4, 1, 0),
('abena_62', 4, 2, 0),
('abena_62', 4, 3, 0),
('tete_62', 4, 1, 0),
('tete_62', 4, 2, 0),
('tete_62', 4, 3, 0),
('celestin', 7, 1, 2),
('celestin', 7, 2, 1),
('celestin', 7, 3, 2),
('celestin', 7, 4, 2),
('celestin', 7, 5, 0),
('celestin', 7, 6, 2),
('sc_5', 7, 1, 1),
('sc_5', 7, 2, 2),
('sc_5', 7, 3, 1),
('sc_5', 7, 4, 1),
('sc_5', 7, 5, 0),
('sc_5', 7, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_cpe`
--

DROP TABLE IF EXISTS `j_eleves_cpe`;
CREATE TABLE IF NOT EXISTS `j_eleves_cpe` (
  `e_login` varchar(50) NOT NULL DEFAULT '',
  `cpe_login` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`e_login`,`cpe_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_cpe`
--

INSERT INTO `j_eleves_cpe` (`e_login`, `cpe_login`) VALUES
('abena_62', 'sg'),
('alida', 'sg'),
('celestin', 'sg'),
('kelly', 'sg'),
('sc_5', 'sg'),
('tete_62', 'sg');

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_etablissements`
--

DROP TABLE IF EXISTS `j_eleves_etablissements`;
CREATE TABLE IF NOT EXISTS `j_eleves_etablissements` (
  `id_eleve` varchar(50) NOT NULL DEFAULT '',
  `id_etablissement` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_eleve`,`id_etablissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_etablissements`
--

INSERT INTO `j_eleves_etablissements` (`id_eleve`, `id_etablissement`) VALUES
('130', 'steMoniq'),
('131', 'jeandarc'),
('150', 'jeandarc'),
('515', 'steMoniq');

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_groupes`
--

DROP TABLE IF EXISTS `j_eleves_groupes`;
CREATE TABLE IF NOT EXISTS `j_eleves_groupes` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_groupe`,`login`,`periode`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_groupes`
--

INSERT INTO `j_eleves_groupes` (`login`, `id_groupe`, `periode`) VALUES
('alida', 1, 1),
('alida', 1, 2),
('alida', 1, 7),
('alida', 1, 8),
('kelly', 1, 1),
('kelly', 1, 2),
('kelly', 1, 7),
('kelly', 1, 8),
('alida', 2, 1),
('alida', 2, 2),
('alida', 2, 7),
('alida', 2, 8),
('kelly', 2, 1),
('kelly', 2, 2),
('kelly', 2, 7),
('kelly', 2, 8),
('alida', 3, 1),
('alida', 3, 2),
('alida', 3, 7),
('alida', 3, 8),
('kelly', 3, 1),
('kelly', 3, 2),
('kelly', 3, 7),
('kelly', 3, 8),
('alexy', 4, 1),
('alexy', 4, 2),
('alexy', 4, 3),
('tata', 4, 1),
('tata', 4, 2),
('tata', 4, 3),
('toto', 4, 1),
('toto', 4, 2),
('toto', 4, 3),
('alexy', 5, 1),
('alexy', 5, 2),
('alexy', 5, 3),
('tata', 5, 1),
('tata', 5, 2),
('tata', 5, 3),
('toto', 5, 1),
('toto', 5, 2),
('toto', 5, 3),
('abena_41', 6, 1),
('abena_41', 6, 2),
('abena_41', 6, 3),
('abena_41', 6, 4),
('abena_62', 7, 1),
('abena_62', 7, 2),
('abena_62', 7, 3),
('tete_62', 7, 1),
('tete_62', 7, 2),
('tete_62', 7, 3),
('celestin', 8, 1),
('celestin', 8, 2),
('celestin', 8, 3),
('celestin', 8, 4),
('celestin', 8, 5),
('celestin', 8, 6),
('sc_5', 8, 1),
('sc_5', 8, 2),
('sc_5', 8, 3),
('sc_5', 8, 4),
('sc_5', 8, 5),
('sc_5', 8, 6),
('celestin', 9, 1),
('celestin', 9, 2),
('celestin', 9, 3),
('celestin', 9, 4),
('celestin', 9, 5),
('celestin', 9, 6),
('sc_5', 9, 1),
('sc_5', 9, 2),
('sc_5', 9, 3),
('sc_5', 9, 4),
('sc_5', 9, 5),
('sc_5', 9, 6);

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_groupes_delestage`
--

DROP TABLE IF EXISTS `j_eleves_groupes_delestage`;
CREATE TABLE IF NOT EXISTS `j_eleves_groupes_delestage` (
  `login` varchar(50) DEFAULT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_groupes_delestage2`
--

DROP TABLE IF EXISTS `j_eleves_groupes_delestage2`;
CREATE TABLE IF NOT EXISTS `j_eleves_groupes_delestage2` (
  `login` varchar(50) DEFAULT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_professeurs`
--

DROP TABLE IF EXISTS `j_eleves_professeurs`;
CREATE TABLE IF NOT EXISTS `j_eleves_professeurs` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `professeur` varchar(50) NOT NULL DEFAULT '',
  `id_classe` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`professeur`,`id_classe`),
  KEY `classe_professeur` (`id_classe`,`professeur`),
  KEY `professeur_classe` (`professeur`,`id_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_professeurs`
--

INSERT INTO `j_eleves_professeurs` (`login`, `professeur`, `id_classe`) VALUES
('abena_62', 'nono', 4),
('celestin', 'adonia', 7),
('sc_5', 'adonia', 7),
('tete_62', 'nono', 4);

-- --------------------------------------------------------

--
-- Structure de la table `j_eleves_regime`
--

DROP TABLE IF EXISTS `j_eleves_regime`;
CREATE TABLE IF NOT EXISTS `j_eleves_regime` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `doublant` char(1) NOT NULL DEFAULT '',
  `regime` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_eleves_regime`
--

INSERT INTO `j_eleves_regime` (`login`, `doublant`, `regime`) VALUES
('alida', '-', 'd/p'),
('kelly', '-', 'd/p'),
('alexy', '-', 'ext.'),
('toto', '-', 'd/p'),
('tata', '-', 'd/p'),
('abena_41', '-', 'd/p'),
('abena_62', '-', 'd/p'),
('tete_62', '-', 'd/p'),
('celestin', '-', 'd/p'),
('sc_5', '-', 'd/p');

-- --------------------------------------------------------

--
-- Structure de la table `j_groupes_classes`
--

DROP TABLE IF EXISTS `j_groupes_classes`;
CREATE TABLE IF NOT EXISTS `j_groupes_classes` (
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `priorite` smallint(6) NOT NULL,
  `coef` decimal(3,1) NOT NULL,
  `categorie_id` int(11) NOT NULL DEFAULT '1',
  `saisie_ects` tinyint(1) NOT NULL DEFAULT '0',
  `valeur_ects` int(11) DEFAULT NULL,
  `mode_moy` enum('-','sup10','bonus') NOT NULL DEFAULT '-',
  `apb_langue_vivante` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_groupe`,`id_classe`),
  KEY `id_classe_coef` (`id_classe`,`coef`),
  KEY `saisie_ects_id_groupe` (`saisie_ects`,`id_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_groupes_classes`
--

INSERT INTO `j_groupes_classes` (`id_groupe`, `id_classe`, `priorite`, `coef`, `categorie_id`, `saisie_ects`, `valeur_ects`, `mode_moy`, `apb_langue_vivante`) VALUES
(1, 1, 0, '2.0', 1, 0, 0, '-', ''),
(2, 1, 12, '3.0', 3, 0, 0, '-', ''),
(3, 1, 11, '1.0', 3, 0, 0, '-', ''),
(4, 2, 0, '2.0', 3, 0, 0, '-', ''),
(5, 2, 0, '1.0', 1, 0, 0, '-', ''),
(6, 3, 0, '2.0', 1, 0, NULL, '-', ''),
(7, 4, 16, '2.0', 1, 0, 0, '-', ''),
(8, 7, 16, '3.0', 1, 0, 0, '-', ''),
(9, 7, 12, '2.0', 2, 0, 0, '-', '');

-- --------------------------------------------------------

--
-- Structure de la table `j_groupes_matieres`
--

DROP TABLE IF EXISTS `j_groupes_matieres`;
CREATE TABLE IF NOT EXISTS `j_groupes_matieres` (
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `id_matiere` varchar(255) NOT NULL,
  PRIMARY KEY (`id_groupe`,`id_matiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_groupes_matieres`
--

INSERT INTO `j_groupes_matieres` (`id_groupe`, `id_matiere`) VALUES
(1, 'Histoire'),
(2, 'Math'),
(3, 'PHYSIQUE'),
(4, 'INF'),
(5, 'Histoire'),
(6, 'Histoire'),
(7, 'allemand1'),
(8, 'allemand1'),
(9, 'EPS');

-- --------------------------------------------------------

--
-- Structure de la table `j_groupes_professeurs`
--

DROP TABLE IF EXISTS `j_groupes_professeurs`;
CREATE TABLE IF NOT EXISTS `j_groupes_professeurs` (
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `login` varchar(50) NOT NULL DEFAULT '',
  `ordre_prof` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_groupe`,`login`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_groupes_professeurs`
--

INSERT INTO `j_groupes_professeurs` (`id_groupe`, `login`, `ordre_prof`) VALUES
(1, 'histoire', 0),
(2, 'math', 0),
(3, 'physique', 0),
(4, 'adonia', 0),
(5, 'histoire', 0),
(6, 'histoire', 0),
(7, 'nono', 0),
(8, 'nono', 0),
(9, 'adonia', 0);

-- --------------------------------------------------------

--
-- Structure de la table `j_groupes_visibilite`
--

DROP TABLE IF EXISTS `j_groupes_visibilite`;
CREATE TABLE IF NOT EXISTS `j_groupes_visibilite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `domaine` varchar(255) NOT NULL DEFAULT '',
  `visible` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_groupe_domaine` (`id_groupe`,`domaine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `j_matieres_categories_classes`
--

DROP TABLE IF EXISTS `j_matieres_categories_classes`;
CREATE TABLE IF NOT EXISTS `j_matieres_categories_classes` (
  `categorie_id` int(11) NOT NULL DEFAULT '0',
  `classe_id` int(11) NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '0',
  `affiche_moyenne` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categorie_id`,`classe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_matieres_categories_classes`
--

INSERT INTO `j_matieres_categories_classes` (`categorie_id`, `classe_id`, `priority`, `affiche_moyenne`) VALUES
(1, 1, 5, 1),
(2, 1, 2, 1),
(3, 1, 6, 1),
(1, 2, 10, 1),
(2, 2, 2, 1),
(3, 2, 6, 1),
(1, 3, 10, 1),
(2, 3, 2, 1),
(3, 3, 6, 1),
(1, 4, 10, 1),
(2, 4, 2, 1),
(3, 4, 6, 1),
(1, 5, 10, 0),
(2, 5, 2, 0),
(3, 5, 6, 0),
(1, 6, 10, 1),
(2, 6, 2, 1),
(3, 6, 6, 1),
(1, 7, 10, 1),
(2, 7, 2, 1),
(3, 7, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `j_mentions_classes`
--

DROP TABLE IF EXISTS `j_mentions_classes`;
CREATE TABLE IF NOT EXISTS `j_mentions_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mention` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `ordre` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `j_notifications_resp_pers`
--

DROP TABLE IF EXISTS `j_notifications_resp_pers`;
CREATE TABLE IF NOT EXISTS `j_notifications_resp_pers` (
  `a_notification_id` int(12) NOT NULL COMMENT 'cle etrangere de la notification',
  `pers_id` varchar(10) NOT NULL COMMENT 'cle etrangere des personnes',
  PRIMARY KEY (`a_notification_id`,`pers_id`),
  KEY `j_notifications_resp_pers_FI_2` (`pers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table de jointure entre la notification et les personnes dont on va mettre le nom dans le message.';

-- --------------------------------------------------------

--
-- Structure de la table `j_professeurs_matieres`
--

DROP TABLE IF EXISTS `j_professeurs_matieres`;
CREATE TABLE IF NOT EXISTS `j_professeurs_matieres` (
  `id_professeur` varchar(50) NOT NULL DEFAULT '',
  `id_matiere` varchar(50) NOT NULL DEFAULT '',
  `ordre_matieres` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_professeur`,`id_matiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_professeurs_matieres`
--

INSERT INTO `j_professeurs_matieres` (`id_professeur`, `id_matiere`, `ordre_matieres`) VALUES
('math', 'Math', 1),
('histoire', 'Histoire', 0),
('physique', 'PHYSIQUE', 1),
('adonia', 'INF', 1),
('nono', 'allemand1', 0),
('kamga', 'esf', 1),
('adonia', 'EPS', 1),
('eloundou', 'esp', 1);

-- --------------------------------------------------------

--
-- Structure de la table `j_scol_classes`
--

DROP TABLE IF EXISTS `j_scol_classes`;
CREATE TABLE IF NOT EXISTS `j_scol_classes` (
  `login` varchar(50) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `j_scol_classes`
--

INSERT INTO `j_scol_classes` (`login`, `id_classe`) VALUES
('scolar', 1),
('scolar', 2),
('scolar', 3),
('scolar', 4),
('scolar', 5),
('scolar', 6),
('scolar', 7);

-- --------------------------------------------------------

--
-- Structure de la table `j_signalement`
--

DROP TABLE IF EXISTS `j_signalement`;
CREATE TABLE IF NOT EXISTS `j_signalement` (
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `login` varchar(50) NOT NULL DEFAULT '',
  `periode` int(11) NOT NULL DEFAULT '0',
  `nature` varchar(50) NOT NULL DEFAULT '',
  `valeur` varchar(50) NOT NULL DEFAULT '',
  `declarant` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_groupe`,`login`,`periode`,`nature`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `j_traitements_saisies`
--

DROP TABLE IF EXISTS `j_traitements_saisies`;
CREATE TABLE IF NOT EXISTS `j_traitements_saisies` (
  `a_saisie_id` int(12) NOT NULL COMMENT 'cle etrangere de l''absence saisie',
  `a_traitement_id` int(12) NOT NULL COMMENT 'cle etrangere du traitement de ces absences',
  PRIMARY KEY (`a_saisie_id`,`a_traitement_id`),
  KEY `j_traitements_saisies_FI_2` (`a_traitement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table de jointure entre la saisie et le traitement des absences';

-- --------------------------------------------------------

--
-- Structure de la table `ldap_bx`
--

DROP TABLE IF EXISTS `ldap_bx`;
CREATE TABLE IF NOT EXISTS `ldap_bx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_u` varchar(200) NOT NULL,
  `nom_u` varchar(200) NOT NULL,
  `prenom_u` varchar(200) NOT NULL,
  `statut_u` varchar(50) NOT NULL,
  `identite_u` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lettres_cadres`
--

DROP TABLE IF EXISTS `lettres_cadres`;
CREATE TABLE IF NOT EXISTS `lettres_cadres` (
  `id_lettre_cadre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_lettre_cadre` varchar(150) NOT NULL,
  `x_lettre_cadre` float NOT NULL,
  `y_lettre_cadre` float NOT NULL,
  `l_lettre_cadre` float NOT NULL,
  `h_lettre_cadre` float NOT NULL,
  `texte_lettre_cadre` text NOT NULL,
  `encadre_lettre_cadre` tinyint(4) NOT NULL,
  `couleurdefond_lettre_cadre` varchar(11) NOT NULL,
  PRIMARY KEY (`id_lettre_cadre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `lettres_cadres`
--

INSERT INTO `lettres_cadres` (`id_lettre_cadre`, `nom_lettre_cadre`, `x_lettre_cadre`, `y_lettre_cadre`, `l_lettre_cadre`, `h_lettre_cadre`, `texte_lettre_cadre`, `encadre_lettre_cadre`, `couleurdefond_lettre_cadre`) VALUES
(1, 'adresse responsable', 100, 40, 100, 5, 'A l''attention de\r\n<civilitee_court_responsable> <nom_responsable> <prenom_responsable>\r\n<adresse_responsable>\r\n<cp_responsable> <commune_responsable>\r\n', 0, '||'),
(2, 'adresse etablissement', 0, 0, 0, 0, '', 0, ''),
(3, 'datation', 0, 0, 0, 0, '', 0, ''),
(4, 'corp avertissement', 10, 70, 0, 5, '<u>Objet: </u> <g>Avertissement</g>\r\n\r\n\r\n<nom_civilitee_long>,\r\n\r\nJe me vois dans l''obligation de donner un <b>AVERTISSEMENT</b>\r\n\r\nà <g><nom_eleve> <prenom_eleve></g> élève de la classe <g><classe_eleve></g>.\r\n\r\n\r\npour la raison suivante : <g><sujet_eleve></g>\r\n\r\n<remarque_eleve>\r\n\r\n\r\n\r\nComme le prévoit le règlement intérieur de l''établissement, il pourra être sanctionné à partir de ce jour.\r\nSanction(s) possible(s) :\r\n\r\n\r\n\r\n\r\nJe vous remercie de me renvoyer cet exemplaire après l''avoir daté et signé.\r\nVeuillez agréer <nom_civilitee_long> <nom_responsable> l''assurance de ma considération distinguée.\r\n\r\n\r\n\r\nDate et signatures des parents :	', 0, '||'),
(5, 'corp blame', 10, 70, 0, 5, '<u>Objet</u>: <g>Blâme</g>\r\n\r\n\r\n<nom_civilitee_long>\r\n\r\nJe me vois dans l''obligation de donner un BLAME \r\n\r\nà <g><nom_eleve> <prenom_eleve></g> élève de la classe <g><classe_eleve></g>.\r\n\r\nDemandé par: <g><courrier_demande_par></g>\r\n\r\npour la raison suivante: <g><raison></g>\r\n\r\n<remarque>\r\n\r\nJe vous remercie de me renvoyer cet exemplaire après l''avoir daté et signé.\r\nVeuillez agréer <g><nom_civilitee_long> <nom_responsable></g> l''assurance de ma considération distinguée.\r\n\r\n<u>Date et signatures des parents:</u>\r\n\r\n\r\n\r\n\r\n\r\nNous demandons un entretien avec la personne ayant demandé la sanction OUI / NON.\r\n(La prise de rendez-vous est à votre initiative)\r\n', 0, '||'),
(6, 'corp convocation parents', 10, 70, 0, 5, '<u>Objet</u>: <g>Convocation des parents</g>\r\n\r\n\r\n<nom_civilitee_long>,\r\n\r\nVous êtes prié de prendre contact avec le Conseiller Principal d''Education dans les plus brefs délais, au sujet de <g><nom_eleve> <prenom_eleve></g> inscrit en classe de <g><classe_eleve></g>.\r\n\r\npour le motif suivant:\r\n\r\n<remarque>\r\n\r\n\r\n\r\nSans nouvelle de votre part avant le ........................................., je serai dans l''obligation de procéder à la descolarisation de l''élève, avec les conséquences qui en résulteront, jusqu''à votre rencontre.\r\n\r\n\r\nVeuillez agréer <g><nom_civilitee_long> <nom_responsable></g> l''assurance de ma considération distinguée.', 0, '||'),
(7, 'corp exclusion', 10, 70, 0, 5, '<u>Objet: </u> <g>Sanction - Exclusion de l''établissement</g>\r\n\r\n\r\n<nom_civilitee_long>,\r\n\r\nPar la présente, je tiens à vous signaler que <nom_eleve>\r\n\r\ninscrit en classe de  <classe_eleve>\r\n\r\n\r\ns''étant rendu coupable des faits suivants : \r\n\r\n<remarque>\r\n\r\n\r\n\r\nEst exclu de l''établissement,\r\nà compter du: <b><date_debut></b> à <b><heure_debut></b>,\r\njusqu''au: <b><date_fin></b> à <b><heure_fin></b>.\r\n\r\n\r\nIl devra se présenter, au bureau de la Vie Scolaire \r\n\r\nle ....................................... à ....................................... ACCOMPAGNE DE SES PARENTS.\r\n\r\n\r\n\r\n\r\nVeuillez agréer &lt;TYPEPARENT&gt; &lt;NOMPARENT&gt; l''assurance de ma considération distinguée.', 0, '||'),
(8, 'corp demande justificatif absence', 10, 70, 0, 5, '<u>Objet: </u> <g>Demande de justificatif d''absence</g>\n\n<civilitee_long_responsable>,\n\nJ''ai le regret de vous informer que <b><nom_eleve> <prenom_eleve></b>, élève en classe de <b><classe_eleve></b> n''a pas assisté au(x) cours:\n\n<liste>\n\nJe vous prie de bien vouloir me faire connaître le motif de son absence.\n\nPour permettre un contrôle efficace des présences, toute absence d''un élève doit être justifiée par sa famille, le jour même soit par téléphone, soit par écrit, soit par fax.\n\nAvant de regagner les cours, l''élève absent devra se présenter au bureau du Conseiller Principal d''Education muni de son carnet de correspondance avec un justificatif signé des parents.\n\nVeuillez agréer <civilitee_long_responsable> <nom_responsable>, l''assurance de ma considération distinguée.\n                                               \nCPE\n<civilitee_long_cpe> <nom_cpe> <prenom_cpe>\n\nPrière de renvoyer, par retour du courrier, le présent avis signé des parents :\n\nMotif de l''absence : ________________________________________________________________________________\n\n____________________________________________________________________________________________________\n\n____________________________________________________________________________________________________\n\n____________________________________________________________________________________________________\n\nDate et signatures des parents :  \n', 0, '||'),
(10, 'signature', 100, 180, 0, 5, '<b><courrier_signe_par_fonction></b>,\r\n<courrier_signe_par>\r\n', 0, '||');

-- --------------------------------------------------------

--
-- Structure de la table `lettres_suivis`
--

DROP TABLE IF EXISTS `lettres_suivis`;
CREATE TABLE IF NOT EXISTS `lettres_suivis` (
  `id_lettre_suivi` int(11) NOT NULL AUTO_INCREMENT,
  `lettresuitealettren_lettre_suivi` int(11) NOT NULL,
  `quirecois_lettre_suivi` varchar(50) NOT NULL,
  `partde_lettre_suivi` varchar(200) NOT NULL,
  `partdenum_lettre_suivi` text NOT NULL,
  `quiemet_lettre_suivi` varchar(150) NOT NULL,
  `emis_date_lettre_suivi` date NOT NULL,
  `emis_heure_lettre_suivi` time NOT NULL,
  `quienvoi_lettre_suivi` varchar(150) NOT NULL,
  `envoye_date_lettre_suivi` date NOT NULL,
  `envoye_heure_lettre_suivi` time NOT NULL,
  `type_lettre_suivi` int(11) NOT NULL,
  `quireception_lettre_suivi` varchar(150) NOT NULL,
  `reponse_date_lettre_suivi` date NOT NULL,
  `reponse_remarque_lettre_suivi` varchar(250) NOT NULL,
  `statu_lettre_suivi` varchar(20) NOT NULL,
  PRIMARY KEY (`id_lettre_suivi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `lettres_suivis`
--

INSERT INTO `lettres_suivis` (`id_lettre_suivi`, `lettresuitealettren_lettre_suivi`, `quirecois_lettre_suivi`, `partde_lettre_suivi`, `partdenum_lettre_suivi`, `quiemet_lettre_suivi`, `emis_date_lettre_suivi`, `emis_heure_lettre_suivi`, `quienvoi_lettre_suivi`, `envoye_date_lettre_suivi`, `envoye_heure_lettre_suivi`, `type_lettre_suivi`, `quireception_lettre_suivi`, `reponse_date_lettre_suivi`, `reponse_remarque_lettre_suivi`, `statu_lettre_suivi`) VALUES
(1, 0, 'alexy', 'absences_eleves', ',1,', 'adonia', '2015-12-22', '05:07:50', '', '0000-00-00', '00:00:00', 6, '', '0000-00-00', '', 'en attente'),
(2, 0, 'tata', 'absences_eleves', ',2,', 'adonia', '2015-12-22', '05:07:50', '', '0000-00-00', '00:00:00', 6, '', '0000-00-00', '', 'en attente'),
(3, 0, 'kelly', 'absences_eleves', ',3,', 'math', '2015-12-22', '05:18:55', '', '0000-00-00', '00:00:00', 6, '', '0000-00-00', '', 'en attente');

-- --------------------------------------------------------

--
-- Structure de la table `lettres_tcs`
--

DROP TABLE IF EXISTS `lettres_tcs`;
CREATE TABLE IF NOT EXISTS `lettres_tcs` (
  `id_lettre_tc` int(11) NOT NULL AUTO_INCREMENT,
  `type_lettre_tc` int(11) NOT NULL,
  `cadre_lettre_tc` int(11) NOT NULL,
  `x_lettre_tc` float NOT NULL,
  `y_lettre_tc` float NOT NULL,
  `l_lettre_tc` float NOT NULL,
  `h_lettre_tc` float NOT NULL,
  `encadre_lettre_tc` int(1) NOT NULL,
  PRIMARY KEY (`id_lettre_tc`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

--
-- Contenu de la table `lettres_tcs`
--

INSERT INTO `lettres_tcs` (`id_lettre_tc`, `type_lettre_tc`, `cadre_lettre_tc`, `x_lettre_tc`, `y_lettre_tc`, `l_lettre_tc`, `h_lettre_tc`, `encadre_lettre_tc`) VALUES
(1, 3, 0, 0, 0, 0, 0, 0),
(2, 3, 0, 0, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0, 0, 0),
(4, 3, 0, 0, 0, 0, 0, 0),
(5, 3, 0, 0, 0, 0, 0, 0),
(6, 3, 0, 0, 0, 0, 0, 0),
(7, 3, 0, 0, 0, 0, 0, 0),
(8, 3, 0, 0, 0, 0, 0, 0),
(9, 3, 0, 0, 0, 0, 0, 0),
(10, 3, 0, 0, 0, 0, 0, 0),
(11, 3, 0, 0, 0, 0, 0, 0),
(12, 3, 0, 0, 0, 0, 0, 0),
(13, 3, 0, 0, 0, 0, 0, 0),
(14, 3, 0, 0, 0, 0, 0, 0),
(15, 3, 0, 0, 0, 0, 0, 0),
(16, 3, 0, 0, 0, 0, 0, 0),
(17, 3, 0, 0, 0, 0, 0, 0),
(18, 3, 0, 0, 0, 0, 0, 0),
(19, 3, 0, 0, 0, 0, 0, 0),
(20, 3, 0, 0, 0, 0, 0, 0),
(21, 3, 0, 0, 0, 0, 0, 0),
(22, 3, 0, 0, 0, 0, 0, 0),
(23, 3, 0, 0, 0, 0, 0, 0),
(24, 3, 0, 0, 0, 0, 0, 0),
(25, 3, 0, 0, 0, 0, 0, 0),
(26, 3, 0, 0, 0, 0, 0, 0),
(27, 3, 0, 0, 0, 0, 0, 0),
(28, 3, 0, 0, 0, 0, 0, 0),
(29, 3, 0, 0, 0, 0, 0, 0),
(30, 3, 0, 0, 0, 0, 0, 0),
(31, 3, 0, 0, 0, 0, 0, 0),
(32, 3, 0, 0, 0, 0, 0, 0),
(33, 3, 0, 0, 0, 0, 0, 0),
(34, 3, 0, 0, 0, 0, 0, 0),
(35, 3, 0, 0, 0, 0, 0, 0),
(36, 3, 0, 0, 0, 0, 0, 0),
(37, 3, 0, 0, 0, 0, 0, 0),
(38, 3, 0, 0, 0, 0, 0, 0),
(39, 3, 0, 0, 0, 0, 0, 0),
(40, 3, 0, 0, 0, 0, 0, 0),
(41, 3, 0, 0, 0, 0, 0, 0),
(42, 3, 0, 0, 0, 0, 0, 0),
(43, 3, 0, 0, 0, 0, 0, 0),
(44, 3, 0, 0, 0, 0, 0, 0),
(45, 3, 0, 0, 0, 0, 0, 0),
(46, 3, 0, 0, 0, 0, 0, 0),
(47, 3, 0, 0, 0, 0, 0, 0),
(48, 3, 0, 0, 0, 0, 0, 0),
(49, 3, 0, 0, 0, 0, 0, 0),
(50, 3, 0, 0, 0, 0, 0, 0),
(51, 3, 0, 0, 0, 0, 0, 0),
(52, 3, 0, 0, 0, 0, 0, 0),
(53, 3, 0, 0, 0, 0, 0, 0),
(56, 3, 1, 100, 40, 100, 5, 0),
(57, 3, 4, 10, 70, 190, 15, 0),
(58, 1, 0, 0, 0, 0, 0, 0),
(59, 1, 0, 0, 0, 0, 0, 0),
(60, 1, 0, 0, 0, 0, 0, 0),
(61, 1, 0, 0, 0, 0, 0, 0),
(62, 1, 0, 0, 0, 0, 0, 0),
(63, 1, 0, 0, 0, 0, 0, 0),
(64, 1, 0, 0, 0, 0, 0, 0),
(65, 1, 1, 100, 40, 100, 5, 0),
(66, 1, 5, 10, 70, 190, 15, 0),
(68, 2, 1, 100, 40, 100, 5, 0),
(69, 2, 6, 10, 70, 190, 10, 0),
(70, 4, 1, 100, 40, 100, 5, 0),
(71, 4, 7, 10, 70, 190, 15, 0),
(72, 6, 0, 0, 0, 0, 0, 0),
(73, 6, 0, 0, 0, 0, 0, 0),
(74, 6, 0, 0, 0, 0, 0, 0),
(75, 6, 0, 0, 0, 0, 0, 0),
(76, 6, 0, 0, 0, 0, 0, 0),
(77, 6, 0, 0, 0, 0, 0, 0),
(78, 6, 0, 0, 0, 0, 0, 0),
(79, 6, 0, 0, 0, 0, 0, 0),
(80, 6, 0, 0, 0, 0, 0, 0),
(81, 6, 0, 0, 0, 0, 0, 0),
(82, 6, 0, 0, 0, 0, 0, 0),
(83, 6, 0, 0, 0, 0, 0, 0),
(84, 6, 0, 0, 0, 0, 0, 0),
(85, 6, 0, 0, 0, 0, 0, 0),
(86, 6, 0, 0, 0, 0, 0, 0),
(87, 6, 0, 0, 0, 0, 0, 0),
(88, 6, 0, 0, 0, 0, 0, 0),
(89, 6, 1, 100, 40, 100, 5, 0),
(90, 6, 8, 10, 70, 190, 20, 0),
(91, 7, 0, 0, 0, 0, 0, 0),
(92, 7, 0, 0, 0, 0, 0, 0),
(93, 7, 0, 0, 0, 0, 0, 0),
(94, 7, 0, 0, 0, 0, 0, 0),
(95, 7, 0, 0, 0, 0, 0, 0),
(96, 7, 0, 0, 0, 0, 0, 0),
(97, 7, 0, 0, 0, 0, 0, 0),
(98, 7, 0, 0, 0, 0, 0, 0),
(99, 7, 0, 0, 0, 0, 0, 0),
(100, 7, 0, 0, 0, 0, 0, 0),
(101, 7, 0, 0, 0, 0, 0, 0),
(102, 7, 0, 0, 0, 0, 0, 0),
(103, 7, 0, 0, 0, 0, 0, 0),
(104, 7, 0, 0, 0, 0, 0, 0),
(105, 7, 0, 0, 0, 0, 0, 0),
(106, 7, 0, 0, 0, 0, 0, 0),
(107, 7, 0, 0, 0, 0, 0, 0),
(108, 7, 0, 0, 0, 0, 0, 0),
(109, 7, 0, 0, 0, 0, 0, 0),
(110, 7, 0, 0, 0, 0, 0, 0),
(111, 1, 0, 0, 0, 0, 0, 0),
(112, 1, 0, 0, 0, 0, 0, 0),
(113, 1, 0, 0, 0, 0, 0, 0),
(114, 1, 0, 0, 0, 0, 0, 0),
(115, 1, 0, 0, 0, 0, 0, 0),
(116, 1, 0, 0, 0, 0, 0, 0),
(117, 1, 0, 0, 0, 0, 0, 0),
(118, 1, 0, 0, 0, 0, 0, 0),
(119, 1, 0, 0, 0, 0, 0, 0),
(120, 1, 0, 0, 0, 0, 0, 0),
(121, 1, 0, 0, 0, 0, 0, 0),
(122, 1, 0, 0, 0, 0, 0, 0),
(123, 1, 0, 0, 0, 0, 0, 0),
(124, 1, 0, 0, 0, 0, 0, 0),
(125, 1, 0, 0, 0, 0, 0, 0),
(126, 1, 0, 0, 0, 0, 0, 0),
(127, 1, 0, 0, 0, 0, 0, 0),
(128, 1, 0, 0, 0, 0, 0, 0),
(129, 1, 0, 0, 0, 0, 0, 0),
(130, 1, 0, 0, 0, 0, 0, 0),
(131, 2, 10, 100, 180, 190, 5, 0),
(132, 6, 0, 0, 0, 0, 0, 0),
(133, 6, 0, 0, 0, 0, 0, 0),
(134, 6, 0, 0, 0, 0, 0, 0),
(135, 6, 0, 0, 0, 0, 0, 0),
(136, 6, 0, 0, 0, 0, 0, 0),
(137, 6, 0, 0, 0, 0, 0, 0),
(138, 6, 0, 0, 0, 0, 0, 0),
(139, 6, 0, 0, 0, 0, 0, 0),
(140, 6, 0, 0, 0, 0, 0, 0),
(141, 6, 0, 0, 0, 0, 0, 0),
(142, 6, 0, 0, 0, 0, 0, 0),
(143, 6, 0, 0, 0, 0, 0, 0),
(144, 6, 0, 0, 0, 0, 0, 0),
(145, 6, 0, 0, 0, 0, 0, 0),
(146, 6, 0, 0, 0, 0, 0, 0),
(147, 6, 0, 0, 0, 0, 0, 0),
(148, 6, 0, 0, 0, 0, 0, 0),
(149, 6, 0, 0, 0, 0, 0, 0),
(150, 6, 0, 0, 0, 0, 0, 0),
(151, 6, 0, 0, 0, 0, 0, 0),
(152, 6, 0, 0, 0, 0, 0, 0),
(153, 6, 0, 0, 0, 0, 0, 0),
(154, 6, 0, 0, 0, 0, 0, 0),
(155, 6, 0, 0, 0, 0, 0, 0),
(156, 6, 0, 0, 0, 0, 0, 0),
(157, 6, 0, 0, 0, 0, 0, 0),
(158, 6, 0, 0, 0, 0, 0, 0),
(159, 6, 0, 0, 0, 0, 0, 0),
(160, 6, 0, 0, 0, 0, 0, 0),
(161, 6, 0, 0, 0, 0, 0, 0),
(162, 6, 0, 0, 0, 0, 0, 0),
(163, 6, 0, 0, 0, 0, 0, 0),
(164, 6, 0, 0, 0, 0, 0, 0),
(165, 6, 0, 0, 0, 0, 0, 0),
(166, 6, 0, 0, 0, 0, 0, 0),
(167, 6, 0, 0, 0, 0, 0, 0),
(168, 6, 0, 0, 0, 0, 0, 0),
(169, 6, 0, 0, 0, 0, 0, 0),
(170, 6, 0, 0, 0, 0, 0, 0),
(171, 6, 0, 0, 0, 0, 0, 0),
(172, 6, 0, 0, 0, 0, 0, 0),
(173, 6, 0, 0, 0, 0, 0, 0),
(174, 6, 0, 0, 0, 0, 0, 0),
(175, 6, 0, 0, 0, 0, 0, 0),
(176, 6, 0, 0, 0, 0, 0, 0),
(177, 6, 0, 0, 0, 0, 0, 0),
(178, 6, 0, 0, 0, 0, 0, 0),
(179, 6, 0, 0, 0, 0, 0, 0),
(180, 6, 0, 0, 0, 0, 0, 0),
(181, 6, 0, 0, 0, 0, 0, 0),
(182, 6, 0, 0, 0, 0, 0, 0),
(183, 6, 0, 0, 0, 0, 0, 0),
(184, 6, 0, 0, 0, 0, 0, 0),
(185, 6, 0, 0, 0, 0, 0, 0),
(186, 6, 0, 0, 0, 0, 0, 0),
(187, 6, 0, 0, 0, 0, 0, 0),
(188, 6, 0, 0, 0, 0, 0, 0),
(189, 6, 0, 0, 0, 0, 0, 0),
(190, 6, 0, 0, 0, 0, 0, 0),
(191, 6, 0, 0, 0, 0, 0, 0),
(192, 6, 0, 0, 0, 0, 0, 0),
(193, 6, 0, 0, 0, 0, 0, 0),
(194, 6, 0, 0, 0, 0, 0, 0),
(195, 6, 0, 0, 0, 0, 0, 0),
(196, 6, 0, 0, 0, 0, 0, 0),
(197, 6, 0, 0, 0, 0, 0, 0),
(198, 6, 0, 0, 0, 0, 0, 0),
(199, 6, 0, 0, 0, 0, 0, 0),
(200, 6, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `lettres_types`
--

DROP TABLE IF EXISTS `lettres_types`;
CREATE TABLE IF NOT EXISTS `lettres_types` (
  `id_lettre_type` int(11) NOT NULL AUTO_INCREMENT,
  `titre_lettre_type` varchar(250) NOT NULL,
  `categorie_lettre_type` varchar(250) NOT NULL,
  `reponse_lettre_type` varchar(3) NOT NULL,
  PRIMARY KEY (`id_lettre_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `lettres_types`
--

INSERT INTO `lettres_types` (`id_lettre_type`, `titre_lettre_type`, `categorie_lettre_type`, `reponse_lettre_type`) VALUES
(1, 'blame', 'sanction', ''),
(2, 'convocation des parents', 'suivi', ''),
(3, 'avertissement', 'sanction', ''),
(4, 'exclusion', 'sanction', ''),
(5, 'certificat de scolarité', 'suivi', ''),
(6, 'demande de justificatif d''absence', 'suivi', 'oui'),
(7, 'demande de justificatif de retard', 'suivi', ''),
(8, 'rapport d''incident', 'sanction', ''),
(9, 'regime de sortie', 'suivi', ''),
(10, 'retenue', 'sanction', '');

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `LOGIN` varchar(50) NOT NULL DEFAULT '',
  `START` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SESSION_ID` varchar(255) NOT NULL,
  `REMOTE_ADDR` varchar(16) NOT NULL DEFAULT '',
  `USER_AGENT` varchar(255) NOT NULL,
  `REFERER` varchar(64) NOT NULL DEFAULT '',
  `AUTOCLOSE` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `END` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`SESSION_ID`,`START`),
  KEY `start_time` (`START`),
  KEY `end_time` (`END`),
  KEY `login_session_start` (`LOGIN`,`SESSION_ID`,`START`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `log`
--

INSERT INTO `log` (`LOGIN`, `START`, `SESSION_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REFERER`, `AUTOCLOSE`, `END`) VALUES
('ADMIN', '2015-12-15 09:58:20', 'l21p0vhdufid7rkr4a52es5ks3', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '', '2015-12-15 10:13:13'),
('admim', '2015-12-15 10:13:13', '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost:81/gepi/', '4', '2015-12-15 10:13:13'),
('admin', '2015-12-15 10:16:04', '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost:81/gepi/login.php', '4', '2015-12-15 10:16:04'),
('ADMIN', '2015-12-15 10:19:48', 'uapi91g3bqbsgn1vao01aa5mf6', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-15 11:03:12'),
('ADMIN', '2015-12-15 11:24:12', '52tcb386oaajl484qdglngid66', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-15 12:25:39'),
('ADMIN', '2015-12-15 12:33:32', 'tlb9gfi2eumar85h8m9k78cr47', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 13:27:44'),
('scolar', '2015-12-15 13:27:57', 'lo0ggiado8tatnrkut6q1cea84', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 13:35:09'),
('histoire', '2015-12-15 13:35:25', 'm35pfk8piccir38060he432tc6', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:11:10'),
('math', '2015-12-15 14:11:28', '6vosbrl5jjtjfss17buuomh917', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:19:26'),
('scolar', '2015-12-15 14:19:45', 'knt1f1gt1c5s1t7k6si40cjlo1', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:24:33'),
('ADMIN', '2015-12-15 14:24:45', 'ggordqnht9aus8vdqabie7d4b2', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:30:14'),
('scolar', '2015-12-15 14:30:34', 'm8rk2kcsoh3st5paegeo5p2b00', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:44:50'),
('histoire', '2015-12-15 14:45:04', 'mevdmgnhf51f8c081ioq7i3ur2', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:45:44'),
('scolar', '2015-12-15 14:45:49', '96debb3ovn7g0v8tklq9u2bho2', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:54:46'),
('histoire', '2015-12-15 14:54:58', '45j4nj40nhivaugp8j1gfg9s31', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:55:58'),
('scolar', '2015-12-15 14:56:07', 'todq3eqhaj329nbb9jbr72anh2', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:56:24'),
('math', '2015-12-15 14:56:32', '5488g9dc57nrla0oucibf4tmn6', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 14:56:57'),
('scolar', '2015-12-15 14:57:04', '1v2fo5grgetbu5amuhmuaqqvm3', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-15 15:43:01'),
('scolar', '2015-12-15 16:53:16', '81gpfpujh3n87objhtrr61ius4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 16:56:19'),
('scolar', '2015-12-15 16:56:36', 'hk5j1kef1jjrajm5ek71b58dd1', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 16:57:06'),
('ADMIN', '2015-12-15 16:57:20', 'tgmar4ujt3rkohr6i1kvnct7v7', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:06:43'),
('histoire', '2015-12-15 17:07:05', '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost:81/gepi/login.php', '4', '2015-12-15 17:07:05'),
('histoire', '2015-12-15 17:07:09', '', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost:81/gepi/login.php', '4', '2015-12-15 17:07:09'),
('histoire', '2015-12-15 17:07:29', 'l5bkuiqsmemr2g9l6ijo4lcv17', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:08:14'),
('scolar', '2015-12-15 17:08:22', 'h4v4schco2bv83dhqoaj9qnp93', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:09:00'),
('histoire', '2015-12-15 17:09:09', 'vn3np661mpbud63sjiovkas7g7', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:11:26'),
('scolar', '2015-12-15 17:11:34', '8l9eqe39ldrdhp4cq6aaao67a4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:11:59'),
('histoire', '2015-12-15 17:12:06', '1iq0mbatge05u44kdhvfqibl24', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:17:21'),
('math', '2015-12-15 17:17:26', 'uugehsrvi7jecebca9g17m5i67', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:27:37'),
('scolar', '2015-12-15 17:27:45', 'o5vnrllkqv8i342d89nuankvh6', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:29:59'),
('math', '2015-12-15 17:30:10', 'g9n9k0pp2l61ecj6ui2rf9aq50', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:30:33'),
('scolar', '2015-12-15 17:30:41', 'v2npunanmcjc4420in93791no5', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2015-12-15 18:00:57'),
('math', '2015-12-15 17:36:58', 'qpv27r8k6i7kfr2488e0q450i4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:37:11'),
('scolar', '2015-12-15 17:37:23', 'tjtn5ks3l3r7gj2li8aonm3f26', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-15 17:43:19'),
('ADMIN', '2015-12-15 17:43:27', 'to41ockfbul9le8sqbi6atbj65', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-15 18:54:52'),
('ADMIN', '2015-12-17 17:56:14', 'h1savis7mvkcf36v5t6o45jk06', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-17 17:57:54'),
('scolar', '2015-12-17 17:58:39', '6lmcoddosg7b2g05s619tseba4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-17 18:40:42'),
('scolar', '2015-12-21 08:35:57', '5eut5fu0a18msio99q3553s0o2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:37:02'),
('math', '2015-12-21 08:47:42', '74f06994e524nl4he72fr78f80', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2015-12-21 09:05:57'),
('ADMIN', '2015-12-21 09:06:21', 'j86d90uqhcih7u4v18hh2101b7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-21 10:55:33'),
('physique', '2015-12-21 09:37:16', '2csuaiba12uaurabhee4fartu3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:39:11'),
('histoire', '2015-12-21 09:39:27', 'gt1jes2tefmgpr9hgca47roce1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:39:44'),
('physique', '2015-12-21 09:39:58', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2015-12-21 09:39:58'),
('physique', '2015-12-21 09:40:25', 'qjioi0vhdr9qjredmuoerurrl3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:42:40'),
('scolar', '2015-12-21 09:43:05', '6h906a3o7oli4alcakq5v3ddu7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:46:22'),
('physique', '2015-12-21 09:46:40', '551lt06j65g1e7v63gdq6iao55', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-21 09:50:59'),
('scolar', '2015-12-21 09:51:18', '1n3ura59u1585jp1sgvkc4o171', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-21 10:38:09'),
('ADMIN', '2015-12-21 10:58:49', '3v6n9pgj59p96sf75ke3tgrmh7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-21 12:15:28'),
('scolar', '2015-12-21 11:01:48', 'i6538nkb16k69h6u1jdpf45b63', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-21 12:16:16'),
('ADMIN', '2015-12-21 12:27:02', 'efr7rk20svki0gspld96js6152', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-21 13:09:20'),
('scolar', '2015-12-21 12:27:57', '59peak66ki1gvp7pptuu84oe75', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-21 12:59:25'),
('adonia', '2015-12-21 13:09:34', 'fg861m1tmkhu3s5eebitui65e4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-21 13:14:29'),
('scolar', '2015-12-21 13:14:46', '6d0v1on507mrft1fgignit2c85', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-21 13:14:55'),
('ADMIN', '2015-12-21 13:15:07', '9odv0ifriggqcsq9rtidsilfd7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-21 13:17:02'),
('adonia', '2015-12-21 13:17:23', 'm49okeqfedaqsv4067imrq5ja1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-21 13:45:37'),
('scolar', '2015-12-21 13:45:58', '356k2kuij4qkjusnt9eettshd7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-21 14:18:54'),
('ADMIN', '2015-12-21 14:28:47', 'adm9o3mltprg4853s1le7vq025', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-21 14:59:24'),
('ADMIN', '2015-12-21 21:53:19', '6gkc16oapqlp8j8pr2nuu1v1a6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-21 23:46:37'),
('ADMIN', '2015-12-22 01:00:44', '9sjghq8kvao0gqnh148k3kdvr7', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-22 01:30:44'),
('ADMIN', '2015-12-22 03:05:51', 'qec8vdqkpb610vg9i7eurl6pv4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 04:52:01'),
('ADMIN', '2015-12-22 04:46:40', 'npivdt27fn3r5fqhfqtpkk87v5', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2015-12-22 05:04:23'),
('ADMIN', '2015-12-22 04:58:04', 'v4fp5ucaruru0ldrfcct4utk77', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 06:09:53'),
('adonia', '2015-12-22 05:05:00', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.19/gepi/login.php', '4', '2015-12-22 05:05:00'),
('adonia', '2015-12-22 05:05:33', '2igc7grmf91c4snhqur048m1k4', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2015-12-22 05:16:56'),
('math', '2015-12-22 05:17:52', 'tc4oba6fod01k42rciq6qb5bs3', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2015-12-22 05:21:09'),
('scolar', '2015-12-22 05:23:53', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.19/gepi/login.php', '4', '2015-12-22 05:23:53'),
('scolar', '2015-12-22 05:24:25', '8g9h6iq8d57scqf22ahbf9uq43', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-22 06:04:58'),
('ADMIN', '2015-12-22 11:00:35', 'ubnnpogc8h6g12ldu4lrk3s5s3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 13:01:55'),
('ADMIN', '2015-12-22 14:46:16', 'butmndsj3eerj9mt0mteh5cfd0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 15:29:01'),
('ADMIN', '2015-12-22 15:40:38', 'cbakdleer565usao085cu4p9s3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 16:31:29'),
('ADMIN', '2015-12-22 18:13:31', 'lo047lc2e83h0m0besvvbogbh6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 18:51:08'),
('admin', '2015-12-22 22:27:01', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/', '4', '2015-12-22 22:27:01'),
('ADMIN', '2015-12-22 22:29:45', 'si6l782klp6eri2ak9a2lepih0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-22 22:59:57'),
('ADMIN', '2015-12-23 04:05:33', '9nsqou4g0ehc7psg6ebpbhimv0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:21:07'),
('ADMIN', '2015-12-23 04:13:01', '3jcvcpca15k38p3tn3a8ff2dk5', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '3', '2015-12-23 05:06:57'),
('scolar', '2015-12-23 04:21:14', 'trqk4dh77dtm7hn9rtjbnr9sm6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:25:21'),
('ADMIN', '2015-12-23 04:25:56', 'qfbfmkrhru8255ljb913f8mip6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:28:20'),
('scolar', '2015-12-23 04:28:25', 'b5gp7hreql6v4r8o7ehr9qqbo0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:29:47'),
('ADMIN', '2015-12-23 04:30:07', '6gkop3jjts0p76ir3udk517il3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:31:58'),
('sg', '2015-12-23 04:32:20', 'f17me0i6031krd95009ldvudi1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 04:35:06'),
('scolar', '2015-12-23 04:35:18', '2pdq40v36o9sd20j0gqgpkudu6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:03:57'),
('ADMIN', '2015-12-23 05:04:05', 'cedbmh7nb4pf1ur7sijto6b6f7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:06:10'),
('scolar', '2015-12-23 05:06:18', 'h7n658ukghdjpadd1i9kc54kc6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:17:07'),
('ADMIN', '2015-12-23 05:07:20', 'kour2djmm7kmcn8pllu3g58t02', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2015-12-23 05:21:31'),
('physique', '2015-12-23 05:17:18', 'gjut56f518tvci83lidltdkmt5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:22:07'),
('scolar', '2015-12-23 05:21:45', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.31/gepi/login.php', '4', '2015-12-23 05:21:45'),
('scolar', '2015-12-23 05:22:15', 'e4e32mm3p58addbru1n67psg77', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:22:51'),
('physique', '2015-12-23 05:23:00', 'jqn77gi2pbhk7kf1cdhjud6280', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:24:08'),
('scolar', '2015-12-23 05:24:18', 'fm0qjq6ukhh4mecsl0k5tcicd5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:25:30'),
('physique', '2015-12-23 05:25:40', 'ftlmji0b0tgdffp9vr482eqb55', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:25:52'),
('ADMIN', '2015-12-23 05:26:02', '2p4vnsr6j0ipdkirlv2r3641b5', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-23 06:05:18'),
('scolar', '2015-12-23 05:26:28', '739kbn2u5iim64vmv4rmu4kr31', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:29:24'),
('scolar', '2015-12-23 05:29:28', 'oi5saqi8v9f4mmkpstji873t23', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:29:32'),
('physique', '2015-12-23 05:29:40', 'hn4d87qmiungj8gu1k85nh1i92', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:29:55'),
('scolar', '2015-12-23 05:30:12', '7i2japbsbsn3detcseseufji91', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-23 05:31:00'),
('physique', '2015-12-23 05:31:08', 'd0b69petfqb2ig70rccridsmv4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-23 06:08:03'),
('ADMIN', '2015-12-23 12:05:00', '4ti1ua72omeif3m3amp49utse1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-23 12:40:52'),
('admin1', '2015-12-23 13:26:22', 'tbcmuf617eo2hb9jav0j83c1s3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-23 14:13:32'),
('scolar', '2015-12-26 08:30:32', 'p5a92jb8t99dj3jqhfhgu0cpt5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 09:01:38'),
('scolar', '2015-12-26 09:08:30', 'gva3tjsd7svbehbfpitc4uuk91', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 10:08:27'),
('ADMIN', '2015-12-26 09:14:35', 'a85h96h3qjkq1lkguvlpjptdl6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-26 10:03:37'),
('scolar', '2015-12-26 10:58:17', '3spuin2d8bann8gll4dh9jqlc7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-26 12:26:23'),
('ADMIN', '2015-12-26 11:16:59', 'crrvp65lvmsfhqnd41basje5q0', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '3', '2015-12-26 12:17:28'),
('admin', '2015-12-26 11:50:46', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', 'http://192.168.42.14/gepi/', '4', '2015-12-26 11:50:46'),
('ADMIN', '2015-12-26 11:50:59', 'g5h3mob2tbuod3e06or4f8l187', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', '', '3', '2015-12-26 12:22:43'),
('scolar', '2015-12-26 11:57:33', 't8do2hjbpkak1dvntj4t7u0er2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 13:12:29'),
('ADMIN', '2015-12-26 12:51:06', '00tahrrrcr75sih36tpnm2ovi2', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', '', '1', '2015-12-26 13:21:07'),
('ADMIN', '2015-12-26 13:05:40', '7l3gfo85lsljilqqnk3mgkgg77', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', '', '3', '2015-12-26 13:38:32'),
('scolar', '2015-12-26 13:16:07', 'v633rn0odtemh4btaj7s80ggi1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-26 15:25:29'),
('ADMIN', '2015-12-26 13:39:38', 'p9gon3fnadm08419tnflmc16k5', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', '', '1', '2015-12-26 14:29:47'),
('ADMIN', '2015-12-26 13:42:58', '26btefolpqkeqmvtd13gqq1i43', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-26 14:53:51'),
('ADMIN', '2015-12-26 13:59:47', 'p9gon3fnadm08419tnflmc16k5', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Safari/537.36', '', '1', '2015-12-26 14:36:45'),
('ADMIN', '2015-12-26 14:16:41', '3o8f2fsulsjv5a0kadj2sfe9t0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-26 14:59:04'),
('ADMIN', '2015-12-26 14:23:51', '26btefolpqkeqmvtd13gqq1i43', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2015-12-26 14:29:48'),
('scolar', '2015-12-26 14:31:03', '6ithtsv9h2ob302ill6mrbeb07', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-26 15:03:35'),
('scolar', '2015-12-26 15:09:15', '684uc151ldr3dpeun7b0ehpus3', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-26 15:43:12'),
('scolar', '2015-12-26 15:13:12', '684uc151ldr3dpeun7b0ehpus3', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-26 15:24:33'),
('scolar', '2015-12-26 15:24:44', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.12/gepi/login.php', '4', '2015-12-26 15:24:44'),
('scolar', '2015-12-26 15:24:56', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.12/gepi/login.php', '4', '2015-12-26 15:24:56'),
('scolar', '2015-12-26 15:25:38', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2015-12-26 15:25:38'),
('scolar', '2015-12-26 15:26:01', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2015-12-26 15:26:01'),
('scolar', '2015-12-26 15:26:20', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2015-12-26 15:26:20'),
('scolar', '2015-12-26 15:27:21', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.12/gepi/login.php', '4', '2015-12-26 15:27:21'),
('ADMIN', '2015-12-26 15:27:49', 'nib40edfkmk14g229gokcdvun5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-26 15:58:29'),
('scolar', '2015-12-26 15:28:24', 'c83tucgsq3332qus78g6ndc0d6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 16:44:39'),
('ADMIN', '2015-12-26 15:45:53', 'umgotisfpr22p3lglnvjbckdp7', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-26 16:30:21'),
('scolar', '2015-12-26 19:14:51', 'ja0o5p2dr5vujpv4bl7tksrfi2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 19:51:49'),
('scolar', '2015-12-26 20:03:12', 'j1ilf18nadh7vqrh7i529s7645', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-26 20:41:57'),
('scolar', '2015-12-27 05:44:14', 'nj8h46qlmcnlf1htqumm1b7r03', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-27 06:16:00'),
('scolar', '2015-12-27 11:42:59', 'lhu9vmoi5jepge80cg0opa4ao7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-27 12:52:46'),
('scolar', '2015-12-27 13:08:47', 'opak8lu2inrd94tfcil0quqsd0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-27 14:05:11'),
('histoire', '2015-12-27 13:18:14', 'juj80fpgfv7hkajcoaa7obpj86', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2015-12-27 13:31:06'),
('sg', '2015-12-27 13:31:28', 'br05kqa938o42uf2u232fc8060', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-27 14:01:50'),
('scolar', '2015-12-27 20:48:52', 'oduktac4967cfsll80v651c837', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-27 21:33:54'),
('scolar', '2015-12-28 06:57:48', '02nfdmufa8kugant6hm0phvto7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-28 07:28:17'),
('scolar', '2015-12-29 04:27:42', 'llm6kkj809mfio1npv22u1ks74', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-29 04:57:44'),
('scolar', '2015-12-29 04:27:44', 'llm6kkj809mfio1npv22u1ks74', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 05:11:56'),
('scolar', '2015-12-29 05:00:57', '56l7pnnb1k44eg6tjep5ns0ig2', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2015-12-29 05:58:36'),
('scolar', '2015-12-29 05:37:25', 'bqs6l5v39i9honckba0eh2vss0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-29 06:18:11'),
('scolar', '2015-12-29 05:48:11', 'bqs6l5v39i9honckba0eh2vss0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 06:30:52'),
('scolar', '2015-12-29 07:57:06', 'o0p45ois2mp7sm1lrg3al4m4c6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 08:30:32'),
('scolar', '2015-12-29 09:55:41', 'k72o2rnscs0kk4tjmqcks3t1k5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 11:08:36'),
('scolar', '2015-12-29 19:51:13', '0ndji8pd8u8hbc1sg4pkalprd5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-29 19:55:28'),
('ADMIN', '2015-12-29 19:57:59', '5hag8uh2ufa0l9t660ivqobjq5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 21:27:45'),
('ADMIN', '2015-12-29 21:39:57', 'rec6f8jcjgnjmpl8kem3shsd97', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-29 22:14:00'),
('ADMIN', '2015-12-29 22:19:00', '2rnusfko7d21q925vr876b12q5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-30 04:10:39'),
('scolar', '2015-12-30 04:10:52', '9ab4phh1ag6ona1ir3v0lvj6a3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 04:14:25'),
('histoire', '2015-12-30 04:16:09', 'm3u9k9qerls553rahf2d4dqge6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 04:23:59'),
('histoire', '2015-12-30 04:24:02', 'g184dtndhmepamubl1l31mgdh0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 04:25:47'),
('scolar', '2015-12-30 04:25:53', 'iebilugj9k8mk3tdjj75s8sif5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 04:53:14'),
('sg', '2015-12-30 04:53:33', 'pvgqvpkqinjd2j6okrlr13lks5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 04:54:00'),
('scolar', '2015-12-30 04:56:46', 'tq3mvc5bp4s8dffqbuers6dg20', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:08:53'),
('histoire', '2015-12-30 05:09:05', '6l1184b3lotb3smcpljteuapa7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:19:51'),
('histoire', '2015-12-30 05:19:56', '37vbiafoq7ed26ujvk9tafh5f7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:20:00'),
('ADMIN', '2015-12-30 05:20:09', 'ce96dbomg476t4eeipj2und5a6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:21:40'),
('scolar', '2015-12-30 05:21:50', 'ubqvon073nb7n1485aomo3s564', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:28:21'),
('histoire', '2015-12-30 05:24:40', 'l5vmvsbbpn04cd8ooi6rblt6u4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2015-12-30 06:02:46'),
('ADMIN', '2015-12-30 05:28:35', '6epvv3nqq1ba22pmfs99sp3he0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:31:22'),
('scolar', '2015-12-30 05:31:32', '0nftfd5anbr7k7nqar50m4n6j4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:35:47'),
('ADMIN', '2015-12-30 05:35:55', 'hdtkr78jra9skbppaon2jhfa14', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 05:57:46'),
('histoire', '2015-12-30 05:57:56', '040tgbr2qii1i04ne1pqqvd1u6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:06:30'),
('scolar', '2015-12-30 06:06:39', '57sq4houg28i152e6plngac7l4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:07:36'),
('ADMIN', '2015-12-30 06:07:43', 'n71tlesfpehrstqcgtnu1n8sm6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:08:17'),
('scolar', '2015-12-30 06:08:31', 'kbr6f14ivbn80apgn2l3ecr8b5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:09:04'),
('ADMIN', '2015-12-30 06:09:21', 'ha4g2uee8k0e4mt6t2959lcij0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:11:53'),
('scolar', '2015-12-30 06:12:00', 'nf3gingj43a16rkns9ouj04qq6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:13:13'),
('ADMIN', '2015-12-30 06:13:23', '5i0shaf5k8e0etvp2t1q0tfgj6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:17:17'),
('scolar', '2015-12-30 06:17:25', '3oc781hdr8d07t1khgn808p3j7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:22:12'),
('scolar', '2015-12-30 06:22:16', 'f68b0ofp5m0kojro365p7aipf2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 06:25:08'),
('scolar', '2015-12-30 06:25:12', 'ejcql4agvdkdo5ol5aj9j4m175', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-30 06:55:32'),
('scolar', '2015-12-30 07:31:39', 'm2k1lh99u0oslko6lr38s0pjv1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 07:33:27'),
('ADMIN', '2015-12-30 07:33:42', '44mjqjqrl1ao1re1jfo5gtfqn4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 08:42:17'),
('nono', '2015-12-30 08:42:32', 'guf74ottuhd50jea6dv81fpvm5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 08:44:59'),
('ADMIN', '2015-12-30 08:45:04', '9cimfpud1fl40ps2oidgiet697', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 09:09:37'),
('nono', '2015-12-30 09:10:21', 'v0hf5618mjibcj2evni8rdbfe2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 09:25:19'),
('scolar', '2015-12-30 09:26:44', 'hjejscq2v5umg7k3kioigep1s5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 09:28:52'),
('ADMIN', '2015-12-30 09:29:02', '8tfk63vkpq68i3k9s9m074pjm2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 09:31:06'),
('scolar', '2015-12-30 09:31:17', 's2v85p7djp1c824lv6v61tfgk3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2015-12-30 10:00:32'),
('ADMIN', '2015-12-30 10:00:41', '5hrdu1cbgusbp95l609shj0uj4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-30 11:50:42'),
('ADMIN', '2015-12-30 16:43:31', 'rt47goka45a0ledgpjoel8vmn1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-30 17:13:43'),
('ADMIN', '2015-12-30 19:35:23', '13fgfktfj1ag24eu2go1g269j2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2015-12-30 20:45:49'),
('ADMIN', '2015-12-31 11:37:11', '78vdrjmd8s8uuc83amdrt65s33', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2015-12-31 13:17:47'),
('scolar', '2015-12-31 12:26:38', 'jkdh0ihbibkehmfut3hih5jl22', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2015-12-31 13:06:35'),
('ADMIN', '2015-12-31 13:00:08', 'ai5so0bpspngfa0vbkopnmh956', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2015-12-31 13:34:51'),
('ADMIN', '2016-01-02 07:36:43', 'gc1hsj54h0e7bnudm7g80i3794', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 07:37:55'),
('scolar', '2016-01-02 07:38:49', 'tbf3l7dd78rcoafpsag0fgp1l4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 07:45:25'),
('scolar', '2016-01-02 07:45:53', 'ffiu0lr19aqepskp153492it70', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 07:45:58'),
('scolar', '2016-01-02 07:46:16', 'ub74o17auflusjr35o9prb9os3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 07:46:18'),
('physique', '2016-01-02 07:49:29', '2qvci77hgn4q1glb8v0nfiuv01', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 07:50:37'),
('scolar', '2016-01-02 07:50:42', 'osj6h9qj84aslt1fria16n2no7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2016-01-02 08:21:56'),
('histoire', '2016-01-02 07:56:26', 'lrv4ova189qnfo0gtisa4iuve1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 07:56:32'),
('scolar', '2016-01-02 07:56:38', 'rmrhludice4jr0hm4e4l423be2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 08:27:41'),
('ADMIN', '2016-01-02 08:29:28', '3cj6s0igpd6jo153gb4v350tr7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 09:52:03'),
('scolar', '2016-01-02 09:28:32', 'ikqeoq0a99qrklnlv21gjub201', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2016-01-02 09:58:43'),
('adonia', '2016-01-02 09:53:26', 'gdit0cjofghsb1f6oa07jvabe6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 09:54:32'),
('adonia', '2016-01-02 09:54:42', 'srbb1b90gu1i12cg0lg06b0dl6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:06:27'),
('nono', '2016-01-02 10:07:18', '6h9ksbn6m70khhb2tsk795utq3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:09:50'),
('scolar', '2016-01-02 10:10:15', 'c3v9bmfuhrkpj5791rrl59bl24', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:12:28'),
('adonia', '2016-01-02 10:12:37', '0js2u3ioktollhfqolmvv89nv7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:15:41'),
('nono', '2016-01-02 10:16:07', 'miirkkgtgoo3lpve28makq50p2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:16:45'),
('scolar', '2016-01-02 10:16:56', '05crf34lc0crdd501vopm7ta96', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:30:11'),
('ADMIN', '2016-01-02 10:25:26', 'gtcjpdq1bum0godpnc2g810456', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2016-01-02 10:57:23'),
('adonia', '2016-01-02 10:30:24', '4hf41s1qn7n79pe1vlg1ief932', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:37:34'),
('nono', '2016-01-02 10:37:44', 'l6h1kg871999ifgnqn064t8fe6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 10:52:40'),
('adonia', '2016-01-02 10:53:16', 'qgq8sqsm6r68cgskp6gac31ab5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2016-01-02 11:25:59'),
('', '2016-01-02 11:17:02', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost/gepi/', '4', '2016-01-02 11:17:02'),
('adonia', '2016-01-02 11:23:03', '4jnh9r5ll4fvevdcbnqm8e9dv7', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2016-01-02 12:44:29'),
('scolar', '2016-01-02 11:31:06', 'k2d15v2vhsebv9r97q36lhftf2', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2016-01-02 12:01:46'),
('scolar', '2016-01-02 12:02:13', '29n9kr5n01njhfvinvghqhqi14', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 13:21:15'),
('ADMIN', '2016-01-02 12:45:43', 'isro33brm0bc3jt4mhsc6a97h3', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2016-01-02 13:05:10'),
('scolar', '2016-01-02 13:07:13', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.218/gepi/login.php', '4', '2016-01-02 13:07:13'),
('scolar', '2016-01-02 13:07:32', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.218/gepi/login.php', '4', '2016-01-02 13:07:32'),
('adonia', '2016-01-02 13:17:08', '8dr5jjk0qsarcs1nt8vvff4uc4', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '3', '2016-01-02 13:49:55'),
('nono', '2016-01-02 13:22:17', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2016-01-02 13:22:17'),
('nono', '2016-01-02 13:25:07', 'ivhjj1srofoae18mmtcfll4pf6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 13:56:18'),
('scolar', '2016-01-02 13:50:38', 'ben1sds429jhpu5cst71lbpgv1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2016-01-02 14:34:17'),
('scolar', '2016-01-02 13:56:32', 'tcrgtclvfeoh7qst3emj8bi137', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:17:01'),
('adonia', '2016-01-02 14:04:27', 'sngohie2fjfijruc9ma5qg1vk6', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2016-01-02 15:02:45'),
('scolaru', '2016-01-02 14:17:17', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', 'http://localhost/gepi/login.php', '4', '2016-01-02 14:17:17');
INSERT INTO `log` (`LOGIN`, `START`, `SESSION_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REFERER`, `AUTOCLOSE`, `END`) VALUES
('histoire', '2016-01-02 14:17:47', 'jqpp572t0iunlt2l0lhs6rtk62', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:18:25'),
('adonia', '2016-01-02 14:18:36', '73neqbob4qg8gv2vr6fca9lvb3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:22:39'),
('scolar', '2016-01-02 14:22:48', 'ep4o7qiitruitgfga74duncum7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:23:51'),
('nono', '2016-01-02 14:24:05', '1jrtkotb7k21mgjhk1b4ropep7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:34:27'),
('scolar', '2016-01-02 14:34:36', '78j0ih74bmsj60uf2mjplabh93', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 14:37:30'),
('scolar', '2016-01-02 14:41:34', 'r0g931c2ojhotraevbf67oons0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 15:06:38'),
('ADMIN', '2016-01-02 15:08:21', 'dhtbc9feg79t3m51b54gpqsmg7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 15:22:36'),
('scolar', '2016-01-02 15:08:31', 'bg7o9toncj6f4n92e0o9pb6ri1', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '1', '2016-01-02 15:41:18'),
('scolar', '2016-01-02 15:11:18', 'bg7o9toncj6f4n92e0o9pb6ri1', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2016-01-02 15:25:02'),
('nono', '2016-01-02 15:22:48', '2jb98l72psbjk79e00enlak9a1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 16:16:32'),
('Nono', '2016-01-02 15:25:26', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.105/gepi/login.php', '4', '2016-01-02 15:25:26'),
('adonia', '2016-01-02 15:27:43', 'f9n6n2vsn59o6qqvjh698r8472', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2016-01-02 15:30:04'),
('scolar', '2016-01-02 15:30:08', '9m8jqud4s5c5n52g1361g31nq2', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '0', '2016-01-02 15:34:02'),
('adonia', '2016-01-02 15:34:34', '', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', 'http://192.168.42.105/gepi/login.php', '4', '2016-01-02 15:34:34'),
('adonia', '2016-01-02 15:34:58', 'ong3hfafi79aju4h117jup91k2', '192.168.42.129', 'Mozilla/5.0 (Linux; Android 5.0; TECNO 7C Build/LRX21M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Safari/537.36', '', '3', '2016-01-02 16:32:22'),
('ADMIN', '2016-01-02 15:37:57', '2ngc9nn3ostgqjqrtoft0hemp0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 15:55:43'),
('scolar', '2016-01-02 15:55:49', '2cdrqcitgove5lg03ulbivrjn5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 15:56:33'),
('ADMIN', '2016-01-02 15:56:38', 'utgu06atpgbt9m3uauj2620k03', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2016-01-02 16:28:05'),
('scolar', '2016-01-02 16:16:38', '2g78bf1bmotvqm88ganoukjgo1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '0', '2016-01-02 16:57:36'),
('ADMIN', '2016-01-02 16:42:21', '7o8fpfp46n0di7srvk50rrt1i1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 16:49:33'),
('sg', '2016-01-02 16:49:41', 'tm0kmflhqdj8t0v71c4jg7uu45', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 16:50:29'),
('ADMIN', '2016-01-02 16:50:35', 'qvkn5k550a39eu6qpf5eddisc4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-02 16:50:50'),
('sg', '2016-01-02 16:50:58', 'jgkpqjv7md2guj4uvhvjics9t5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '3', '2016-01-02 17:23:43'),
('adonia', '2016-01-02 16:57:48', 'gdr6su91kp6du9lf30bbs4ds72', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2016-01-02 17:31:39'),
('ADMIN', '2016-01-03 16:10:24', 'of62jvg5r16u0211676oqch3s5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2016-01-03 16:40:24'),
('ADMIN', '2016-01-03 16:14:31', 'tl13m3ebb3rg6gdkikpea5f1l4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2016-01-03 16:44:42'),
('ADMIN', '2016-01-04 04:04:57', '6r6g5ijm75om1v1ie6cqo20as1', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2016-01-04 05:07:46'),
('scolar', '2016-01-05 04:47:43', 'fcj46138b63u1dcre3tvn7hlq6', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:09:57'),
('sg', '2016-01-05 05:10:03', 'lvepko6qjf7v6isnnstrsvp7l0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:11:30'),
('sg', '2016-01-05 05:11:51', '09j76sfkf64nncqr1bk3qus055', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:12:32'),
('adonia', '2016-01-05 05:15:51', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost/gepi/login.php', '4', '2016-01-05 05:15:51'),
('adonia', '2016-01-05 05:16:11', '', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', 'http://localhost/gepi/login.php', '4', '2016-01-05 05:16:11'),
('ADMIN', '2016-01-05 05:16:18', '2aksqmklr46ts8fds4obs70796', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:17:06'),
('adonia', '2016-01-05 05:17:30', 'ilihptfq4v5ike85qp61cqt522', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:21:21'),
('nono', '2016-01-05 05:21:40', 'a8fcdm7aalf42nekpfu3rumoc7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '0', '2016-01-05 05:24:19'),
('scolar', '2016-01-05 05:24:24', 'u2usb8k09se21pftu7oa3ffu86', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:42.0) Gecko/20100101 Firefox/42.0', '', '1', '2016-01-05 05:57:17'),
('ADMIN', '2016-01-09 20:54:20', 'itbbel9lcmsrbi638heqalicm0', '154.72.174.88', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '1', '2016-01-09 21:25:20'),
('ADMIN', '2016-01-24 04:41:48', '6kssi62aaf52alk10qgpcff5p1', '154.72.174.30', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/37.0.2062.120 Chrome/37.0.2062.120 Safari/537.36', '', '3', '2016-01-24 05:12:28');

-- --------------------------------------------------------

--
-- Structure de la table `log_maj_sconet`
--

DROP TABLE IF EXISTS `log_maj_sconet`;
CREATE TABLE IF NOT EXISTS `log_maj_sconet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `texte` longtext NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `matiere` varchar(255) NOT NULL DEFAULT '',
  `nom_complet` varchar(200) NOT NULL DEFAULT '',
  `priority` smallint(6) NOT NULL DEFAULT '0',
  `categorie_id` int(11) NOT NULL DEFAULT '1',
  `matiere_aid` char(1) NOT NULL DEFAULT 'n',
  `matiere_atelier` char(1) NOT NULL DEFAULT 'n',
  `code_matiere` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`matiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `matieres`
--

INSERT INTO `matieres` (`matiere`, `nom_complet`, `priority`, `categorie_id`, `matiere_aid`, `matiere_atelier`, `code_matiere`) VALUES
('Math', 'Mathematique', 12, 3, 'n', 'n', ''),
('Histoire', 'Histoire', 0, 1, 'n', 'n', ''),
('PHYSIQUE', 'PHYSIQUE COMPLET', 11, 3, 'n', 'n', ''),
('INF', 'INFORMATIQUE', 0, 3, 'n', 'n', ''),
('esf', 'esf', 13, 2, 'n', 'n', ''),
('EPS', 'EPS', 12, 2, 'n', 'n', ''),
('allemand1', 'allemand', 16, 1, 'n', 'n', ''),
('esp', 'espagnol', 0, 1, 'n', 'n', '');

-- --------------------------------------------------------

--
-- Structure de la table `matieres_appreciations`
--

DROP TABLE IF EXISTS `matieres_appreciations`;
CREATE TABLE IF NOT EXISTS `matieres_appreciations` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  PRIMARY KEY (`login`,`id_groupe`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `matieres_appreciations`
--

INSERT INTO `matieres_appreciations` (`login`, `id_groupe`, `periode`, `appreciation`) VALUES
('kelly', 2, 1, '0'),
('alida', 2, 1, '0'),
('kelly', 1, 2, '0'),
('alida', 1, 2, '0'),
('kelly', 2, 2, '0'),
('alida', 2, 2, '0'),
('alexy', 4, 1, '0TOTO'),
('alexy', 4, 2, '0TOTO');

-- --------------------------------------------------------

--
-- Structure de la table `matieres_appreciations_acces`
--

DROP TABLE IF EXISTS `matieres_appreciations_acces`;
CREATE TABLE IF NOT EXISTS `matieres_appreciations_acces` (
  `id_classe` int(11) NOT NULL,
  `statut` varchar(255) NOT NULL,
  `periode` int(11) NOT NULL,
  `date` date NOT NULL,
  `acces` enum('y','n','date','d') NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `matieres_appreciations_acces`
--

INSERT INTO `matieres_appreciations_acces` (`id_classe`, `statut`, `periode`, `date`, `acces`) VALUES
(1, 'responsable', 1, '0000-00-00', 'n'),
(1, 'responsable', 2, '0000-00-00', 'n'),
(1, 'responsable', 3, '0000-00-00', 'n'),
(1, 'responsable', 4, '0000-00-00', 'n'),
(2, 'responsable', 1, '0000-00-00', 'n'),
(2, 'responsable', 2, '0000-00-00', 'n'),
(2, 'responsable', 3, '0000-00-00', 'n');

-- --------------------------------------------------------

--
-- Structure de la table `matieres_appreciations_grp`
--

DROP TABLE IF EXISTS `matieres_appreciations_grp`;
CREATE TABLE IF NOT EXISTS `matieres_appreciations_grp` (
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  PRIMARY KEY (`id_groupe`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matieres_appreciations_tempo`
--

DROP TABLE IF EXISTS `matieres_appreciations_tempo`;
CREATE TABLE IF NOT EXISTS `matieres_appreciations_tempo` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  PRIMARY KEY (`login`,`id_groupe`,`periode`),
  KEY `groupe_periode` (`id_groupe`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matieres_app_corrections`
--

DROP TABLE IF EXISTS `matieres_app_corrections`;
CREATE TABLE IF NOT EXISTS `matieres_app_corrections` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `appreciation` text NOT NULL,
  PRIMARY KEY (`login`,`id_groupe`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matieres_app_delais`
--

DROP TABLE IF EXISTS `matieres_app_delais`;
CREATE TABLE IF NOT EXISTS `matieres_app_delais` (
  `periode` int(11) NOT NULL DEFAULT '0',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `date_limite` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mode` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`periode`,`id_groupe`),
  KEY `id_groupe` (`id_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matieres_categories`
--

DROP TABLE IF EXISTS `matieres_categories`;
CREATE TABLE IF NOT EXISTS `matieres_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_court` varchar(255) NOT NULL DEFAULT '',
  `nom_complet` varchar(255) NOT NULL DEFAULT '',
  `priority` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `matieres_categories`
--

INSERT INTO `matieres_categories` (`id`, `nom_court`, `nom_complet`, `priority`) VALUES
(1, 'Autres', 'Autres', 10),
(2, 'Français', 'Français Lib', 2),
(3, 'Science', 'Science', 6);

-- --------------------------------------------------------

--
-- Structure de la table `matieres_notes`
--

DROP TABLE IF EXISTS `matieres_notes`;
CREATE TABLE IF NOT EXISTS `matieres_notes` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `note` float(10,1) DEFAULT NULL,
  `statut` varchar(10) NOT NULL DEFAULT '',
  `rang` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login`,`id_groupe`,`periode`),
  KEY `groupe_periode_statut` (`id_groupe`,`periode`,`statut`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `matieres_notes`
--

INSERT INTO `matieres_notes` (`login`, `id_groupe`, `periode`, `note`, `statut`, `rang`) VALUES
('kelly', 1, 1, 12.0, '', 2),
('alida', 1, 1, 15.0, '', 1),
('kelly', 2, 1, 18.0, '', 1),
('alida', 2, 1, 14.0, '', 2),
('kelly', 1, 2, 12.0, '', 1),
('alida', 1, 2, 8.0, '', 2),
('kelly', 2, 2, 18.0, '', 1),
('alida', 2, 2, 14.0, '', 2),
('kelly', 1, 7, 15.0, '', 1),
('alida', 1, 7, 14.5, '', 2),
('kelly', 2, 7, 15.0, '', 1),
('alida', 2, 7, 14.5, '', 2),
('kelly', 3, 1, 12.0, '', 2),
('alida', 3, 1, 14.0, '', 1),
('alida', 3, 2, 15.0, '', 2),
('kelly', 3, 2, 16.0, '', 1),
('kelly', 3, 7, 14.0, '', 2),
('alida', 3, 7, 15.5, '', 1),
('alexy', 4, 1, 18.0, '', 1),
('alexy', 4, 2, 18.0, '', 1),
('alexy', 4, 3, 18.5, '', 1),
('abena_41', 6, 1, 10.0, '', 1),
('abena_41', 6, 2, 12.0, '', 1),
('abena_41', 6, 3, 11.0, '', 1),
('celestin', 9, 1, 12.0, '', 2),
('sc_5', 9, 1, 20.0, '', 1),
('celestin', 8, 1, 11.0, '', 1),
('sc_5', 8, 1, 8.0, '', 2),
('celestin', 9, 2, 11.0, '', 2),
('sc_5', 9, 2, 16.0, '', 1),
('celestin', 8, 2, 13.0, '', 1),
('sc_5', 8, 2, 9.0, '', 2),
('celestin', 8, 3, 2.0, '', 2),
('sc_5', 8, 3, 16.0, '', 1),
('celestin', 9, 3, 14.0, '', 2),
('sc_5', 9, 3, 20.0, '', 1),
('celestin', 9, 4, 15.0, '', 2),
('sc_5', 9, 4, 17.0, '', 1),
('celestin', 8, 4, 3.5, '', 2),
('sc_5', 8, 4, 13.0, '', 1),
('celestin', 9, 6, 15.0, '', 2),
('sc_5', 9, 6, 16.5, '', 1),
('celestin', 8, 6, 10.0, '', 2),
('sc_5', 8, 6, 13.5, '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `mef`
--

DROP TABLE IF EXISTS `mef`;
CREATE TABLE IF NOT EXISTS `mef` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Cle primaire de la classe',
  `mef_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'Numero de la nomenclature officielle (numero MEF)',
  `libelle_court` varchar(50) NOT NULL COMMENT 'libelle de la formation',
  `libelle_long` varchar(300) NOT NULL COMMENT 'libelle de la formation',
  `libelle_edition` varchar(300) NOT NULL COMMENT 'libelle de la formation pour presentation',
  `code_mefstat` varchar(50) NOT NULL DEFAULT '',
  `mef_rattachement` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module élémentaire de formation' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mentions`
--

DROP TABLE IF EXISTS `mentions`;
CREATE TABLE IF NOT EXISTS `mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mention` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `messagerie`
--

DROP TABLE IF EXISTS `messagerie`;
CREATE TABLE IF NOT EXISTS `messagerie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_reply_to` int(11) NOT NULL,
  `login_src` varchar(50) NOT NULL,
  `login_dest` varchar(50) NOT NULL,
  `sujet` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `date_msg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_visibilite` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vu` tinyint(4) NOT NULL,
  `date_vu` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texte` text NOT NULL,
  `date_debut` int(11) NOT NULL DEFAULT '0',
  `date_fin` int(11) NOT NULL DEFAULT '0',
  `auteur` varchar(50) NOT NULL DEFAULT '',
  `statuts_destinataires` varchar(10) NOT NULL DEFAULT '',
  `login_destinataire` varchar(50) NOT NULL DEFAULT '',
  `date_decompte` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_debut_fin` (`date_debut`,`date_fin`),
  KEY `login_destinataire` (`login_destinataire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `message_login`
--

DROP TABLE IF EXISTS `message_login`;
CREATE TABLE IF NOT EXISTS `message_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texte` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `message_login`
--

INSERT INTO `message_login` (`id`, `texte`) VALUES
(1, 'Espace pour un message en page de login paramétrable en Gestion des connexions.');

-- --------------------------------------------------------

--
-- Structure de la table `miseajour`
--

DROP TABLE IF EXISTS `miseajour`;
CREATE TABLE IF NOT EXISTS `miseajour` (
  `id_miseajour` int(11) NOT NULL AUTO_INCREMENT,
  `fichier_miseajour` varchar(250) NOT NULL,
  `emplacement_miseajour` varchar(250) NOT NULL,
  `date_miseajour` date NOT NULL,
  `heure_miseajour` time NOT NULL,
  PRIMARY KEY (`id_miseajour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modeles_grilles_pdf`
--

DROP TABLE IF EXISTS `modeles_grilles_pdf`;
CREATE TABLE IF NOT EXISTS `modeles_grilles_pdf` (
  `id_modele` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `nom_modele` varchar(255) NOT NULL,
  `par_defaut` enum('y','n') DEFAULT 'n',
  PRIMARY KEY (`id_modele`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modeles_grilles_pdf_valeurs`
--

DROP TABLE IF EXISTS `modeles_grilles_pdf_valeurs`;
CREATE TABLE IF NOT EXISTS `modeles_grilles_pdf_valeurs` (
  `id_modele` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `valeur` varchar(255) NOT NULL,
  KEY `id_modele_champ` (`id_modele`,`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modele_bulletin`
--

DROP TABLE IF EXISTS `modele_bulletin`;
CREATE TABLE IF NOT EXISTS `modele_bulletin` (
  `id_model_bulletin` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `valeur` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `modele_bulletin`
--

INSERT INTO `modele_bulletin` (`id_model_bulletin`, `nom`, `valeur`) VALUES
(1, 'id_model_bulletin', '1'),
(1, 'nom_model_bulletin', 'Standard'),
(1, 'active_bloc_datation', '1'),
(1, 'active_bloc_eleve', '1'),
(1, 'active_bloc_adresse_parent', '0'),
(1, 'active_bloc_absence', '0'),
(1, 'active_bloc_note_appreciation', '1'),
(1, 'active_bloc_avis_conseil', '0'),
(1, 'active_bloc_chef', '0'),
(1, 'active_photo', '1'),
(1, 'active_coef_moyenne', '1'),
(1, 'active_nombre_note', '0'),
(1, 'active_nombre_note_case', '0'),
(1, 'active_moyenne', '1'),
(1, 'active_moyenne_eleve', '1'),
(1, 'active_moyenne_classe', '1'),
(1, 'active_moyenne_min', '1'),
(1, 'active_moyenne_max', '1'),
(1, 'active_regroupement_cote', '0'),
(1, 'active_entete_regroupement', '1'),
(1, 'active_moyenne_regroupement', '1'),
(1, 'active_rang', '1'),
(1, 'active_graphique_niveau', '0'),
(1, 'active_appreciation', '1'),
(1, 'affiche_doublement', '1'),
(1, 'affiche_date_naissance', '1'),
(1, 'affiche_dp', '0'),
(1, 'affiche_nom_court', '0'),
(1, 'affiche_effectif_classe', '1'),
(1, 'affiche_numero_impression', '0'),
(1, 'caractere_utilse', 'Arial'),
(1, 'X_parent', '110'),
(1, 'Y_parent', '40'),
(1, 'X_eleve', '5'),
(1, 'Y_eleve', '48'),
(1, 'cadre_eleve', '1'),
(1, 'X_datation_bul', '110'),
(1, 'Y_datation_bul', '48'),
(1, 'cadre_datation_bul', '1'),
(1, 'hauteur_info_categorie', '5'),
(1, 'X_note_app', '5'),
(1, 'Y_note_app', '72'),
(1, 'longeur_note_app', '200'),
(1, 'hauteur_note_app', '140'),
(1, 'largeur_coef_moyenne', '8'),
(1, 'largeur_nombre_note', '8'),
(1, 'largeur_d_une_moyenne', '10'),
(1, 'largeur_niveau', '18'),
(1, 'largeur_rang', '7'),
(1, 'X_absence', '5'),
(1, 'Y_absence', '212'),
(1, 'hauteur_entete_moyenne_general', '5'),
(1, 'X_avis_cons', '5'),
(1, 'Y_avis_cons', '260'),
(1, 'longeur_avis_cons', '130'),
(1, 'hauteur_avis_cons', '20'),
(1, 'cadre_avis_cons', '1'),
(1, 'X_sign_chef', '138'),
(1, 'Y_sign_chef', '250'),
(1, 'longeur_sign_chef', '67'),
(1, 'hauteur_sign_chef', '37'),
(1, 'cadre_sign_chef', '0'),
(1, 'affiche_filigrame', '0'),
(1, 'texte_filigrame', 'DUPLICATA INTERNET'),
(1, 'affiche_logo_etab', '1'),
(1, 'entente_mel', '0'),
(1, 'entente_tel', '1'),
(1, 'entente_fax', '1'),
(1, 'L_max_logo', '75'),
(1, 'H_max_logo', '75'),
(1, 'toute_moyenne_meme_col', '0'),
(1, 'active_reperage_eleve', '1'),
(1, 'couleur_reperage_eleve1', '255'),
(1, 'couleur_reperage_eleve2', '255'),
(1, 'couleur_reperage_eleve3', '207'),
(1, 'couleur_categorie_entete', '1'),
(1, 'couleur_categorie_entete1', '200'),
(1, 'couleur_categorie_entete2', '200'),
(1, 'couleur_categorie_entete3', '200'),
(1, 'couleur_categorie_cote', '0'),
(1, 'couleur_categorie_cote1', '239'),
(1, 'couleur_categorie_cote2', '239'),
(1, 'couleur_categorie_cote3', '239'),
(1, 'couleur_moy_general', '1'),
(1, 'couleur_moy_general1', '200'),
(1, 'couleur_moy_general2', '200'),
(1, 'couleur_moy_general3', '200'),
(1, 'titre_entete_matiere', 'Matière'),
(1, 'titre_entete_coef', 'coef.'),
(1, 'titre_entete_nbnote', 'nb. n.'),
(1, 'titre_entete_rang', 'rang'),
(1, 'titre_entete_appreciation', 'Appréciation / Conseils'),
(1, 'active_coef_sousmoyene', '0'),
(1, 'arrondie_choix', '0.01'),
(1, 'nb_chiffre_virgule', '2'),
(1, 'chiffre_avec_zero', '0'),
(1, 'autorise_sous_matiere', '1'),
(1, 'affichage_haut_responsable', '1'),
(1, 'entete_model_bulletin', '1'),
(1, 'ordre_entete_model_bulletin', '1'),
(1, 'affiche_etab_origine', '0'),
(1, 'imprime_pour', '1'),
(1, 'largeur_matiere', '80'),
(1, 'nom_etab_gras', '1'),
(1, 'taille_texte_date_edition', '0'),
(1, 'taille_texte_matiere', '0'),
(1, 'active_moyenne_general', '1'),
(1, 'titre_bloc_avis_conseil', ''),
(1, 'taille_titre_bloc_avis_conseil', '0'),
(1, 'taille_profprincipal_bloc_avis_conseil', '0'),
(1, 'affiche_fonction_chef', '0'),
(1, 'taille_texte_fonction_chef', '0'),
(1, 'taille_texte_identitee_chef', '0'),
(1, 'tel_image', ''),
(1, 'tel_texte', ''),
(1, 'fax_image', ''),
(1, 'fax_texte', ''),
(1, 'courrier_image', ''),
(1, 'courrier_texte', ''),
(1, 'largeur_bloc_eleve', '0'),
(1, 'hauteur_bloc_eleve', '20'),
(1, 'largeur_bloc_adresse', '0'),
(1, 'hauteur_bloc_adresse', '0'),
(1, 'largeur_bloc_datation', '0'),
(1, 'hauteur_bloc_datation', '0'),
(1, 'taille_texte_classe', '0'),
(1, 'type_texte_classe', ''),
(1, 'taille_texte_annee', '0'),
(1, 'type_texte_annee', ''),
(1, 'taille_texte_periode', '0'),
(1, 'type_texte_periode', ''),
(1, 'taille_texte_categorie_cote', '0'),
(1, 'taille_texte_categorie', '14'),
(1, 'type_texte_date_datation', ''),
(1, 'cadre_adresse', '0'),
(1, 'centrage_logo', '1'),
(1, 'Y_centre_logo', '18'),
(1, 'ajout_cadre_blanc_photo', '1'),
(1, 'affiche_moyenne_mini_general', '1'),
(1, 'affiche_moyenne_maxi_general', '1'),
(1, 'affiche_date_edition', '0'),
(1, 'affiche_ine', '0'),
(2, 'id_model_bulletin', '2'),
(2, 'nom_model_bulletin', 'Standard avec photo'),
(2, 'active_bloc_datation', '1'),
(2, 'active_bloc_eleve', '1'),
(2, 'active_bloc_adresse_parent', '1'),
(2, 'active_bloc_absence', '1'),
(2, 'active_bloc_note_appreciation', '1'),
(2, 'active_bloc_avis_conseil', '1'),
(2, 'active_bloc_chef', '1'),
(2, 'active_photo', '1'),
(2, 'active_coef_moyenne', '1'),
(2, 'active_nombre_note', '0'),
(2, 'active_nombre_note_case', '0'),
(2, 'active_moyenne', '1'),
(2, 'active_moyenne_eleve', '1'),
(2, 'active_moyenne_classe', '1'),
(2, 'active_moyenne_min', '1'),
(2, 'active_moyenne_max', '1'),
(2, 'active_regroupement_cote', '0'),
(2, 'active_entete_regroupement', '0'),
(2, 'active_moyenne_regroupement', '0'),
(2, 'active_rang', '1'),
(2, 'active_graphique_niveau', '0'),
(2, 'active_appreciation', '1'),
(2, 'affiche_doublement', '1'),
(2, 'affiche_date_naissance', '1'),
(2, 'affiche_dp', '1'),
(2, 'affiche_nom_court', '0'),
(2, 'affiche_effectif_classe', '0'),
(2, 'affiche_numero_impression', '0'),
(2, 'caractere_utilse', 'Arial'),
(2, 'X_parent', '110'),
(2, 'Y_parent', '40'),
(2, 'X_eleve', '5'),
(2, 'Y_eleve', '40'),
(2, 'cadre_eleve', '1'),
(2, 'X_datation_bul', '110'),
(2, 'Y_datation_bul', '5'),
(2, 'cadre_datation_bul', '1'),
(2, 'hauteur_info_categorie', '5'),
(2, 'X_note_app', '5'),
(2, 'Y_note_app', '72'),
(2, 'longeur_note_app', '200'),
(2, 'hauteur_note_app', '175'),
(2, 'largeur_coef_moyenne', '8'),
(2, 'largeur_nombre_note', '8'),
(2, 'largeur_d_une_moyenne', '10'),
(2, 'largeur_niveau', '18'),
(2, 'largeur_rang', '5'),
(2, 'X_absence', '5'),
(2, 'Y_absence', '246.3'),
(2, 'hauteur_entete_moyenne_general', '5'),
(2, 'X_avis_cons', '5'),
(2, 'Y_avis_cons', '250'),
(2, 'longeur_avis_cons', '130'),
(2, 'hauteur_avis_cons', '37'),
(2, 'cadre_avis_cons', '1'),
(2, 'X_sign_chef', '138'),
(2, 'Y_sign_chef', '250'),
(2, 'longeur_sign_chef', '67'),
(2, 'hauteur_sign_chef', '37'),
(2, 'cadre_sign_chef', '0'),
(2, 'affiche_filigrame', '0'),
(2, 'texte_filigrame', 'DUPLICATA INTERNET'),
(2, 'affiche_logo_etab', '1'),
(2, 'entente_mel', '1'),
(2, 'entente_tel', '1'),
(2, 'entente_fax', '1'),
(2, 'L_max_logo', '75'),
(2, 'H_max_logo', '75'),
(2, 'toute_moyenne_meme_col', '0'),
(2, 'active_reperage_eleve', '1'),
(2, 'couleur_reperage_eleve1', '255'),
(2, 'couleur_reperage_eleve2', '255'),
(2, 'couleur_reperage_eleve3', '207'),
(2, 'couleur_categorie_entete', '1'),
(2, 'couleur_categorie_entete1', '239'),
(2, 'couleur_categorie_entete2', '239'),
(2, 'couleur_categorie_entete3', '239'),
(2, 'couleur_categorie_cote', '1'),
(2, 'couleur_categorie_cote1', '239'),
(2, 'couleur_categorie_cote2', '239'),
(2, 'couleur_categorie_cote3', '239'),
(2, 'couleur_moy_general', '1'),
(2, 'couleur_moy_general1', '239'),
(2, 'couleur_moy_general2', '239'),
(2, 'couleur_moy_general3', '239'),
(2, 'titre_entete_matiere', 'Matière'),
(2, 'titre_entete_coef', 'coef.'),
(2, 'titre_entete_nbnote', 'nb. n.'),
(2, 'titre_entete_rang', 'rang'),
(2, 'titre_entete_appreciation', 'Appréciation / Conseils'),
(2, 'active_coef_sousmoyene', '0'),
(2, 'arrondie_choix', '0'),
(2, 'nb_chiffre_virgule', '2'),
(2, 'chiffre_avec_zero', '0'),
(2, 'autorise_sous_matiere', '1'),
(2, 'affichage_haut_responsable', '1'),
(2, 'entete_model_bulletin', '1'),
(2, 'ordre_entete_model_bulletin', '1'),
(2, 'affiche_etab_origine', '0'),
(2, 'imprime_pour', '1'),
(2, 'largeur_matiere', '40'),
(2, 'nom_etab_gras', '1'),
(2, 'taille_texte_date_edition', '0'),
(2, 'taille_texte_matiere', '0'),
(2, 'active_moyenne_general', '1'),
(2, 'titre_bloc_avis_conseil', ''),
(2, 'taille_titre_bloc_avis_conseil', '0'),
(2, 'taille_profprincipal_bloc_avis_conseil', '0'),
(2, 'affiche_fonction_chef', '0'),
(2, 'taille_texte_fonction_chef', '0'),
(2, 'taille_texte_identitee_chef', '0'),
(2, 'tel_image', ''),
(2, 'tel_texte', ''),
(2, 'fax_image', ''),
(2, 'fax_texte', ''),
(2, 'courrier_image', ''),
(2, 'courrier_texte', ''),
(2, 'largeur_bloc_eleve', '0'),
(2, 'hauteur_bloc_eleve', '0'),
(2, 'largeur_bloc_adresse', '0'),
(2, 'hauteur_bloc_adresse', '0'),
(2, 'largeur_bloc_datation', '0'),
(2, 'hauteur_bloc_datation', '0'),
(2, 'taille_texte_classe', '0'),
(2, 'type_texte_classe', ''),
(2, 'taille_texte_annee', '0'),
(2, 'type_texte_annee', ''),
(2, 'taille_texte_periode', '0'),
(2, 'type_texte_periode', ''),
(2, 'taille_texte_categorie_cote', '0'),
(2, 'taille_texte_categorie', '0'),
(2, 'type_texte_date_datation', ''),
(2, 'cadre_adresse', '0'),
(2, 'centrage_logo', '0'),
(2, 'Y_centre_logo', '18'),
(2, 'ajout_cadre_blanc_photo', '0'),
(2, 'affiche_moyenne_mini_general', '1'),
(2, 'affiche_moyenne_maxi_general', '1'),
(2, 'affiche_date_edition', '1'),
(2, 'affiche_ine', '0'),
(3, 'id_model_bulletin', '3'),
(3, 'nom_model_bulletin', 'Affiche tout'),
(3, 'active_bloc_datation', '1'),
(3, 'active_bloc_eleve', '1'),
(3, 'active_bloc_adresse_parent', '1'),
(3, 'active_bloc_absence', '1'),
(3, 'active_bloc_note_appreciation', '1'),
(3, 'active_bloc_avis_conseil', '1'),
(3, 'active_bloc_chef', '1'),
(3, 'active_photo', '1'),
(3, 'active_coef_moyenne', '1'),
(3, 'active_nombre_note', '1'),
(3, 'active_nombre_note_case', '1'),
(3, 'active_moyenne', '1'),
(3, 'active_moyenne_eleve', '1'),
(3, 'active_moyenne_classe', '1'),
(3, 'active_moyenne_min', '1'),
(3, 'active_moyenne_max', '1'),
(3, 'active_regroupement_cote', '1'),
(3, 'active_entete_regroupement', '1'),
(3, 'active_moyenne_regroupement', '1'),
(3, 'active_rang', '1'),
(3, 'active_graphique_niveau', '1'),
(3, 'active_appreciation', '1'),
(3, 'affiche_doublement', '1'),
(3, 'affiche_date_naissance', '1'),
(3, 'affiche_dp', '1'),
(3, 'affiche_nom_court', '1'),
(3, 'affiche_effectif_classe', '1'),
(3, 'affiche_numero_impression', '1'),
(3, 'caractere_utilse', 'Arial'),
(3, 'X_parent', '110'),
(3, 'Y_parent', '40'),
(3, 'X_eleve', '5'),
(3, 'Y_eleve', '40'),
(3, 'cadre_eleve', '1'),
(3, 'X_datation_bul', '110'),
(3, 'Y_datation_bul', '5'),
(3, 'cadre_datation_bul', '1'),
(3, 'hauteur_info_categorie', '5'),
(3, 'X_note_app', '5'),
(3, 'Y_note_app', '72'),
(3, 'longeur_note_app', '200'),
(3, 'hauteur_note_app', '175'),
(3, 'largeur_coef_moyenne', '8'),
(3, 'largeur_nombre_note', '8'),
(3, 'largeur_d_une_moyenne', '10'),
(3, 'largeur_niveau', '16.5'),
(3, 'largeur_rang', '6.5'),
(3, 'X_absence', '5'),
(3, 'Y_absence', '246.3'),
(3, 'hauteur_entete_moyenne_general', '5'),
(3, 'X_avis_cons', '5'),
(3, 'Y_avis_cons', '250'),
(3, 'longeur_avis_cons', '130'),
(3, 'hauteur_avis_cons', '37'),
(3, 'cadre_avis_cons', '1'),
(3, 'X_sign_chef', '138'),
(3, 'Y_sign_chef', '250'),
(3, 'longeur_sign_chef', '67'),
(3, 'hauteur_sign_chef', '37'),
(3, 'cadre_sign_chef', '1'),
(3, 'affiche_filigrame', '0'),
(3, 'texte_filigrame', 'DUPLICATA INTERNET'),
(3, 'affiche_logo_etab', '1'),
(3, 'entente_mel', '1'),
(3, 'entente_tel', '1'),
(3, 'entente_fax', '1'),
(3, 'L_max_logo', '75'),
(3, 'H_max_logo', '75'),
(3, 'toute_moyenne_meme_col', '1'),
(3, 'active_reperage_eleve', '1'),
(3, 'couleur_reperage_eleve1', '255'),
(3, 'couleur_reperage_eleve2', '255'),
(3, 'couleur_reperage_eleve3', '207'),
(3, 'couleur_categorie_entete', '1'),
(3, 'couleur_categorie_entete1', '239'),
(3, 'couleur_categorie_entete2', '239'),
(3, 'couleur_categorie_entete3', '239'),
(3, 'couleur_categorie_cote', '1'),
(3, 'couleur_categorie_cote1', '239'),
(3, 'couleur_categorie_cote2', '239'),
(3, 'couleur_categorie_cote3', '239'),
(3, 'couleur_moy_general', '1'),
(3, 'couleur_moy_general1', '239'),
(3, 'couleur_moy_general2', '239'),
(3, 'couleur_moy_general3', '239'),
(3, 'titre_entete_matiere', 'Matière'),
(3, 'titre_entete_coef', 'coef.'),
(3, 'titre_entete_nbnote', 'nb. n.'),
(3, 'titre_entete_rang', 'rang'),
(3, 'titre_entete_appreciation', 'Appréciation / Conseils'),
(3, 'active_coef_sousmoyene', '1'),
(3, 'arrondie_choix', '0.01'),
(3, 'nb_chiffre_virgule', '2'),
(3, 'chiffre_avec_zero', '0'),
(3, 'autorise_sous_matiere', '1'),
(3, 'affichage_haut_responsable', '1'),
(3, 'entete_model_bulletin', '2'),
(3, 'ordre_entete_model_bulletin', '1'),
(3, 'affiche_etab_origine', '1'),
(3, 'imprime_pour', '1'),
(3, 'largeur_matiere', '40'),
(3, 'nom_etab_gras', '0'),
(3, 'taille_texte_date_edition', '0'),
(3, 'taille_texte_matiere', '0'),
(3, 'active_moyenne_general', '0'),
(3, 'titre_bloc_avis_conseil', ''),
(3, 'taille_titre_bloc_avis_conseil', '0'),
(3, 'taille_profprincipal_bloc_avis_conseil', '0'),
(3, 'affiche_fonction_chef', '0'),
(3, 'taille_texte_fonction_chef', '0'),
(3, 'taille_texte_identitee_chef', '0'),
(3, 'tel_image', ''),
(3, 'tel_texte', ''),
(3, 'fax_image', ''),
(3, 'fax_texte', ''),
(3, 'courrier_image', ''),
(3, 'courrier_texte', ''),
(3, 'largeur_bloc_eleve', '0'),
(3, 'hauteur_bloc_eleve', '0'),
(3, 'largeur_bloc_adresse', '0'),
(3, 'hauteur_bloc_adresse', '0'),
(3, 'largeur_bloc_datation', '0'),
(3, 'hauteur_bloc_datation', '0'),
(3, 'taille_texte_classe', '0'),
(3, 'type_texte_classe', ''),
(3, 'taille_texte_annee', '0'),
(3, 'type_texte_annee', ''),
(3, 'taille_texte_periode', '0'),
(3, 'type_texte_periode', ''),
(3, 'taille_texte_categorie_cote', '0'),
(3, 'taille_texte_categorie', '0'),
(3, 'type_texte_date_datation', ''),
(3, 'cadre_adresse', '0'),
(3, 'centrage_logo', '0'),
(3, 'Y_centre_logo', '18'),
(3, 'ajout_cadre_blanc_photo', '0'),
(3, 'affiche_moyenne_mini_general', '1'),
(3, 'affiche_moyenne_maxi_general', '1'),
(3, 'affiche_date_edition', '1'),
(3, 'affiche_ine', '0'),
(2, 'afficher_abs_tot', '1'),
(2, 'afficher_abs_nj', '1'),
(2, 'afficher_abs_ret', '1'),
(2, 'afficher_abs_cpe', '1'),
(2, 'presentation_proflist', '1'),
(2, 'largeur_cadre_absences', '200'),
(2, 'affich_mentions', 'y'),
(2, 'affich_intitule_mentions', 'y'),
(2, 'affich_coches_mentions', 'y'),
(2, 'entete_info_etab_suppl', 'n'),
(2, 'entete_info_etab_suppl_texte', 'Site web'),
(2, 'entete_info_etab_suppl_valeur', 'http://'),
(2, 'moyennes_periodes_precedentes', 'n'),
(2, 'evolution_moyenne_periode_precedente', 'n'),
(2, 'moyennes_annee', 'n'),
(2, 'afficher_tous_profprincipaux', '0'),
(2, 'affiche_totalpoints_sur_totalcoefs', '1'),
(2, 'affiche_moyenne_general_coef_1', '1'),
(2, 'affiche_numero_responsable', '0'),
(2, 'affiche_nom_etab', '1'),
(2, 'affiche_adresse_etab', '1'),
(2, 'adresse_resp_fontsize', '12'),
(2, 'cell_ajustee_texte_matiere', '0'),
(2, 'cell_ajustee_texte_matiere_ratio_min_max', '3'),
(1, 'afficher_abs_tot', '0'),
(1, 'afficher_abs_nj', '0'),
(1, 'afficher_abs_ret', '0'),
(1, 'afficher_abs_cpe', '0'),
(1, 'presentation_proflist', '1'),
(1, 'largeur_cadre_absences', '400'),
(1, 'affich_mentions', 'y'),
(1, 'affich_intitule_mentions', 'y'),
(1, 'affich_coches_mentions', 'y'),
(1, 'entete_info_etab_suppl', 'n'),
(1, 'entete_info_etab_suppl_texte', 'Site web'),
(1, 'entete_info_etab_suppl_valeur', 'http://'),
(1, 'moyennes_periodes_precedentes', 'n'),
(1, 'evolution_moyenne_periode_precedente', 'n'),
(1, 'moyennes_annee', 'n'),
(1, 'afficher_tous_profprincipaux', '1'),
(1, 'affiche_totalpoints_sur_totalcoefs', '1'),
(1, 'affiche_moyenne_general_coef_1', '0'),
(1, 'affiche_numero_responsable', '0'),
(1, 'affiche_nom_etab', '1'),
(1, 'affiche_adresse_etab', '0'),
(1, 'adresse_resp_fontsize', '12'),
(1, 'cell_ajustee_texte_matiere', '0'),
(1, 'cell_ajustee_texte_matiere_ratio_min_max', '3');

-- --------------------------------------------------------

--
-- Structure de la table `model_bulletin`
--

DROP TABLE IF EXISTS `model_bulletin`;
CREATE TABLE IF NOT EXISTS `model_bulletin` (
  `id_model_bulletin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_model_bulletin` varchar(100) NOT NULL DEFAULT '',
  `active_bloc_datation` decimal(4,0) NOT NULL DEFAULT '0',
  `active_bloc_eleve` tinyint(4) NOT NULL DEFAULT '0',
  `active_bloc_adresse_parent` tinyint(4) NOT NULL DEFAULT '0',
  `active_bloc_absence` tinyint(4) NOT NULL DEFAULT '0',
  `active_bloc_note_appreciation` tinyint(4) NOT NULL DEFAULT '0',
  `active_bloc_avis_conseil` tinyint(4) NOT NULL DEFAULT '0',
  `active_bloc_chef` tinyint(4) NOT NULL DEFAULT '0',
  `active_photo` tinyint(4) NOT NULL DEFAULT '0',
  `active_coef_moyenne` tinyint(4) NOT NULL DEFAULT '0',
  `active_nombre_note` tinyint(4) NOT NULL DEFAULT '0',
  `active_nombre_note_case` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne_eleve` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne_classe` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne_min` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne_max` tinyint(4) NOT NULL DEFAULT '0',
  `active_regroupement_cote` tinyint(4) NOT NULL DEFAULT '0',
  `active_entete_regroupement` tinyint(4) NOT NULL DEFAULT '0',
  `active_moyenne_regroupement` tinyint(4) NOT NULL DEFAULT '0',
  `active_rang` tinyint(4) NOT NULL DEFAULT '0',
  `active_graphique_niveau` tinyint(4) NOT NULL DEFAULT '0',
  `active_appreciation` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_doublement` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_date_naissance` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_dp` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_nom_court` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_effectif_classe` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_numero_impression` tinyint(4) NOT NULL DEFAULT '0',
  `caractere_utilse` varchar(20) NOT NULL DEFAULT '',
  `X_parent` float NOT NULL DEFAULT '0',
  `Y_parent` float NOT NULL DEFAULT '0',
  `X_eleve` float NOT NULL DEFAULT '0',
  `Y_eleve` float NOT NULL DEFAULT '0',
  `cadre_eleve` tinyint(4) NOT NULL DEFAULT '0',
  `X_datation_bul` float NOT NULL DEFAULT '0',
  `Y_datation_bul` float NOT NULL DEFAULT '0',
  `cadre_datation_bul` tinyint(4) NOT NULL DEFAULT '0',
  `hauteur_info_categorie` float NOT NULL DEFAULT '0',
  `X_note_app` float NOT NULL DEFAULT '0',
  `Y_note_app` float NOT NULL DEFAULT '0',
  `longeur_note_app` float NOT NULL DEFAULT '0',
  `hauteur_note_app` float NOT NULL DEFAULT '0',
  `largeur_coef_moyenne` float NOT NULL DEFAULT '0',
  `largeur_nombre_note` float NOT NULL DEFAULT '0',
  `largeur_d_une_moyenne` float NOT NULL DEFAULT '0',
  `largeur_niveau` float NOT NULL DEFAULT '0',
  `largeur_rang` float NOT NULL DEFAULT '0',
  `X_absence` float NOT NULL DEFAULT '0',
  `Y_absence` float NOT NULL DEFAULT '0',
  `hauteur_entete_moyenne_general` float NOT NULL DEFAULT '0',
  `X_avis_cons` float NOT NULL DEFAULT '0',
  `Y_avis_cons` float NOT NULL DEFAULT '0',
  `longeur_avis_cons` float NOT NULL DEFAULT '0',
  `hauteur_avis_cons` float NOT NULL DEFAULT '0',
  `cadre_avis_cons` tinyint(4) NOT NULL DEFAULT '0',
  `X_sign_chef` float NOT NULL DEFAULT '0',
  `Y_sign_chef` float NOT NULL DEFAULT '0',
  `longeur_sign_chef` float NOT NULL DEFAULT '0',
  `hauteur_sign_chef` float NOT NULL DEFAULT '0',
  `cadre_sign_chef` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_filigrame` tinyint(4) NOT NULL DEFAULT '0',
  `texte_filigrame` varchar(100) NOT NULL DEFAULT '',
  `affiche_logo_etab` tinyint(4) NOT NULL DEFAULT '0',
  `entente_mel` tinyint(4) NOT NULL DEFAULT '0',
  `entente_tel` tinyint(4) NOT NULL DEFAULT '0',
  `entente_fax` tinyint(4) NOT NULL DEFAULT '0',
  `L_max_logo` tinyint(4) NOT NULL DEFAULT '0',
  `H_max_logo` tinyint(4) NOT NULL DEFAULT '0',
  `toute_moyenne_meme_col` tinyint(4) NOT NULL DEFAULT '0',
  `active_reperage_eleve` tinyint(4) NOT NULL DEFAULT '0',
  `couleur_reperage_eleve1` smallint(6) NOT NULL DEFAULT '0',
  `couleur_reperage_eleve2` smallint(6) NOT NULL DEFAULT '0',
  `couleur_reperage_eleve3` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_entete` tinyint(4) NOT NULL DEFAULT '0',
  `couleur_categorie_entete1` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_entete2` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_entete3` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_cote` tinyint(4) NOT NULL DEFAULT '0',
  `couleur_categorie_cote1` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_cote2` smallint(6) NOT NULL DEFAULT '0',
  `couleur_categorie_cote3` smallint(6) NOT NULL DEFAULT '0',
  `couleur_moy_general` tinyint(4) NOT NULL DEFAULT '0',
  `couleur_moy_general1` smallint(6) NOT NULL DEFAULT '0',
  `couleur_moy_general2` smallint(6) NOT NULL DEFAULT '0',
  `couleur_moy_general3` smallint(6) NOT NULL DEFAULT '0',
  `titre_entete_matiere` varchar(50) NOT NULL DEFAULT '',
  `titre_entete_coef` varchar(20) NOT NULL DEFAULT '',
  `titre_entete_nbnote` varchar(20) NOT NULL DEFAULT '',
  `titre_entete_rang` varchar(20) NOT NULL DEFAULT '',
  `titre_entete_appreciation` varchar(50) NOT NULL DEFAULT '',
  `active_coef_sousmoyene` tinyint(4) NOT NULL DEFAULT '0',
  `arrondie_choix` float NOT NULL DEFAULT '0',
  `nb_chiffre_virgule` tinyint(4) NOT NULL DEFAULT '0',
  `chiffre_avec_zero` tinyint(4) NOT NULL DEFAULT '0',
  `autorise_sous_matiere` tinyint(4) NOT NULL DEFAULT '0',
  `affichage_haut_responsable` tinyint(4) NOT NULL DEFAULT '0',
  `entete_model_bulletin` tinyint(4) NOT NULL DEFAULT '0',
  `ordre_entete_model_bulletin` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_etab_origine` tinyint(4) NOT NULL DEFAULT '0',
  `imprime_pour` tinyint(4) NOT NULL DEFAULT '0',
  `largeur_matiere` float NOT NULL DEFAULT '0',
  `nom_etab_gras` tinyint(4) NOT NULL DEFAULT '0',
  `taille_texte_date_edition` float NOT NULL,
  `taille_texte_matiere` float NOT NULL,
  `active_moyenne_general` tinyint(4) NOT NULL,
  `titre_bloc_avis_conseil` varchar(50) NOT NULL,
  `taille_titre_bloc_avis_conseil` float NOT NULL,
  `taille_profprincipal_bloc_avis_conseil` float NOT NULL,
  `affiche_fonction_chef` tinyint(4) NOT NULL,
  `taille_texte_fonction_chef` float NOT NULL,
  `taille_texte_identitee_chef` float NOT NULL,
  `tel_image` varchar(20) NOT NULL,
  `tel_texte` varchar(20) NOT NULL,
  `fax_image` varchar(20) NOT NULL,
  `fax_texte` varchar(20) NOT NULL,
  `courrier_image` varchar(20) NOT NULL,
  `courrier_texte` varchar(20) NOT NULL,
  `largeur_bloc_eleve` float NOT NULL,
  `hauteur_bloc_eleve` float NOT NULL,
  `largeur_bloc_adresse` float NOT NULL,
  `hauteur_bloc_adresse` float NOT NULL,
  `largeur_bloc_datation` float NOT NULL,
  `hauteur_bloc_datation` float NOT NULL,
  `taille_texte_classe` float NOT NULL,
  `type_texte_classe` varchar(1) NOT NULL,
  `taille_texte_annee` float NOT NULL,
  `type_texte_annee` varchar(1) NOT NULL,
  `taille_texte_periode` float NOT NULL,
  `type_texte_periode` varchar(1) NOT NULL,
  `taille_texte_categorie_cote` float NOT NULL,
  `taille_texte_categorie` float NOT NULL,
  `type_texte_date_datation` varchar(1) NOT NULL,
  `cadre_adresse` tinyint(4) NOT NULL,
  `centrage_logo` tinyint(4) NOT NULL DEFAULT '0',
  `Y_centre_logo` float NOT NULL DEFAULT '18',
  `ajout_cadre_blanc_photo` tinyint(4) NOT NULL DEFAULT '0',
  `affiche_moyenne_mini_general` tinyint(4) NOT NULL DEFAULT '1',
  `affiche_moyenne_maxi_general` tinyint(4) NOT NULL DEFAULT '1',
  `affiche_date_edition` tinyint(4) NOT NULL DEFAULT '1',
  `affiche_ine` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_model_bulletin`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `model_bulletin`
--

INSERT INTO `model_bulletin` (`id_model_bulletin`, `nom_model_bulletin`, `active_bloc_datation`, `active_bloc_eleve`, `active_bloc_adresse_parent`, `active_bloc_absence`, `active_bloc_note_appreciation`, `active_bloc_avis_conseil`, `active_bloc_chef`, `active_photo`, `active_coef_moyenne`, `active_nombre_note`, `active_nombre_note_case`, `active_moyenne`, `active_moyenne_eleve`, `active_moyenne_classe`, `active_moyenne_min`, `active_moyenne_max`, `active_regroupement_cote`, `active_entete_regroupement`, `active_moyenne_regroupement`, `active_rang`, `active_graphique_niveau`, `active_appreciation`, `affiche_doublement`, `affiche_date_naissance`, `affiche_dp`, `affiche_nom_court`, `affiche_effectif_classe`, `affiche_numero_impression`, `caractere_utilse`, `X_parent`, `Y_parent`, `X_eleve`, `Y_eleve`, `cadre_eleve`, `X_datation_bul`, `Y_datation_bul`, `cadre_datation_bul`, `hauteur_info_categorie`, `X_note_app`, `Y_note_app`, `longeur_note_app`, `hauteur_note_app`, `largeur_coef_moyenne`, `largeur_nombre_note`, `largeur_d_une_moyenne`, `largeur_niveau`, `largeur_rang`, `X_absence`, `Y_absence`, `hauteur_entete_moyenne_general`, `X_avis_cons`, `Y_avis_cons`, `longeur_avis_cons`, `hauteur_avis_cons`, `cadre_avis_cons`, `X_sign_chef`, `Y_sign_chef`, `longeur_sign_chef`, `hauteur_sign_chef`, `cadre_sign_chef`, `affiche_filigrame`, `texte_filigrame`, `affiche_logo_etab`, `entente_mel`, `entente_tel`, `entente_fax`, `L_max_logo`, `H_max_logo`, `toute_moyenne_meme_col`, `active_reperage_eleve`, `couleur_reperage_eleve1`, `couleur_reperage_eleve2`, `couleur_reperage_eleve3`, `couleur_categorie_entete`, `couleur_categorie_entete1`, `couleur_categorie_entete2`, `couleur_categorie_entete3`, `couleur_categorie_cote`, `couleur_categorie_cote1`, `couleur_categorie_cote2`, `couleur_categorie_cote3`, `couleur_moy_general`, `couleur_moy_general1`, `couleur_moy_general2`, `couleur_moy_general3`, `titre_entete_matiere`, `titre_entete_coef`, `titre_entete_nbnote`, `titre_entete_rang`, `titre_entete_appreciation`, `active_coef_sousmoyene`, `arrondie_choix`, `nb_chiffre_virgule`, `chiffre_avec_zero`, `autorise_sous_matiere`, `affichage_haut_responsable`, `entete_model_bulletin`, `ordre_entete_model_bulletin`, `affiche_etab_origine`, `imprime_pour`, `largeur_matiere`, `nom_etab_gras`, `taille_texte_date_edition`, `taille_texte_matiere`, `active_moyenne_general`, `titre_bloc_avis_conseil`, `taille_titre_bloc_avis_conseil`, `taille_profprincipal_bloc_avis_conseil`, `affiche_fonction_chef`, `taille_texte_fonction_chef`, `taille_texte_identitee_chef`, `tel_image`, `tel_texte`, `fax_image`, `fax_texte`, `courrier_image`, `courrier_texte`, `largeur_bloc_eleve`, `hauteur_bloc_eleve`, `largeur_bloc_adresse`, `hauteur_bloc_adresse`, `largeur_bloc_datation`, `hauteur_bloc_datation`, `taille_texte_classe`, `type_texte_classe`, `taille_texte_annee`, `type_texte_annee`, `taille_texte_periode`, `type_texte_periode`, `taille_texte_categorie_cote`, `taille_texte_categorie`, `type_texte_date_datation`, `cadre_adresse`, `centrage_logo`, `Y_centre_logo`, `ajout_cadre_blanc_photo`, `affiche_moyenne_mini_general`, `affiche_moyenne_maxi_general`, `affiche_date_edition`, `affiche_ine`) VALUES
(1, 'Standard', '1', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 'Arial', 110, 40, 5, 40, 1, 110, 5, 1, 5, 5, 72, 200, 175, 8, 8, 10, 18, 5, 5, 246.3, 5, 5, 250, 130, 37, 1, 138, 250, 67, 37, 0, 0, 'DUPLICATA INTERNET', 1, 1, 1, 1, 75, 75, 0, 1, 255, 255, 207, 1, 239, 239, 239, 1, 239, 239, 239, 1, 239, 239, 239, 'Matière', 'coef.', 'nb. n.', 'rang', 'Appréciation / Conseils', 0, 0.01, 2, 0, 1, 1, 1, 1, 0, 0, 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '', 0, '', 0, 0, '', 0, 0, 18, 0, 1, 1, 1, 0),
(2, 'Standard avec photo', '1', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 'Arial', 110, 40, 5, 40, 1, 110, 5, 1, 5, 5, 72, 200, 175, 8, 8, 10, 18, 5, 5, 246.3, 5, 5, 250, 130, 37, 1, 138, 250, 67, 37, 0, 0, 'DUPLICATA INTERNET', 1, 1, 1, 1, 75, 75, 0, 1, 255, 255, 207, 1, 239, 239, 239, 1, 239, 239, 239, 1, 239, 239, 239, 'Matière', 'coef.', 'nb. n.', 'rang', 'Appréciation / Conseils', 0, 0, 2, 0, 1, 1, 1, 1, 0, 0, 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '', 0, '', 0, 0, '', 0, 0, 18, 0, 1, 1, 1, 0),
(3, 'Affiche tout', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Arial', 110, 40, 5, 40, 1, 110, 5, 1, 5, 5, 72, 200, 175, 8, 8, 10, 16.5, 6.5, 5, 246.3, 5, 5, 250, 130, 37, 1, 138, 250, 67, 37, 1, 0, 'DUPLICATA INTERNET', 1, 1, 1, 1, 75, 75, 1, 1, 255, 255, 207, 1, 239, 239, 239, 1, 239, 239, 239, 1, 239, 239, 239, 'Matière', 'coef.', 'nb. n.', 'rang', 'Appréciation / Conseils', 1, 0.01, 2, 0, 1, 1, 2, 1, 1, 1, 40, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '', 0, '', 0, 0, '', 0, 0, 18, 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `mod_alerte_divers`
--

DROP TABLE IF EXISTS `mod_alerte_divers`;
CREATE TABLE IF NOT EXISTS `mod_alerte_divers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `nomenclatures`
--

DROP TABLE IF EXISTS `nomenclatures`;
CREATE TABLE IF NOT EXISTS `nomenclatures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `nomenclatures_valeurs`
--

DROP TABLE IF EXISTS `nomenclatures_valeurs`;
CREATE TABLE IF NOT EXISTS `nomenclatures_valeurs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `valeur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notanet`
--

DROP TABLE IF EXISTS `notanet`;
CREATE TABLE IF NOT EXISTS `notanet` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `ine` text NOT NULL,
  `id_mat` int(4) NOT NULL,
  `notanet_mat` varchar(255) NOT NULL,
  `matiere` varchar(50) NOT NULL,
  `note` varchar(4) NOT NULL DEFAULT '',
  `note_notanet` varchar(4) NOT NULL,
  `id_classe` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_app`
--

DROP TABLE IF EXISTS `notanet_app`;
CREATE TABLE IF NOT EXISTS `notanet_app` (
  `login` varchar(50) NOT NULL,
  `id_mat` int(4) NOT NULL,
  `matiere` varchar(50) NOT NULL,
  `appreciation` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_avis`
--

DROP TABLE IF EXISTS `notanet_avis`;
CREATE TABLE IF NOT EXISTS `notanet_avis` (
  `login` varchar(50) NOT NULL,
  `favorable` enum('O','N','') NOT NULL,
  `avis` text NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_corresp`
--

DROP TABLE IF EXISTS `notanet_corresp`;
CREATE TABLE IF NOT EXISTS `notanet_corresp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_brevet` tinyint(4) NOT NULL,
  `id_mat` int(4) NOT NULL,
  `notanet_mat` varchar(255) NOT NULL DEFAULT '',
  `matiere` varchar(50) NOT NULL DEFAULT '',
  `statut` enum('imposee','optionnelle','non dispensee dans l etablissement') NOT NULL DEFAULT 'imposee',
  `mode` varchar(20) NOT NULL DEFAULT 'extract_moy',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_ele_type`
--

DROP TABLE IF EXISTS `notanet_ele_type`;
CREATE TABLE IF NOT EXISTS `notanet_ele_type` (
  `login` varchar(50) NOT NULL,
  `type_brevet` tinyint(4) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_saisie`
--

DROP TABLE IF EXISTS `notanet_saisie`;
CREATE TABLE IF NOT EXISTS `notanet_saisie` (
  `login` varchar(50) NOT NULL,
  `id_mat` int(4) DEFAULT NULL,
  `matiere` varchar(50) DEFAULT NULL,
  `note` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_socles`
--

DROP TABLE IF EXISTS `notanet_socles`;
CREATE TABLE IF NOT EXISTS `notanet_socles` (
  `login` varchar(50) NOT NULL,
  `b2i` enum('MS','ME','MN','AB','') NOT NULL,
  `a2` enum('MS','ME','MN','AB','') NOT NULL,
  `lv` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notanet_verrou`
--

DROP TABLE IF EXISTS `notanet_verrou`;
CREATE TABLE IF NOT EXISTS `notanet_verrou` (
  `id_classe` smallint(6) NOT NULL,
  `type_brevet` tinyint(4) NOT NULL,
  `verrouillage` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `code_pays` varchar(50) NOT NULL,
  `nom_pays` varchar(255) NOT NULL,
  PRIMARY KEY (`code_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `periodes`
--

DROP TABLE IF EXISTS `periodes`;
CREATE TABLE IF NOT EXISTS `periodes` (
  `nom_periode` varchar(50) NOT NULL DEFAULT '',
  `num_periode` int(11) NOT NULL DEFAULT '0',
  `verouiller` char(1) NOT NULL DEFAULT '',
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `date_verrouillage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`num_periode`,`id_classe`),
  KEY `id_classe` (`id_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `periodes`
--

INSERT INTO `periodes` (`nom_periode`, `num_periode`, `verouiller`, `id_classe`, `date_verrouillage`, `date_fin`) VALUES
('Séquentielle N°1', 1, 'N', 1, '2015-12-31 11:33:43', '2016-10-14 23:00:00'),
('Séquentielle N°2', 2, 'N', 1, '2015-12-31 11:33:43', '2016-12-09 23:00:00'),
('Période 8', 8, 'O', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Trimestrielle 1', 7, 'N', 1, '0000-00-00 00:00:00', '2015-12-29 23:00:00'),
('Seq 1', 1, 'N', 2, '0000-00-00 00:00:00', '2015-10-29 23:00:00'),
('Seq 2', 2, 'N', 2, '0000-00-00 00:00:00', '2015-11-29 23:00:00'),
('Trim 1', 3, 'N', 2, '0000-00-00 00:00:00', '2015-12-29 23:00:00'),
('Séquentielle N°1', 1, 'N', 3, '0000-00-00 00:00:00', '2015-12-09 23:00:00'),
('Séquentielle N°2', 2, 'N', 3, '0000-00-00 00:00:00', '2015-12-29 23:00:00'),
('Trimestrielle N°1', 3, 'N', 3, '0000-00-00 00:00:00', '2016-01-05 23:00:00'),
('Séquentielle N°3', 4, 'N', 3, '0000-00-00 00:00:00', '2016-01-15 23:00:00'),
('sequentiellel1', 1, 'N', 4, '0000-00-00 00:00:00', '2015-11-29 23:00:00'),
('sequentiellel2', 2, 'N', 4, '0000-00-00 00:00:00', '2015-12-19 23:00:00'),
('Trimestrielle 1', 3, 'N', 4, '0000-00-00 00:00:00', '2015-11-29 23:00:00'),
('Séquentielle N°1', 1, 'N', 6, '2015-12-31 11:44:23', '2015-12-09 23:00:00'),
('Séquentielle N°2', 2, 'N', 6, '2015-12-31 11:44:23', '2015-12-29 23:00:00'),
('Trimestrielle N°1', 3, 'N', 6, '2015-12-31 11:44:23', '2016-01-05 23:00:00'),
('Séquentielle N°3', 4, 'N', 6, '2015-12-31 11:44:23', '2016-01-15 23:00:00'),
('période 5', 5, 'N', 6, '2015-12-31 11:44:23', '1999-11-29 23:00:00'),
('période 6', 6, 'N', 6, '2015-12-31 11:44:23', '1999-11-29 23:00:00'),
('Séquentiel N°1', 1, 'N', 7, '2016-01-02 08:00:16', '2015-11-29 23:00:00'),
('Trimestriel N°1', 2, 'N', 7, '2016-01-02 08:00:16', '2015-12-29 23:00:00'),
('Séquentiel N°3', 3, 'N', 7, '2016-01-02 08:00:16', '2016-01-05 23:00:00'),
('Trimestriel N°2', 4, 'N', 7, '2016-01-02 08:00:16', '2016-01-19 23:00:00'),
('Séquentiel N°5', 5, 'N', 7, '2016-01-02 08:00:16', '2016-02-19 23:00:00'),
('Annuel', 6, 'O', 7, '2016-01-05 04:27:09', '2016-03-19 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `repertoire` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `ouvert` char(1) DEFAULT 'n',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `plugins_autorisations`
--

DROP TABLE IF EXISTS `plugins_autorisations`;
CREATE TABLE IF NOT EXISTS `plugins_autorisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) NOT NULL,
  `fichier` varchar(100) NOT NULL,
  `user_statut` varchar(50) NOT NULL,
  `auth` char(1) DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `plugins_menus`
--

DROP TABLE IF EXISTS `plugins_menus`;
CREATE TABLE IF NOT EXISTS `plugins_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) NOT NULL,
  `user_statut` varchar(50) NOT NULL,
  `titre_item` varchar(255) NOT NULL,
  `lien_item` varchar(255) NOT NULL,
  `description_item` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
CREATE TABLE IF NOT EXISTS `preferences` (
  `login` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  KEY `login_name` (`login`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `preferences`
--

INSERT INTO `preferences` (`login`, `name`, `value`) VALUES
('histoire', 'marge_pdf_mes_moyennes', '7'),
('histoire', 'hauteur_ligne_pdf_mes_moyennes', '10'),
('scolar', 'rn_couleurs_alternees', 'y'),
('scolar', 'bull_simp_pref_couleur_alterne', 'y'),
('scolar', 'bull_simp_larg_tab', '680'),
('scolar', 'bull_simp_larg_col1', '120'),
('scolar', 'bull_simp_larg_col2', '38'),
('scolar', 'bull_simp_larg_col3', '38'),
('scolar', 'bull_simp_larg_col4', '20'),
('adonia', 'rn_couleurs_alternees', 'n'),
('math', 'vtn_pref_num_periode', '1'),
('math', 'vtn_pref_larg_tab', 'n'),
('math', 'vtn_pref_bord', 'n'),
('math', 'vtn_pref_couleur_alterne', 'y'),
('math', 'vtn_pref_aff_abs', 'n'),
('math', 'vtn_pref_aff_reg', 'n'),
('math', 'vtn_pref_aff_doub', 'n'),
('math', 'vtn_pref_aff_date_naiss', 'n'),
('math', 'vtn_pref_aff_rang', 'n'),
('math', 'vtn_pref_avec_moy_gen_periodes_precedentes', 'n'),
('math', 'vtn_pref_coloriser_resultats', 'n'),
('ADMIN', 'arch_bull_eff_tranche', '10'),
('ADMIN', 'arch_bull_nom_prenom', 'yes'),
('ADMIN', 'arch_bull_INE', 'yes'),
('ADMIN', 'arch_bull_annee_scolaire', 'yes'),
('ADMIN', 'arch_bull_date_edition', 'yes'),
('ADMIN', 'arch_bull_classe', 'yes'),
('ADMIN', 'dossier_archivage_pdf', 'bulletins_pdf_individuels_eleves_20151231'),
('adonia', 'export_cn', 'csv'),
('nono', 'export_cn', 'csv'),
('scolar', 'vtn_pref_coloriser_resultats', 'n'),
('scolar', 'vtn_pref_avec_moy_gen_periodes_precedentes', 'n'),
('scolar', 'vtn_pref_aff_rang', 'n'),
('scolar', 'vtn_pref_aff_doub', 'n'),
('scolar', 'vtn_pref_aff_date_naiss', 'n'),
('scolar', 'vtn_borne_couleur2', '20'),
('scolar', 'vtn_borne_couleur1', '13.4'),
('scolar', 'vtn_borne_couleur0', '6.7'),
('scolar', 'vtn_couleur_cellule2', ''),
('scolar', 'vtn_couleur_cellule1', ''),
('scolar', 'vtn_couleur_cellule0', ''),
('scolar', 'vtn_couleur_texte2', 'green'),
('scolar', 'vtn_couleur_texte1', 'orangered'),
('scolar', 'vtn_couleur_texte0', 'red'),
('sg', 'vtn_couleur_texte0', 'red'),
('sg', 'rn_couleurs_alternees', 'n'),
('scolar', 'vtn_pref_aff_reg', 'n'),
('scolar', 'vtn_pref_aff_abs', 'n'),
('scolar', 'vtn_pref_couleur_alterne', 'y'),
('scolar', 'vtn_pref_bord', 'n'),
('scolar', 'vtn_pref_num_periode', '1'),
('nono', 'vtn_pref_coloriser_resultats', 'y'),
('nono', 'vtn_pref_aff_rang', 'n'),
('nono', 'vtn_pref_aff_doub', 'n'),
('nono', 'vtn_pref_aff_reg', 'n'),
('nono', 'vtn_pref_aff_abs', 'n'),
('nono', 'vtn_pref_couleur_alterne', 'y'),
('nono', 'vtn_pref_bord', '1'),
('nono', 'vtn_pref_larg_tab', '680'),
('nono', 'vtn_pref_num_periode', '1'),
('nono', 'vtn_borne_couleur2', '20'),
('nono', 'vtn_borne_couleur1', '13.4'),
('nono', 'vtn_borne_couleur0', '6.7'),
('nono', 'vtn_couleur_cellule2', ''),
('nono', 'vtn_couleur_cellule1', ''),
('nono', 'vtn_couleur_cellule0', ''),
('nono', 'vtn_couleur_texte2', 'green'),
('nono', 'vtn_couleur_texte0', 'red'),
('nono', 'vtn_couleur_texte1', 'orangered'),
('scolar', 'vtn_pref_larg_tab', 'n'),
('sg', 'vtn_couleur_texte1', 'orangered'),
('sg', 'vtn_couleur_texte2', 'green'),
('sg', 'vtn_couleur_cellule0', ''),
('sg', 'vtn_couleur_cellule1', ''),
('sg', 'vtn_couleur_cellule2', ''),
('sg', 'vtn_borne_couleur0', '6.7'),
('sg', 'vtn_borne_couleur1', '13.4'),
('sg', 'vtn_borne_couleur2', '20'),
('sg', 'vtn_pref_num_periode', '1'),
('sg', 'vtn_pref_larg_tab', '680'),
('sg', 'vtn_pref_bord', '1'),
('sg', 'vtn_pref_couleur_alterne', 'y'),
('sg', 'vtn_pref_aff_abs', 'y'),
('sg', 'vtn_pref_aff_reg', 'y'),
('sg', 'vtn_pref_aff_doub', 'y'),
('sg', 'vtn_pref_aff_date_naiss', 'y'),
('sg', 'vtn_pref_aff_rang', 'n'),
('sg', 'vtn_pref_avec_moy_gen_periodes_precedentes', 'n'),
('sg', 'vtn_pref_coloriser_resultats', 'y');

-- --------------------------------------------------------

--
-- Structure de la table `ref_wiki`
--

DROP TABLE IF EXISTS `ref_wiki`;
CREATE TABLE IF NOT EXISTS `ref_wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_2` (`ref`),
  KEY `ref` (`ref`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `ref_wiki`
--

INSERT INTO `ref_wiki` (`id`, `ref`, `url`) VALUES
(1, 'enseignement_invisible', 'http://www.sylogix.org/projects/gepi/wiki/Enseignement_invisible');

-- --------------------------------------------------------

--
-- Structure de la table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
CREATE TABLE IF NOT EXISTS `responsables` (
  `ereno` varchar(10) NOT NULL DEFAULT '',
  `nom1` varchar(50) NOT NULL,
  `prenom1` varchar(50) NOT NULL,
  `adr1` varchar(100) NOT NULL DEFAULT '',
  `adr1_comp` varchar(100) NOT NULL DEFAULT '',
  `commune1` varchar(50) NOT NULL DEFAULT '',
  `cp1` varchar(6) NOT NULL DEFAULT '',
  `nom2` varchar(50) NOT NULL,
  `prenom2` varchar(50) NOT NULL,
  `adr2` varchar(100) NOT NULL DEFAULT '',
  `adr2_comp` varchar(100) NOT NULL DEFAULT '',
  `commune2` varchar(50) NOT NULL DEFAULT '',
  `cp2` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`ereno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `responsables2`
--

DROP TABLE IF EXISTS `responsables2`;
CREATE TABLE IF NOT EXISTS `responsables2` (
  `ele_id` varchar(10) NOT NULL,
  `pers_id` varchar(10) NOT NULL,
  `resp_legal` varchar(1) NOT NULL,
  `pers_contact` varchar(1) NOT NULL,
  `acces_sp` varchar(1) NOT NULL,
  `envoi_bulletin` char(1) NOT NULL DEFAULT 'n' COMMENT 'Envoi des bulletins pour les resp_legal=0',
  KEY `pers_id` (`pers_id`),
  KEY `ele_id` (`ele_id`),
  KEY `resp_legal` (`resp_legal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `responsables2`
--

INSERT INTO `responsables2` (`ele_id`, `pers_id`, `resp_legal`, `pers_contact`, `acces_sp`, `envoi_bulletin`) VALUES
('e000000008', 'p000000001', '1', '1', '', 'n'),
('e000000007', 'p000000001', '1', '1', '', 'n');

-- --------------------------------------------------------

--
-- Structure de la table `resp_adr`
--

DROP TABLE IF EXISTS `resp_adr`;
CREATE TABLE IF NOT EXISTS `resp_adr` (
  `adr_id` varchar(10) NOT NULL,
  `adr1` varchar(100) NOT NULL,
  `adr2` varchar(100) NOT NULL,
  `adr3` varchar(100) NOT NULL,
  `adr4` varchar(100) NOT NULL,
  `cp` varchar(6) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  PRIMARY KEY (`adr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `resp_adr`
--

INSERT INTO `resp_adr` (`adr_id`, `adr1`, `adr2`, `adr3`, `adr4`, `cp`, `pays`, `commune`) VALUES
('a000000001', 'nono@gmail.com', '', '', '', '', 'Cameroun', 'u');

-- --------------------------------------------------------

--
-- Structure de la table `resp_pers`
--

DROP TABLE IF EXISTS `resp_pers`;
CREATE TABLE IF NOT EXISTS `resp_pers` (
  `pers_id` varchar(10) NOT NULL,
  `login` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `civilite` varchar(5) NOT NULL,
  `tel_pers` varchar(255) DEFAULT NULL,
  `tel_port` varchar(255) DEFAULT NULL,
  `tel_prof` varchar(255) DEFAULT NULL,
  `mel` varchar(100) NOT NULL,
  `adr_id` varchar(10) NOT NULL,
  PRIMARY KEY (`pers_id`),
  KEY `login` (`login`),
  KEY `adr_id` (`adr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `resp_pers`
--

INSERT INTO `resp_pers` (`pers_id`, `login`, `nom`, `prenom`, `civilite`, `tel_pers`, `tel_port`, `tel_prof`, `mel`, `adr_id`) VALUES
('p000000001', '', 'nono', 'nono', 'M.', '', '', '', '', 'a000000001');

-- --------------------------------------------------------

--
-- Structure de la table `rss_users`
--

DROP TABLE IF EXISTS `rss_users`;
CREATE TABLE IF NOT EXISTS `rss_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(30) NOT NULL,
  `user_uri` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `salle_cours`
--

DROP TABLE IF EXISTS `salle_cours`;
CREATE TABLE IF NOT EXISTS `salle_cours` (
  `id_salle` int(3) NOT NULL AUTO_INCREMENT,
  `numero_salle` varchar(10) NOT NULL,
  `nom_salle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `setting`
--

INSERT INTO `setting` (`NAME`, `VALUE`) VALUES
('version', '1.6.7'),
('sessionMaxLength', '30'),
('Impression', '<center><p class = "grand">Gestion des Elèves Par Internet</p></center>\r\n<br />\r\n<p class = "grand">Qu''est-ce que GEPI ?</p>\r\n\r\n<p>Afin d''étudier les modalités d''informatisation des bulletins scolaires : notes et appréciations via Internet, une expérimentation (baptisée Gestion des Elèves Par Internet)a été mise en place. Cette expérimentation concerne les classes suivantes : \r\n<br />* ....\r\n<br />* ....\r\n<br />\r\n<br />\r\nCeci vous concerne car vous êtes professeur enseignant dans l''une ou l''autre de ces classes.\r\n<br />\r\n<br />\r\nA partir de la réception de ce document, vous pourrez remplir les bulletins informatisés :\r\n<span class = "norme">\r\n<UL><li>soit au lycée à partir de n''importe quel poste connecté à Internet,\r\n<li>soit chez vous si vous disposez d''une connexion Internet.\r\n</ul>\r\n</span>\r\n<p class = "grand">Comment accéder au module de saisie (notes et appréciations) :</p>\r\n<span class = "norme">\r\n<UL>\r\n    <LI>Se connecter à Internet\r\n    <LI>Lancer un navigateur (FireFox de préférence, Opera, Internet Explorer, ...)\r\n    <LI>Se connecter au site : https://adresse_du_site/gepi\r\n    <LI>Après quelques instants une page apparaît vous invitant à entrer un nom d''identifiant et un mot de passe (cesinformations figurent en haut de cette page).\r\n    <br />ATTENTION : votre mot de passe est strictement confidentiel.\r\n    <br />\r\n    <br />Une fois ces informations fournies, cliquez sur le bouton "Ok".\r\n    <LI> Après quelques instants une page d''accueil apparaît.<br />\r\nLa première fois, Gepi vous demande de changer votre mot de passe.\r\nChoisissez-en un facile à retenir, mais non trivial (évitez toute date\r\nde naissance, nom d''animal familier, prénom, etc.), et contenant\r\nlettre(s), chiffre(s), et caractère(s) non alphanumérique(s).<br />\r\nLes fois suivantes, vous arriverez directement au menu général de\r\nl''application. Pour bien prendre connaissance des possibilités de\r\nl''application, n''hésitez pas à essayer tous les liens disponibles !\r\n</ul></span>\r\n<p class = "grand">Remarque :</p>\r\n<p>GEPI est prévu pour que chaque professeur ne puisse modifier les notes ou les appréciations que dans les rubriques qui le concernent et uniquement pour ses élèves.\r\n<br />\r\nJe reste à votre disposition pour tout renseignement complémentaire.\r\n    <br />\r\n    Le proviseur adjoint\r\n</p>'),
('gepiYear', '2016/2017'),
('gepiSchoolName', 'Collège Ste Jeanne d''Arc'),
('gepiSchoolAdress1', 'Secrétariat à l''éducation'),
('gepiSchoolAdress2', '113'),
('gepiSchoolZipCode', 'BP 130'),
('gepiSchoolCity', ''),
('gepiAdminAdress', ''),
('titlesize', '14'),
('textsize', '8'),
('cellpadding', '3'),
('cellspacing', '1'),
('largeurtableau', '800'),
('col_matiere_largeur', '150'),
('begin_bookings', '1472594400'),
('end_bookings', '1504130400'),
('max_size', '307200'),
('total_max_size', '5242880'),
('col_note_largeur', '30'),
('active_cahiers_texte', 'y'),
('active_carnets_notes', 'y'),
('logo_etab', 'logo_etab.jpg'),
('longmin_pwd', '5'),
('duree_conservation_logs', '365'),
('GepiRubConseilProf', 'yes'),
('GepiRubConseilScol', 'yes'),
('bull_ecart_entete', '0'),
('gepi_prof_suivi', 'professeur principal'),
('gepi_cpe_suivi', 'C.P.E.'),
('GepiProfImprBul', 'yes'),
('GepiProfImprBulSettings', 'yes'),
('GepiScolImprBulSettings', 'yes'),
('GepiAdminImprBulSettings', 'yes'),
('GepiAccesReleveScol', 'yes'),
('GepiAccesReleveCpe', 'yes'),
('GepiAccesReleveProf', 'yes'),
('GepiAccesReleveProfTousEleves', 'yes'),
('GepiAccesReleveProfToutesClasses', 'yes'),
('GepiAccesReleveProfP', 'yes'),
('page_garde_imprime', 'no'),
('page_garde_texte', 'Madame, Monsieur<br/><br/>Veuillez trouvez ci-joint le bulletin scolaire de votre enfant. Nous vous rappelons que la journ&eacute;e <span style="font-weight: bold;">Portes ouvertes</span> du Lyc&eacute;e aura lieu samedi 20 mai entre 10 h et 17 h.<br/><br/>Veuillez agr&eacute;er, Madame, Monsieur, l''expression de mes meilleurs sentiments.<br/><br/><div style="text-align: right;">Le proviseur</div>'),
('page_garde_padding_top', '4'),
('page_garde_padding_left', '11'),
('page_garde_padding_text', '6'),
('addressblock_padding_top', '400'),
('addressblock_padding_right', '200'),
('addressblock_padding_text', '200'),
('addressblock_length', '600'),
('cnv_addressblock_dim_144', 'y'),
('p_bulletin_margin', '5'),
('bull_espace_avis', '5'),
('change_ordre_aff_matieres', 'ok'),
('disable_login', 'no'),
('bull_formule_bas', 'Bulletin à conserver précieusement. Aucun duplicata ne sera délivré. - GEPI : solution libre de gestion et de suivi des résultats scolaires.'),
('delai_devoirs', '7'),
('active_module_absence', 'y'),
('active_module_absence_professeur', 'y'),
('gepiSchoolTel', 'Tel: 693225577/'),
('gepiSchoolFax', '679035717'),
('gepiSchoolEmail', 'masterpece09@gmail.com'),
('col_boite_largeur', '120'),
('bull_mention_doublant', 'no'),
('bull_affiche_numero', 'no'),
('nombre_tentatives_connexion', '5'),
('temps_compte_verrouille', '60'),
('bull_affiche_appreciations', 'y'),
('bull_affiche_absences', 'y'),
('bull_affiche_avis', 'y'),
('bull_affiche_aid', 'y'),
('bull_affiche_formule', 'y'),
('bull_affiche_signature', 'y'),
('l_max_aff_trombinoscopes', '120'),
('h_max_aff_trombinoscopes', '160'),
('l_max_imp_trombinoscopes', '70'),
('h_max_imp_trombinoscopes', '100'),
('bull_affiche_tel', 'n'),
('bull_affiche_fax', 'n'),
('note_autre_que_sur_20', 'F'),
('gepi_denom_boite', 'boite'),
('gepi_denom_boite_genre', 'f'),
('addressblock_font_size', '12'),
('addressblock_logo_etab_prop', '50'),
('addressblock_classe_annee', '35'),
('bull_ecart_bloc_nom', '1'),
('addressblock_debug', 'n'),
('GepiAccesReleveEleve', 'yes'),
('GepiAccesCahierTexteEleve', 'yes'),
('GepiAccesReleveParent', 'yes'),
('GepiAccesCahierTexteParent', 'yes'),
('enable_password_recovery', 'no'),
('GepiPasswordReinitProf', 'yes'),
('GepiPasswordReinitScolarite', 'no'),
('GepiPasswordReinitCpe', 'no'),
('GepiPasswordReinitAdmin', 'yes'),
('GepiPasswordReinitEleve', 'yes'),
('GepiPasswordReinitParent', 'yes'),
('cahier_texte_acces_public', 'no'),
('GepiAccesEquipePedaEleve', 'yes'),
('GepiAccesEquipePedaEmailEleve', 'no'),
('GepiAccesEquipePedaParent', 'yes'),
('GepiAccesEquipePedaEmailParent', 'no'),
('GepiAccesBulletinSimpleParent', 'yes'),
('GepiAccesBulletinSimpleEleve', 'yes'),
('GepiAccesGraphEleve', 'yes'),
('GepiAccesGraphParent', 'yes'),
('choix_bulletin', '2'),
('min_max_moyclas', '0'),
('bull_categ_font_size_avis', '10'),
('bull_police_avis', 'Times New Roman'),
('bull_font_style_avis', 'Normal'),
('bull_affiche_eleve_une_ligne', 'yes'),
('bull_mention_nom_court', 'yes'),
('option_modele_bulletin', '3'),
('security_alert_email_admin', 'yes'),
('security_alert_email_min_level', '2'),
('security_alert1_normal_cumulated_level', '3'),
('security_alert1_normal_email_admin', 'yes'),
('security_alert1_normal_block_user', 'no'),
('security_alert1_probation_cumulated_level', '1'),
('security_alert1_probation_email_admin', 'yes'),
('security_alert1_probation_block_user', 'no'),
('security_alert2_normal_cumulated_level', '6'),
('security_alert2_normal_email_admin', 'yes'),
('security_alert2_normal_block_user', 'yes'),
('security_alert2_probation_cumulated_level', '3'),
('security_alert2_probation_email_admin', 'yes'),
('security_alert2_probation_block_user', 'yes'),
('deverouillage_auto_periode_suivante', 'n'),
('bull_intitule_app', 'Appréciations / Conseils'),
('GepiAccesMoyennesProf', 'yes'),
('GepiAccesMoyennesProfTousEleves', 'yes'),
('GepiAccesMoyennesProfToutesClasses', 'yes'),
('GepiAccesBulletinSimpleProf', 'yes'),
('GepiAccesBulletinSimpleProfTousEleves', 'yes'),
('GepiAccesBulletinSimpleProfToutesClasses', 'yes'),
('gepi_stylesheet', 'style'),
('edt_calendrier_ouvert', 'y'),
('scolarite_modif_cours', 'y'),
('active_annees_anterieures', 'y'),
('active_notanet', 'n'),
('longmax_login', '8'),
('autorise_edt_tous', 'y'),
('autorise_edt_admin', 'y'),
('autorise_edt_eleve', 'no'),
('utiliserMenuBarre', 'yes'),
('active_absences_parents', 'no'),
('creneau_different', 'n'),
('active_inscription', 'n'),
('active_inscription_utilisateurs', 'n'),
('mod_inscription_explication', '<p> <strong>Pr&eacute;sentation des dispositifs du Lyc&eacute;e dans les coll&egrave;ges qui organisent des rencontres avec les parents.</strong> <br />\r\n<br />\r\nChacun d&rsquo;entre vous conna&icirc;t la situation dans laquelle sont plac&eacute;s les &eacute;tablissements : </p>\r\n<ul>\r\n    <li>baisse d&eacute;mographique</li>\r\n    <li>r&eacute;gulation des moyens</li>\r\n    <li>- ... </li>\r\n</ul>\r\nCette ann&eacute;e encore nous devons &ecirc;tre pr&eacute;sents dans les r&eacute;unions organis&eacute;es au sein des coll&egrave;ges afin de pr&eacute;senter nos sp&eacute;cificit&eacute;s, notre valeur ajout&eacute;e, les &eacute;volution du projet, le label international, ... <br />\r\nsur cette feuille, vous avez la possibilit&eacute; de vous inscrire afin d''intervenir dans un ou plusieurs coll&egrave;ges selon vos convenances.'),
('mod_inscription_titre', 'Intervention dans les collèges'),
('active_ateliers', 'n'),
('GepiAccesRestrAccesAppProfP', 'yes'),
('l_resize_trombinoscopes', '120'),
('h_resize_trombinoscopes', '160'),
('multisite', 'n'),
('statuts_prives', 'n'),
('mod_edt_gr', 'n'),
('use_ent', 'n'),
('rss_cdt_eleve', 'n'),
('auth_locale', 'yes'),
('auth_ldap', 'no'),
('auth_sso', 'none'),
('ldap_write_access', 'no'),
('may_import_user_profile', 'no'),
('statut_utilisateur_defaut', 'professeur'),
('texte_visa_cdt', 'Cahier de textes visé ce jour <br />Le Principal <br /> M. XXXXX<br />'),
('visa_cdt_inter_modif_notices_visees', 'yes'),
('denomination_eleve', 'élève'),
('denomination_eleves', 'élèves'),
('denomination_professeur', 'professeur'),
('denomination_professeurs', 'professeurs'),
('denomination_responsable', 'responsable légal'),
('denomination_responsables', 'responsables légaux'),
('delais_apres_cloture', '0'),
('active_mod_ooo', 'n'),
('use_only_cdt', 'n'),
('edt_remplir_prof', 'n'),
('active_mod_genese_classes', 'y'),
('active_mod_ects', 'n'),
('GepiAccesSaisieEctsProf', 'no'),
('GepiAccesSaisieEctsPP', 'no'),
('GepiAccesSaisieEctsScolarite', 'yes'),
('GepiAccesRecapitulatifEctsScolarite', 'yes'),
('GepiAccesRecapitulatifEctsProf', 'yes'),
('GepiAccesEditionDocsEctsPP', 'no'),
('GepiAccesEditionDocsEctsScolarite', 'yes'),
('gepiSchoolStatut', 'prive_hors_contrat'),
('gepiSchoolAcademie', ''),
('note_autre_que_sur_referentiel', 'F'),
('referentiel_note', '20'),
('active_mod_apb', 'n'),
('active_mod_gest_aid', 'n'),
('unzipped_max_filesize', '10'),
('autorise_commentaires_mod_disc', 'no'),
('sso_cas_table', 'no'),
('encodage_nom_photo', 'yes'),
('alea_nom_photo', 'c868450d2018cee5e8475673db25228a'),
('gepi_en_production', 'y'),
('GepiAccesBulletinSimpleColonneMoyClasseResp', 'no'),
('GepiAccesBulletinSimpleColonneMoyClasseEleve', 'no'),
('MessagerieDelaisTest', '1'),
('MessagerieLargeurImg', '16'),
('mod_disc_terme_incident', 'incident'),
('mod_disc_terme_sanction', 'sanction'),
('GepiPeutCreerBoitesProf', 'yes'),
('active_recherche_lapsus', 'y'),
('active_bulletins', 'y'),
('ping_host', '173.194.40.183'),
('imprDiscProfAvtOOo', 'n'),
('groupe_de_groupes', 'groupe de groupes'),
('groupes_de_groupes', 'groupes de groupes'),
('abs_prof_modele_message_eleve', 'En raison de l''absence de __PROF_ABSENT__, le cours __COURS__ du __DATE_HEURE__ sera remplacé par un cours avec __PROF_REMPLACANT__ en salle __SALLE__.'),
('denom_groupe_de_groupes', 'ensemble de groupes'),
('denom_groupes_de_groupes', 'ensembles de groupes'),
('force_error_reporting', 'n'),
('utiliser_mb', 'y'),
('backup_directory', 'jf8q8sJu5WppAcwKi9z7Q48AB1Oz3KM5T4GL9p'),
('backupdir_lastchange', '1453635709'),
('utiliser_phpmailer', 'n'),
('phpmailer_smtp_auth', 'n'),
('phpmailer_securite', ''),
('phpmailer_debug', 'n'),
('gepiSchoolRne', ''),
('gepiSchoolPays', 'Cameroun'),
('gepiAdminNom', 'NOM_ADMIN_SITE'),
('gepiAdminPrenom', 'PRENOM_ADMIN_SITE'),
('gepiAdminFonction', ''),
('gepiAdminAdressPageLogin', 'y'),
('contact_admin_mailto', 'n'),
('envoi_mail_liste', 'n'),
('gepiAdminAdressFormHidden', 'n'),
('gepiPrefixeSujetMail', ''),
('mode_generation_pwd_majmin', 'y'),
('mode_generation_pwd_excl', 'n'),
('mode_email_resp', 'sconet'),
('mode_email_ele', 'sconet'),
('informer_scolarite_modif_mail', 'y'),
('email_dest_info_modif_mail', 'ce.XXXXXXXX@ac-xxxxx.fr'),
('email_dest_info_erreur_affect_grp', ''),
('ele_tel_pers', 'no'),
('ele_tel_port', 'yes'),
('ele_tel_prof', 'no'),
('type_bulletin_par_defaut', 'pdf'),
('exp_imp_chgt_etab', 'no'),
('output_mode_pdf', 'D'),
('aff_temoin_check_serveur', 'n'),
('url_racine_gepi', 'http://localhost:81/gepi'),
('ele_lieu_naissance', 'no'),
('avis_conseil_classe_a_la_mano', 'n'),
('gepi_denom_mention', 'mention'),
('num_enregistrement_cnil', ''),
('mode_generation_login', 'nnnnnnnp'),
('mode_generation_login_casse', 'min'),
('mode_generation_login_eleve', 'nnnnnnnnn_p'),
('mode_generation_login_eleve_casse', 'min'),
('mode_generation_login_responsable', 'nnnnnnnnnnnnnnnnnnnn'),
('mode_generation_login_responsable_casse', 'min'),
('FiltrageStrictAlphaNomPrenomPourLogin', 'n'),
('bul_rel_nom_matieres', 'nom_complet_matiere'),
('acces_app_ele_resp', 'manuel'),
('', 'no'),
('appreciations_types_profs', 'yes'),
('autoriser_correction_bulletin', 'yes'),
('autoriser_signalement_faute_app_prof', 'yes'),
('visuCorrectionsAppProposeesProfs', 'yes'),
('PeutAutoriserPPaCorrigerSesApp', 'yes'),
('GepiAccesCDTToutesClasses', 'yes'),
('GepiAccesVisuToutesEquipProf', 'yes'),
('GepiAccesGestElevesProf', 'yes'),
('AccesDerniereConnexionEleProfesseur', 'yes'),
('AccesStatConnexionEleProfesseur', 'yes'),
('AccesDetailConnexionEleProfesseur', 'yes'),
('AccesDerniereConnexionRespProfesseur', 'yes'),
('AccesStatConnexionRespProfesseur', 'yes'),
('AccesDetailConnexionRespProfesseur', 'yes'),
('AccesProf_EdtProfs', 'yes'),
('GepiAccesModifMaPhotoProfesseur', 'yes'),
('AccesFicheBienvenueProfesseur', 'yes'),
('AAProfTout', 'yes'),
('AAProfClasses', 'yes'),
('AAProfGroupes', 'yes'),
('GepiAccesPPTousElevesDeLaClasse', 'yes'),
('CommentairesTypesPP', 'yes'),
('autoriser_signalement_faute_app_pp', 'yes'),
('autoriser_valider_correction_app_pp', 'yes'),
('GepiAccesBulletinSimplePP', 'yes'),
('imprimerConvocationConseilClassePP', 'yes'),
('GepiProfImprRelSettings', 'yes'),
('GepiAccesGestElevesProfP', 'yes'),
('GepiAccesGestPhotoElevesProfP', 'yes'),
('AccesDerniereConnexionEleProfP', 'yes'),
('AccesStatConnexionEleProfP', 'yes'),
('AccesDetailConnexionEleProfP', 'yes'),
('AccesDerniereConnexionRespProfP', 'yes'),
('AccesStatConnexionRespProfP', 'yes'),
('AccesDetailConnexionRespProfP', 'yes'),
('AAProfPrinc', 'yes'),
('modExbPP', 'yes'),
('CommentairesTypesScol', 'no'),
('autoriser_signalement_faute_app_scol', 'no'),
('PeutDonnerAccesBullNotePeriodeCloseScol', 'yes'),
('PeutDonnerAccesBullAppPeriodeCloseScol', 'no'),
('AccesModifAppreciationScol', 'no'),
('GepiScolImprRelSettings', 'no'),
('PeutDonnerAccesCNPeriodeCloseScol', 'no'),
('GepiAccesCdtScol', 'yes'),
('GepiAccesCdtScolRestreint', 'no'),
('GepiAccesCdtVisa', 'no'),
('GepiAccesVisuToutesEquipScol', 'no'),
('ScolEditElevesGroupes', 'no'),
('GepiAccesTouteFicheEleveScolarite', 'no'),
('AccesDerniereConnexionEleScolarite', 'no'),
('AccesStatConnexionEleScolarite', 'no'),
('AccesDetailConnexionEleScolarite', 'no'),
('AccesDerniereConnexionRespScolarite', 'no'),
('AccesStatConnexionRespScolarite', 'no'),
('AccesDetailConnexionRespScolarite', 'no'),
('GepiAccesMajSconetScol', 'no'),
('GepiDiscDefinirLieuxScol', 'no'),
('GepiDiscDefinirRolesScol', 'no'),
('GepiDiscDefinirMesuresScol', 'no'),
('GepiDiscDefinirSanctionsScol', 'no'),
('GepiDiscDefinirNaturesScol', 'no'),
('GepiDiscDefinirCategoriesScol', 'no'),
('GepiDiscDefinirDestAlertesScol', 'no'),
('GepiAccesModifMaPhotoScolarite', 'no'),
('AccesFicheBienvenueScolarite', 'no'),
('ScolResetPassResp', 'no'),
('ScolResetPassEle', 'no'),
('AAScolTout', 'no'),
('AAScolResp', 'no'),
('droit_informer_evenement_scolarite', 'no'),
('GepiAccesReleveCpeTousEleves', 'yes'),
('GepiCpeImprRelSettings', 'yes'),
('GepiCpeImprBul', 'no'),
('GepiCpeImprBulSettings', 'no'),
('autoriser_signalement_faute_app_cpe', 'no'),
('GepiRubConseilCpe', 'no'),
('GepiRubConseilCpeTous', 'no'),
('CommentairesTypesCpe', 'no'),
('imprimerConvocationConseilClasseCpe', 'no'),
('GepiAccesCdtCpe', 'no'),
('GepiAccesCdtCpeRestreint', 'no'),
('AACpeTout', 'no'),
('AACpeResp', 'no'),
('GepiAccesModifMaPhotoCpe', 'no'),
('AccesFicheBienvenueCpe', 'no'),
('CpeResetPassResp', 'no'),
('CpeResetPassEle', 'no'),
('GepiAccesVisuToutesEquipCpe', 'no'),
('CpeEditElevesGroupes', 'no'),
('GepiAccesTouteFicheEleveCpe', 'no'),
('AccesDerniereConnexionEleCpe', 'no'),
('AccesStatConnexionEleCpe', 'no'),
('AccesDetailConnexionEleCpe', 'no'),
('AccesDerniereConnexionRespCpe', 'no'),
('AccesStatConnexionRespCpe', 'no'),
('AccesDetailConnexionRespCpe', 'no'),
('CpeAccesUploadPhotosEleves', 'no'),
('GepiAccesPanneauAffichageCpe', 'no'),
('GepiAccesAbsTouteClasseCpe', 'no'),
('AccesCpeAgregationAbs2', 'no'),
('droit_informer_evenement_cpe', 'no'),
('GepiAdminValidationCorrectionBulletins', 'yes'),
('GepiAccesModifMaPhotoAdministrateur', 'yes'),
('GepiAccesColMoyReleveEleve', 'no'),
('GepiAccesOptionsReleveEleve', 'no'),
('GepiAccesMoyClasseReleveEleve', 'no'),
('GepiAccesMoyMinClasseMaxReleveEleve', 'no'),
('GepiAccesEvalCumulEleve', 'no'),
('CDTPeutPointerTravailFaitEleve', 'no'),
('AccesFicheBienvenueEleve', 'no'),
('GepiAccesCpePPEmailEleve', 'no'),
('GepiAccesBulletinSimpleClasseEleve', 'no'),
('GepiAccesBulletinSimpleColonneMoyClasseMinMaxEleve', 'no'),
('GepiAccesGraphParamEleve', 'no'),
('GepiAccesGraphRangEleve', 'no'),
('AAEleve', 'no'),
('GepiAccesModifMaPhotoEleve', 'no'),
('GepiAccesEleTrombiTousEleves', 'no'),
('GepiAccesEleTrombiElevesClasse', 'no'),
('GepiAccesEleTrombiPersonnels', 'no'),
('GepiAccesEleTrombiProfsClasse', 'no'),
('visuEleDisc', 'no'),
('GepiAccesColMoyReleveParent', 'no'),
('GepiAccesOptionsReleveParent', 'no'),
('GepiAccesMoyClasseReleveParent', 'no'),
('GepiAccesMoyMinClasseMaxReleveParent', 'no'),
('CDTPeutPointerTravailFaitResponsable', 'no'),
('AccesFicheBienvenueResponsable', 'no'),
('GepiAccesCpePPEmailParent', 'no'),
('GepiAccesBulletinSimpleClasseResp', 'no'),
('GepiAccesBulletinSimpleColonneMoyClasseMinMaxResp', 'no'),
('GepiAccesGraphParamParent', 'no'),
('GepiAccesGraphRangParent', 'no'),
('AAResponsable', 'no'),
('visuRespDisc', 'no'),
('GepiMemesDroitsRespNonLegaux', 'no'),
('display_users', 'tous'),
('longmax_login_eleve', '11'),
('ImpressionParent', ''),
('ImpressionEleve', ''),
('ImpressionNombre', '1'),
('ImpressionNombreParent', '1'),
('ImpressionNombreEleve', '1'),
('param_module_trombinoscopes', 'no_gep'),
('active_module_trombinoscopes', 'y'),
('conversion_j_eleves_etablissements', 'effectuee'),
('sso_display_portail', 'no'),
('sso_url_portail', 'https://www.example.com'),
('sso_hide_logout', 'no'),
('GepiCahierTexteVersion', '1'),
('message_login', '1'),
('sso_scribe', 'no'),
('cas_attribut_prenom', ''),
('cas_attribut_nom', ''),
('cas_attribut_email', ''),
('verif_cdt_documents_index', 'fait'),
('cdt_afficher_volume_docs_joints', 'y'),
('graphe_affiche_moy_classe', 'oui'),
('cnBoitesModeMoy', '2'),
('bull_affiche_abs_tot', 'y'),
('bull_affiche_abs_nj', 'y'),
('bull_affiche_abs_ret', 'y'),
('active_mod_alerte', 'y'),
('PeutPosterMessageAdministrateur', 'y'),
('PeutPosterMessageScolarite', 'y'),
('PeutPosterMessageCpe', 'y'),
('bull_affiche_abs_cpe', 'y'),
('pb_maj', ''),
('PeutChoisirAlerteSansSonProfesseur', 'no'),
('mode_sauvegarde', 'mysqldump'),
('PeutChoisirAlerteSansSonScolarite', 'no'),
('PeutChoisirAlerteSansSonCpe', 'no'),
('PeutChoisirAlerteSansSonAdministrateur', 'no'),
('active_mod_discipline', 'y'),
('commentaires_mod_disc_visible_eleve', 'no'),
('commentaires_mod_disc_visible_parent', 'no'),
('mod_disc_terme_avertissement_fin_periode', 'avertissement de fin de période'),
('mod_disc_acces_avertissements', 'y'),
('active_mod_disc_pointage', 'n'),
('disc_pointage_aff_totaux_visu_ele', 'y'),
('disc_pointage_aff_totaux_ele', 'y'),
('disc_pointage_aff_totaux_resp', 'y'),
('mod_disc_terme_menus_incidents', 'menus incidents'),
('visuDiscProfClasses', 'no'),
('visuDiscProfGroupes', 'no'),
('GepiDiscDefinirLieuxCpe', 'no'),
('GepiDiscDefinirRolesCpe', 'no'),
('GepiDiscDefinirMesuresCpe', 'no'),
('GepiDiscDefinirSanctionsCpe', 'no'),
('GepiDiscDefinirNaturesCpe', 'no'),
('GepiDiscDefinirCategoriesCpe', 'no'),
('GepiDiscDefinirDestAlertesCpe', 'no'),
('DisciplineCpeChangeDeclarant', 'no'),
('DisciplineCpeChangeDefaut', 'no'),
('saisieDiscCpeAvt', 'no'),
('saisieDiscCpeAvtTous', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `signature_classes`
--

DROP TABLE IF EXISTS `signature_classes`;
CREATE TABLE IF NOT EXISTS `signature_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_fichier` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `signature_droits`
--

DROP TABLE IF EXISTS `signature_droits`;
CREATE TABLE IF NOT EXISTS `signature_droits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `signature_fichiers`
--

DROP TABLE IF EXISTS `signature_fichiers`;
CREATE TABLE IF NOT EXISTS `signature_fichiers` (
  `id_fichier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fichier` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fichier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sp_saisies`
--

DROP TABLE IF EXISTS `sp_saisies`;
CREATE TABLE IF NOT EXISTS `sp_saisies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `login` varchar(50) NOT NULL DEFAULT '',
  `date_sp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `commentaire` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sp_seuils`
--

DROP TABLE IF EXISTS `sp_seuils`;
CREATE TABLE IF NOT EXISTS `sp_seuils` (
  `id_seuil` int(11) NOT NULL AUTO_INCREMENT,
  `seuil` int(11) NOT NULL,
  `periode` char(1) NOT NULL DEFAULT 'y',
  `type` varchar(255) NOT NULL DEFAULT '',
  `administrateur` char(1) NOT NULL DEFAULT '',
  `scolarite` char(1) NOT NULL DEFAULT '',
  `cpe` char(1) NOT NULL DEFAULT '',
  `eleve` char(1) NOT NULL DEFAULT '',
  `responsable` char(1) NOT NULL DEFAULT '',
  `professeur_principal` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_seuil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sp_types_saisies`
--

DROP TABLE IF EXISTS `sp_types_saisies`;
CREATE TABLE IF NOT EXISTS `sp_types_saisies` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `rang` int(11) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sp_types_saisies`
--

INSERT INTO `sp_types_saisies` (`id_type`, `nom`, `description`, `rang`) VALUES
(1, 'nom saisi', 'desc nom ...', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sso_table_correspondance`
--

DROP TABLE IF EXISTS `sso_table_correspondance`;
CREATE TABLE IF NOT EXISTS `sso_table_correspondance` (
  `login_gepi` varchar(100) NOT NULL DEFAULT '',
  `login_sso` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`login_gepi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suivi_eleve_cpe`
--

DROP TABLE IF EXISTS `suivi_eleve_cpe`;
CREATE TABLE IF NOT EXISTS `suivi_eleve_cpe` (
  `id_suivi_eleve_cpe` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_suivi_eleve_cpe` varchar(30) NOT NULL DEFAULT '',
  `parqui_suivi_eleve_cpe` varchar(150) NOT NULL,
  `date_suivi_eleve_cpe` date NOT NULL DEFAULT '0000-00-00',
  `heure_suivi_eleve_cpe` time NOT NULL,
  `komenti_suivi_eleve_cpe` text NOT NULL,
  `niveau_message_suivi_eleve_cpe` varchar(1) NOT NULL,
  `action_suivi_eleve_cpe` varchar(2) NOT NULL,
  `support_suivi_eleve_cpe` tinyint(4) NOT NULL,
  `courrier_suivi_eleve_cpe` int(11) NOT NULL,
  PRIMARY KEY (`id_suivi_eleve_cpe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `synthese_app_classe`
--

DROP TABLE IF EXISTS `synthese_app_classe`;
CREATE TABLE IF NOT EXISTS `synthese_app_classe` (
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `periode` int(11) NOT NULL DEFAULT '0',
  `synthese` text NOT NULL,
  PRIMARY KEY (`id_classe`,`periode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `s_alerte_mail`
--

DROP TABLE IF EXISTS `s_alerte_mail`;
CREATE TABLE IF NOT EXISTS `s_alerte_mail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_classe` smallint(6) unsigned NOT NULL,
  `destinataire` varchar(50) NOT NULL DEFAULT '',
  `adresse` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_classe` (`id_classe`,`destinataire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_autres_sanctions`
--

DROP TABLE IF EXISTS `s_autres_sanctions`;
CREATE TABLE IF NOT EXISTS `s_autres_sanctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sanction` int(11) NOT NULL,
  `id_nature` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_avertissements`
--

DROP TABLE IF EXISTS `s_avertissements`;
CREATE TABLE IF NOT EXISTS `s_avertissements` (
  `id_avertissement` int(11) NOT NULL AUTO_INCREMENT,
  `login_ele` varchar(50) NOT NULL,
  `id_type_avertissement` int(11) DEFAULT NULL,
  `periode` int(11) DEFAULT NULL,
  `date_avertissement` datetime NOT NULL,
  `declarant` varchar(50) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id_avertissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_categories`
--

DROP TABLE IF EXISTS `s_categories`;
CREATE TABLE IF NOT EXISTS `s_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) NOT NULL DEFAULT '',
  `sigle` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `s_categories`
--

INSERT INTO `s_categories` (`id`, `categorie`, `sigle`) VALUES
(1, 'Travail', 'T'),
(2, 'Degradation', 'D'),
(3, 'Retards Répétés', 'R'),
(4, 'Oubli de matériel', 'O'),
(5, 'Insolence et comportement', 'IC'),
(6, 'Violence verbale ou physique', 'V'),
(7, 'Bavardages répétés', 'B');

-- --------------------------------------------------------

--
-- Structure de la table `s_communication`
--

DROP TABLE IF EXISTS `s_communication`;
CREATE TABLE IF NOT EXISTS `s_communication` (
  `id_communication` int(11) NOT NULL AUTO_INCREMENT,
  `id_incident` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `nature` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_communication`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_delegation`
--

DROP TABLE IF EXISTS `s_delegation`;
CREATE TABLE IF NOT EXISTS `s_delegation` (
  `id_delegation` int(11) NOT NULL AUTO_INCREMENT,
  `fct_delegation` varchar(100) NOT NULL,
  `fct_autorite` varchar(50) NOT NULL,
  `nom_autorite` varchar(50) NOT NULL,
  PRIMARY KEY (`id_delegation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_exclusions`
--

DROP TABLE IF EXISTS `s_exclusions`;
CREATE TABLE IF NOT EXISTS `s_exclusions` (
  `id_exclusion` int(11) NOT NULL AUTO_INCREMENT,
  `id_sanction` int(11) NOT NULL DEFAULT '0',
  `date_debut` date NOT NULL DEFAULT '0000-00-00',
  `heure_debut` varchar(20) NOT NULL DEFAULT '',
  `date_fin` date NOT NULL DEFAULT '0000-00-00',
  `heure_fin` varchar(20) NOT NULL DEFAULT '',
  `travail` text NOT NULL,
  `lieu` varchar(255) NOT NULL DEFAULT '',
  `nombre_jours` varchar(50) NOT NULL,
  `qualification_faits` text NOT NULL,
  `num_courrier` varchar(50) NOT NULL,
  `type_exclusion` varchar(50) NOT NULL,
  `id_signataire` int(11) NOT NULL,
  PRIMARY KEY (`id_exclusion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_incidents`
--

DROP TABLE IF EXISTS `s_incidents`;
CREATE TABLE IF NOT EXISTS `s_incidents` (
  `id_incident` int(11) NOT NULL AUTO_INCREMENT,
  `declarant` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `heure` varchar(20) NOT NULL,
  `id_lieu` int(11) NOT NULL,
  `nature` varchar(255) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `etat` varchar(20) NOT NULL,
  `message_id` varchar(50) NOT NULL,
  `primo_declarant` varchar(50) DEFAULT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id_incident`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `s_incidents`
--

INSERT INTO `s_incidents` (`id_incident`, `declarant`, `date`, `heure`, `id_lieu`, `nature`, `id_categorie`, `description`, `etat`, `message_id`, `primo_declarant`, `commentaire`) VALUES
(1, 'sg', '2016-01-02', '', 0, '', NULL, '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `s_lieux_incidents`
--

DROP TABLE IF EXISTS `s_lieux_incidents`;
CREATE TABLE IF NOT EXISTS `s_lieux_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `s_lieux_incidents`
--

INSERT INTO `s_lieux_incidents` (`id`, `lieu`) VALUES
(1, 'Classe'),
(2, 'Couloir'),
(3, 'Cour'),
(4, 'Réfectoire'),
(5, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `s_mesures`
--

DROP TABLE IF EXISTS `s_mesures`;
CREATE TABLE IF NOT EXISTS `s_mesures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('prise','demandee') DEFAULT NULL,
  `mesure` varchar(50) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `s_mesures`
--

INSERT INTO `s_mesures` (`id`, `type`, `mesure`, `commentaire`) VALUES
(1, 'prise', 'Travail supplémentaire', ''),
(2, 'prise', 'Mot dans le carnet de liaison', ''),
(3, 'demandee', 'Retenue', ''),
(4, 'demandee', 'Exclusion', '');

-- --------------------------------------------------------

--
-- Structure de la table `s_natures`
--

DROP TABLE IF EXISTS `s_natures`;
CREATE TABLE IF NOT EXISTS `s_natures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(255) NOT NULL DEFAULT '',
  `id_categorie` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_protagonistes`
--

DROP TABLE IF EXISTS `s_protagonistes`;
CREATE TABLE IF NOT EXISTS `s_protagonistes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_incident` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `statut` varchar(50) NOT NULL,
  `qualite` varchar(50) NOT NULL,
  `avertie` enum('N','O') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `s_protagonistes`
--

INSERT INTO `s_protagonistes` (`id`, `id_incident`, `login`, `statut`, `qualite`, `avertie`) VALUES
(1, 1, 'celestin', 'eleve', '', 'N');

-- --------------------------------------------------------

--
-- Structure de la table `s_qualites`
--

DROP TABLE IF EXISTS `s_qualites`;
CREATE TABLE IF NOT EXISTS `s_qualites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualite` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `s_qualites`
--

INSERT INTO `s_qualites` (`id`, `qualite`) VALUES
(1, 'Responsable'),
(2, 'Victime'),
(3, 'Témoin'),
(4, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `s_reports`
--

DROP TABLE IF EXISTS `s_reports`;
CREATE TABLE IF NOT EXISTS `s_reports` (
  `id_report` int(11) NOT NULL AUTO_INCREMENT,
  `id_sanction` int(11) NOT NULL,
  `id_type_sanction` int(11) NOT NULL,
  `nature_sanction` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `informations` text NOT NULL,
  `motif_report` varchar(255) NOT NULL,
  PRIMARY KEY (`id_report`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_retenues`
--

DROP TABLE IF EXISTS `s_retenues`;
CREATE TABLE IF NOT EXISTS `s_retenues` (
  `id_retenue` int(11) NOT NULL AUTO_INCREMENT,
  `id_sanction` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure_debut` varchar(20) NOT NULL,
  `duree` float NOT NULL,
  `travail` text NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `materiel` varchar(150) NOT NULL,
  PRIMARY KEY (`id_retenue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_sanctions`
--

DROP TABLE IF EXISTS `s_sanctions`;
CREATE TABLE IF NOT EXISTS `s_sanctions` (
  `id_sanction` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `nature` varchar(255) NOT NULL,
  `id_nature_sanction` int(11) DEFAULT NULL,
  `effectuee` enum('N','O') NOT NULL,
  `id_incident` int(11) NOT NULL,
  `saisie_par` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_sanction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_traitement_incident`
--

DROP TABLE IF EXISTS `s_traitement_incident`;
CREATE TABLE IF NOT EXISTS `s_traitement_incident` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_incident` int(11) NOT NULL,
  `login_ele` varchar(50) NOT NULL,
  `login_u` varchar(50) NOT NULL,
  `id_mesure` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_travail`
--

DROP TABLE IF EXISTS `s_travail`;
CREATE TABLE IF NOT EXISTS `s_travail` (
  `id_travail` int(11) NOT NULL AUTO_INCREMENT,
  `id_sanction` int(11) NOT NULL,
  `date_retour` date NOT NULL,
  `heure_retour` varchar(20) NOT NULL,
  `travail` text NOT NULL,
  PRIMARY KEY (`id_travail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_travail_mesure`
--

DROP TABLE IF EXISTS `s_travail_mesure`;
CREATE TABLE IF NOT EXISTS `s_travail_mesure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_incident` int(11) NOT NULL,
  `login_ele` varchar(50) NOT NULL,
  `travail` text NOT NULL,
  `materiel` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_types_avertissements`
--

DROP TABLE IF EXISTS `s_types_avertissements`;
CREATE TABLE IF NOT EXISTS `s_types_avertissements` (
  `id_type_avertissement` int(11) NOT NULL AUTO_INCREMENT,
  `nom_court` varchar(50) NOT NULL,
  `nom_complet` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_type_avertissement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `s_types_sanctions`
--

DROP TABLE IF EXISTS `s_types_sanctions`;
CREATE TABLE IF NOT EXISTS `s_types_sanctions` (
  `id_nature` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(255) NOT NULL,
  PRIMARY KEY (`id_nature`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `s_types_sanctions`
--

INSERT INTO `s_types_sanctions` (`id_nature`, `nature`) VALUES
(1, 'Avertissement travail'),
(2, 'Avertissement comportement');

-- --------------------------------------------------------

--
-- Structure de la table `s_types_sanctions2`
--

DROP TABLE IF EXISTS `s_types_sanctions2`;
CREATE TABLE IF NOT EXISTS `s_types_sanctions2` (
  `id_nature` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'autre',
  `saisie_prof` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`id_nature`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `s_types_sanctions2`
--

INSERT INTO `s_types_sanctions2` (`id_nature`, `nature`, `type`, `saisie_prof`) VALUES
(1, 'Exclusion', 'autre', 'n'),
(2, 'Retenue', 'autre', 'n'),
(3, 'Travail', 'autre', 'n'),
(4, 'Avertissement travail', 'autre', 'n'),
(5, 'Avertissement comportement', 'autre', 'n');

-- --------------------------------------------------------

--
-- Structure de la table `tempo`
--

DROP TABLE IF EXISTS `tempo`;
CREATE TABLE IF NOT EXISTS `tempo` (
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `max_periode` int(11) NOT NULL DEFAULT '0',
  `num` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tempo`
--

INSERT INTO `tempo` (`id_classe`, `max_periode`, `num`) VALUES
(1, 6, 'tlb9gfi2eumar85h8m9k78cr47'),
(1, 7, '5eut5fu0a18msio99q3553s0o2'),
(2, 3, '6gkc16oapqlp8j8pr2nuu1v1a6'),
(2, 3, 'trqk4dh77dtm7hn9rtjbnr9sm6'),
(1, 4, 'gva3tjsd7svbehbfpitc4uuk91'),
(1, 4, 'a85h96h3qjkq1lkguvlpjptdl6'),
(3, 4, 'nf3gingj43a16rkns9ouj04qq6'),
(3, 4, '5i0shaf5k8e0etvp2t1q0tfgj6'),
(3, 4, '3oc781hdr8d07t1khgn808p3j7'),
(4, 3, '5hrdu1cbgusbp95l609shj0uj4');

-- --------------------------------------------------------

--
-- Structure de la table `tempo2`
--

DROP TABLE IF EXISTS `tempo2`;
CREATE TABLE IF NOT EXISTS `tempo2` (
  `col1` varchar(100) NOT NULL DEFAULT '',
  `col2` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tempo3`
--

DROP TABLE IF EXISTS `tempo3`;
CREATE TABLE IF NOT EXISTS `tempo3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col1` varchar(255) NOT NULL,
  `col2` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tempo3_cdt`
--

DROP TABLE IF EXISTS `tempo3_cdt`;
CREATE TABLE IF NOT EXISTS `tempo3_cdt` (
  `id_classe` int(11) NOT NULL DEFAULT '0',
  `classe` varchar(255) NOT NULL DEFAULT '',
  `matiere` varchar(255) NOT NULL DEFAULT '',
  `enseignement` varchar(255) NOT NULL DEFAULT '',
  `id_groupe` int(11) NOT NULL DEFAULT '0',
  `fichier` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tempo_utilisateurs`
--

DROP TABLE IF EXISTS `tempo_utilisateurs`;
CREATE TABLE IF NOT EXISTS `tempo_utilisateurs` (
  `login` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `identifiant1` varchar(10) NOT NULL COMMENT 'eleves.ele_id ou resp_pers.pers_id',
  `identifiant2` varchar(50) NOT NULL COMMENT 'eleves.elenoet',
  `statut` varchar(20) NOT NULL,
  `auth_mode` enum('gepi','ldap','sso') NOT NULL DEFAULT 'gepi',
  `date_reserve` date DEFAULT '0000-00-00',
  `temoin` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tempo_utilisateurs`
--

INSERT INTO `tempo_utilisateurs` (`login`, `password`, `salt`, `email`, `identifiant1`, `identifiant2`, `statut`, `auth_mode`, `date_reserve`, `temoin`) VALUES
('toto', '', '', '', 'e000000004', '', 'eleve', 'gepi', '2015-12-31', 'eleve');

-- --------------------------------------------------------

--
-- Structure de la table `temp_abs_import`
--

DROP TABLE IF EXISTS `temp_abs_import`;
CREATE TABLE IF NOT EXISTS `temp_abs_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `cpe_login` varchar(50) NOT NULL DEFAULT '',
  `elenoet` varchar(50) NOT NULL DEFAULT '',
  `libelle` varchar(50) NOT NULL DEFAULT '',
  `nbAbs` int(11) NOT NULL DEFAULT '0',
  `nbNonJustif` int(11) NOT NULL DEFAULT '0',
  `nbRet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elenoet` (`elenoet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `temp_gep_import`
--

DROP TABLE IF EXISTS `temp_gep_import`;
CREATE TABLE IF NOT EXISTS `temp_gep_import` (
  `ID_TEMPO` varchar(40) NOT NULL DEFAULT '',
  `LOGIN` varchar(40) NOT NULL DEFAULT '',
  `ELENOM` varchar(40) NOT NULL DEFAULT '',
  `ELEPRE` varchar(40) NOT NULL DEFAULT '',
  `ELESEXE` varchar(40) NOT NULL DEFAULT '',
  `ELEDATNAIS` varchar(40) NOT NULL DEFAULT '',
  `ELENOET` varchar(40) NOT NULL DEFAULT '',
  `ERENO` varchar(40) NOT NULL DEFAULT '',
  `ELEDOUBL` varchar(40) NOT NULL DEFAULT '',
  `ELENONAT` varchar(40) NOT NULL DEFAULT '',
  `ELEREG` varchar(40) NOT NULL DEFAULT '',
  `DIVCOD` varchar(40) NOT NULL DEFAULT '',
  `ETOCOD_EP` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT1` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT2` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT3` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT4` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT5` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT6` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT7` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT8` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT9` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT10` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT11` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT12` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `temp_gep_import2`
--

DROP TABLE IF EXISTS `temp_gep_import2`;
CREATE TABLE IF NOT EXISTS `temp_gep_import2` (
  `ID_TEMPO` varchar(40) NOT NULL DEFAULT '',
  `LOGIN` varchar(40) NOT NULL DEFAULT '',
  `ELENOM` varchar(40) NOT NULL DEFAULT '',
  `ELEPRE` varchar(40) NOT NULL DEFAULT '',
  `ELESEXE` varchar(40) NOT NULL DEFAULT '',
  `ELEDATNAIS` varchar(40) NOT NULL DEFAULT '',
  `ELENOET` varchar(40) NOT NULL DEFAULT '',
  `ELE_ID` varchar(40) NOT NULL DEFAULT '',
  `ELEDOUBL` varchar(40) NOT NULL DEFAULT '',
  `ELENONAT` varchar(40) NOT NULL DEFAULT '',
  `ELEREG` varchar(40) NOT NULL DEFAULT '',
  `DIVCOD` varchar(40) NOT NULL DEFAULT '',
  `ETOCOD_EP` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT1` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT2` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT3` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT4` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT5` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT6` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT7` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT8` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT9` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT10` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT11` varchar(40) NOT NULL DEFAULT '',
  `ELEOPT12` varchar(40) NOT NULL DEFAULT '',
  `LIEU_NAISSANCE` varchar(50) NOT NULL DEFAULT '',
  `MEL` varchar(255) NOT NULL DEFAULT '',
  `TEL_PERS` varchar(255) NOT NULL DEFAULT '',
  `TEL_PORT` varchar(255) NOT NULL DEFAULT '',
  `TEL_PROF` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tentatives_intrusion`
--

DROP TABLE IF EXISTS `tentatives_intrusion`;
CREATE TABLE IF NOT EXISTS `tentatives_intrusion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `adresse_ip` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `niveau` smallint(6) NOT NULL,
  `fichier` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Contenu de la table `tentatives_intrusion`
--

INSERT INTO `tentatives_intrusion` (`id`, `login`, `adresse_ip`, `date`, `niveau`, `fichier`, `description`, `statut`) VALUES
(1, '-', '127.0.0.1', '2015-12-15 10:13:13', 1, '/login.php', 'Tentative de connexion avec un login incorrect (n''existe pas dans la base Gepi). Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login utilisé : admim)', 'new'),
(2, '-', '127.0.0.1', '2015-12-15 10:16:04', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : admin)', 'new'),
(3, '-', '127.0.0.1', '2015-12-15 10:19:24', 1, '/utilisateurs/mon_compte.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(4, '-', '127.0.0.1', '2015-12-15 12:33:03', 1, '/accueil.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(5, 'scolar', '127.0.0.1', '2015-12-15 14:36:59', 1, '/mod_discipline/index.php', 'Tentative d''accès au module Discipline qui est désactivé.', 'new'),
(6, 'scolar', '127.0.0.1', '2015-12-15 14:37:59', 1, '/mod_discipline/index.php', 'Tentative d''accès au module Discipline qui est désactivé.', 'new'),
(7, 'scolar', '127.0.0.1', '2015-12-15 14:38:45', 1, '/mod_discipline/index.php', 'Tentative d''accès au module Discipline qui est désactivé.', 'new'),
(8, 'scolar', '127.0.0.1', '2015-12-15 14:41:27', 1, '/mod_discipline/index.php', 'Tentative d''accès au module Discipline qui est désactivé.', 'new'),
(9, '-', '127.0.0.1', '2015-12-15 17:07:05', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : histoire)', 'new'),
(10, '-', '127.0.0.1', '2015-12-15 17:07:09', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : histoire)', 'new'),
(11, 'scolar', '127.0.0.1', '2015-12-15 17:37:44', 1, '/mod_discipline/index.php', 'Tentative d''accès au module Discipline qui est désactivé.', 'new'),
(12, 'math', '127.0.0.1', '2015-12-21 09:05:56', 1, '/mod_annees_anterieures/consultation_annee_anterieure.php', 'Tentative d''un professeur (math) d''accéder au module Années antérieures qui n''est pas activé.', 'new'),
(13, '-', '127.0.0.1', '2015-12-21 09:39:58', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : physique)', 'new'),
(14, '-', '127.0.0.1', '2015-12-21 10:58:36', 1, '/matieres/matieres_categories.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(15, '-', '127.0.0.1', '2015-12-21 11:01:42', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(16, '-', '127.0.0.1', '2015-12-21 14:28:00', 1, '/saisie/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(17, '-', '127.0.0.1', '2015-12-22 03:04:24', 1, '/etablissements/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(18, '-', '192.168.42.129', '2015-12-22 04:40:41', 1, '/accueil.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(19, '-', '192.168.42.129', '2015-12-22 05:05:00', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : adonia)', 'new'),
(20, '-', '192.168.42.129', '2015-12-22 05:20:07', 1, '/prepa_conseil/index3.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(21, '-', '192.168.42.129', '2015-12-22 05:23:53', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(22, '-', '127.0.0.1', '2015-12-22 10:59:17', 1, '/lib/change_mode_header.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(23, '-', '127.0.0.1', '2015-12-22 10:59:21', 1, '/accueil_admin.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(24, '-', '127.0.0.1', '2015-12-22 14:45:27', 1, '/cahier_notes_admin/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(25, '-', '127.0.0.1', '2015-12-22 15:40:22', 1, '/mod_trombinoscopes/trombinoscopes.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(26, '-', '127.0.0.1', '2015-12-22 18:13:04', 1, '/saisie/saisie_mentions.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(27, '-', '127.0.0.1', '2015-12-22 22:27:01', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : admin)', 'new'),
(28, '-', '127.0.0.1', '2015-12-23 03:55:19', 1, '/mod_abs2/admin/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(29, '-', '192.168.42.129', '2015-12-23 04:08:45', 1, '/accueil.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(30, '-', '192.168.42.129', '2015-12-23 05:07:10', 1, '/lib/change_mode_header.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(31, '-', '192.168.42.129', '2015-12-23 05:07:12', 1, '/lib/change_mode_header.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(32, '-', '192.168.42.129', '2015-12-23 05:21:45', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(33, '-', '127.0.0.1', '2015-12-23 05:30:04', 1, '/login.php', 'Tentative de connexion avec un login incorrect (n''existe pas dans la base Gepi). Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login utilisé : SC)', 'new'),
(34, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/modify_user.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(35, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/modify_user.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(36, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/modify_user.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(37, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(38, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/modify_user.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(39, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/modify_user.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(40, '-', '127.0.0.1', '2015-12-23 13:26:06', 1, '/utilisateurs/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(41, '-', '127.0.0.1', '2015-12-26 09:08:24', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(42, '-', '192.168.42.129', '2015-12-26 11:50:46', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : admin)', 'new'),
(43, '-', '127.0.0.1', '2015-12-26 11:57:25', 1, '/bulletin/param_bull_pdf.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(44, '-', '127.0.0.1', '2015-12-26 13:16:02', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(45, '-', '192.168.42.129', '2015-12-26 13:39:22', 1, '/gestion/param_gen.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(46, '-', '192.168.42.129', '2015-12-26 15:09:01', 1, '/cahier_notes/visu_releve_notes_bis.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(47, 'scolar', '192.168.42.129', '2015-12-26 15:24:32', 1, '/gestion/index.php', 'Tentative d''accès à un fichier sans avoir les droits nécessaires', 'new'),
(48, '-', '192.168.42.129', '2015-12-26 15:24:44', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(49, '-', '192.168.42.129', '2015-12-26 15:24:56', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(50, '-', '192.168.42.129', '2015-12-26 15:25:22', 1, '/accueil.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(51, '-', '127.0.0.1', '2015-12-26 15:25:38', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(52, '-', '127.0.0.1', '2015-12-26 15:26:01', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(53, '-', '127.0.0.1', '2015-12-26 15:26:20', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(54, '-', '192.168.42.129', '2015-12-26 15:27:09', 1, '/cahier_notes/visu_releve_notes_bis.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(55, '-', '192.168.42.129', '2015-12-26 15:27:21', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(56, 'scolar', '192.168.42.129', '2015-12-26 15:27:21', 2, '/login.php', 'Verrouillage du compte scolar en raison d''un trop grand nombre de tentatives de connexion infructueuses. Ce peut être une tentative d''attaque brute-force.', 'new'),
(57, '-', '127.0.0.1', '2015-12-26 15:27:42', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(58, '-', '127.0.0.1', '2015-12-26 19:14:23', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(59, '-', '127.0.0.1', '2015-12-26 19:14:45', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(60, '-', '127.0.0.1', '2015-12-26 20:03:05', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(61, '-', '127.0.0.1', '2015-12-27 05:44:03', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(62, '-', '127.0.0.1', '2015-12-27 11:42:49', 1, '/bulletin/param_bull_pdf.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(63, '-', '127.0.0.1', '2015-12-27 13:08:38', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(64, '-', '127.0.0.1', '2015-12-28 06:57:32', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(65, '-', '127.0.0.1', '2015-12-29 05:37:20', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(66, '-', '127.0.0.1', '2015-12-29 07:57:01', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(67, '-', '127.0.0.1', '2015-12-29 09:55:37', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(68, '-', '127.0.0.1', '2015-12-29 19:51:08', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(69, '-', '127.0.0.1', '2015-12-29 21:39:52', 1, '/classes/periodes.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(70, '-', '127.0.0.1', '2015-12-29 22:18:51', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(71, '-', '127.0.0.1', '2015-12-30 07:31:34', 1, '/bulletin/param_bull_pdf.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(72, '-', '127.0.0.1', '2015-12-30 19:35:18', 1, '/accueil_admin.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(73, '-', '127.0.0.1', '2015-12-31 12:59:58', 1, '/gestion/param_gen.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(74, '-', '192.168.42.129', '2016-01-02 08:31:51', 1, '/accueil.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(75, '-', '127.0.0.1', '2016-01-02 11:17:02', 1, '/login.php', 'Tentative de connexion avec un login incorrect (n''existe pas dans la base Gepi). Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login utilisé : )', 'new'),
(76, '-', '127.0.0.1', '2016-01-02 11:30:59', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(77, '-', '127.0.0.1', '2016-01-02 12:02:03', 1, '/lib/change_mode_header.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(78, '-', '192.168.42.129', '2016-01-02 13:07:13', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(79, '-', '192.168.42.129', '2016-01-02 13:07:32', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : scolar)', 'new'),
(80, '-', '127.0.0.1', '2016-01-02 13:22:17', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : nono)', 'new'),
(81, '-', '192.168.42.129', '2016-01-02 14:04:06', 1, '/cahier_notes/saisie_notes.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(82, '-', '127.0.0.1', '2016-01-02 14:17:17', 1, '/login.php', 'Tentative de connexion avec un login incorrect (n''existe pas dans la base Gepi). Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login utilisé : scolaru)', 'new'),
(83, '-', '127.0.0.1', '2016-01-02 14:17:17', 1, '/login.php', 'Tentative de connexion avec un login incorrect (n''existe pas dans la base Gepi). Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login utilisé : scolaru)', 'new'),
(84, '-', '127.0.0.1', '2016-01-02 14:41:21', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(85, '-', '127.0.0.1', '2016-01-02 14:41:30', 1, '/bulletin/bull_index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(86, '-', '192.168.42.129', '2016-01-02 15:07:44', 1, '/saisie/index.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(87, '-', '192.168.42.129', '2016-01-02 15:25:26', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : Nono)', 'new'),
(88, '-', '192.168.42.129', '2016-01-02 15:34:34', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : adonia)', 'new'),
(89, '-', '127.0.0.1', '2016-01-02 16:42:14', 1, '/edt_organisation/edt_calendrier.php', 'Accès à une page sans être logué (peut provenir d''un timeout de session).', 'new'),
(90, '-', '127.0.0.1', '2016-01-05 05:15:51', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : adonia)', 'new'),
(91, '-', '127.0.0.1', '2016-01-05 05:16:11', 1, '/login.php', 'Tentative de connexion avec un mot de passe incorrect. Ce peut être simplement une faute de frappe. Cette alerte n''est significative qu''en cas de répétition. (login : adonia)', 'new');

-- --------------------------------------------------------

--
-- Structure de la table `t_plan_de_classe`
--

DROP TABLE IF EXISTS `t_plan_de_classe`;
CREATE TABLE IF NOT EXISTS `t_plan_de_classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` int(11) NOT NULL,
  `login_prof` varchar(50) NOT NULL,
  `dim_photo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_plan_de_classe_ele`
--

DROP TABLE IF EXISTS `t_plan_de_classe_ele`;
CREATE TABLE IF NOT EXISTS `t_plan_de_classe_ele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_plan` int(11) NOT NULL,
  `login_ele` varchar(50) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `udt_corresp`
--

DROP TABLE IF EXISTS `udt_corresp`;
CREATE TABLE IF NOT EXISTS `udt_corresp` (
  `champ` varchar(255) NOT NULL DEFAULT '',
  `nom_udt` varchar(255) NOT NULL DEFAULT '',
  `nom_gepi` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `udt_lignes`
--

DROP TABLE IF EXISTS `udt_lignes`;
CREATE TABLE IF NOT EXISTS `udt_lignes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `division` varchar(255) NOT NULL DEFAULT '',
  `matiere` varchar(255) NOT NULL DEFAULT '',
  `prof` varchar(255) NOT NULL DEFAULT '',
  `groupe` varchar(255) NOT NULL DEFAULT '',
  `regroup` varchar(255) NOT NULL DEFAULT '',
  `mo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `login` varchar(50) NOT NULL DEFAULT '',
  `nom` varchar(50) NOT NULL DEFAULT '',
  `prenom` varchar(50) NOT NULL DEFAULT '',
  `civilite` varchar(5) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(128) DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `show_email` varchar(3) NOT NULL DEFAULT 'no',
  `statut` varchar(20) NOT NULL DEFAULT '',
  `etat` varchar(20) NOT NULL DEFAULT '',
  `change_mdp` char(1) NOT NULL DEFAULT 'n',
  `date_verrouillage` datetime NOT NULL DEFAULT '2006-01-01 00:00:00',
  `password_ticket` varchar(255) NOT NULL DEFAULT '',
  `ticket_expiration` datetime NOT NULL,
  `niveau_alerte` smallint(6) NOT NULL DEFAULT '0',
  `observation_securite` tinyint(4) NOT NULL DEFAULT '0',
  `temp_dir` varchar(255) NOT NULL,
  `numind` varchar(255) NOT NULL,
  `auth_mode` enum('gepi','ldap','sso') NOT NULL DEFAULT 'gepi',
  PRIMARY KEY (`login`),
  KEY `statut` (`statut`),
  KEY `etat` (`etat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`login`, `nom`, `prenom`, `civilite`, `password`, `salt`, `email`, `show_email`, `statut`, `etat`, `change_mdp`, `date_verrouillage`, `password_ticket`, `ticket_expiration`, `niveau_alerte`, `observation_securite`, `temp_dir`, `numind`, `auth_mode`) VALUES
('ADMIN', 'GEPI', 'Administrateur', 'M.', '4d823f3cebc5245b28b4be8cb689778daace72c985f066e73d7977ff9a6e925c', 'e1f0096b0726e78d5de5b4f4abe7a06d', 'masterpece09@gmail.com', 'no', 'administrateur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'ADMIN_Dgv0YaW4TUkbNKLbZJUApEw40NQRcZHJ9s7Vt6prB', '', 'gepi'),
('math', 'mathematique', 'mathematique', 'M.', '0e52af5d3797d16f18b6205d9d2ee416b11c0d417936b857d50bc7bf266354f6', 'c078d8bc8124186e1b81356eb35c9d32', 'mathematique@gmail.com', 'no', 'professeur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 1, 0, 'math_5zfl9QlOPOOG8g6TGqaun29DhMr9051S0iXV246dxrF', '', 'gepi'),
('histoire', 'Histoire', 'Histoire', 'M.', '6865be5261a19700de242da2b5ff5fd20a57601a816c2951ae08c341bb294fa3', '11a8a238ea4d4d9e1f2408fc29d2cb1d', 'histoire@gmail.com', 'no', 'professeur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'histoire_H456J8m6oSKU3qQ1fVpMTaQ6483OFAjDf9AfcxsBhN', '', 'gepi'),
('scolar', 'scolarite', 'scolarite', 'M.', '6defe62be1328dd8c0b5ec1ad829e77ceb85464a6eec4e3894e5505084158981', '656dc145802636a7dae300b3ca2ed703', 'scolarite@gmail.com', 'no', 'scolarite', 'actif', 'n', '2015-12-26 14:28:18', '', '0000-00-00 00:00:00', 8, 0, 'scolar_2GI1r6nvb198G604KD06y859KnwpJ3Q4B3aoOPvz6wg', '', 'gepi'),
('physique', 'physique', 'physique', 'M.', '8290064adb3c1be6a33d96dd6df3152540415d0ace9aa678b9270e7f68fd9159', 'f85978e807e5741ca35f99b623b364fd', 'physique@gmail.com', 'no', 'professeur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'physique_5isy2lHyz20oC3qy2zW59331cay2cGN0q54PVL61933dM', '', 'gepi'),
('adonia', 'NGUEKAME', 'MARIE', 'Mlle', 'b45e03427b3fe43b76d7fa3771fd0590d3d69dc5a0c51158489e7488f61c7212', '9bf1d147cc04a5c88ad405a9f8238047', 'adonia@gmail.com', 'no', 'professeur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'adonia_R2t3st49wApw6N7hzvvCqFEAiK95x2AuZeyZF0', '', 'gepi'),
('toto', 'toto', 'toto', 'M.', '', NULL, '', 'no', 'eleve', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, '', '', 'gepi'),
('kamga', 'esf kamga', 'adonia ', 'Mlle', '0436d6076942c9bbd28beb589209b024', NULL, 'scolar', 'no', 'professeur', 'actif', 'y', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, '', '', 'gepi'),
('sg', 'surveillant', 'surveillant', 'M.', '76b1825ef344e8598673db98406fb7e0f8382175f9645d8052f166be74fe65b7', 'c434adfff4e90e5a44b7b78240ad32b9', 'scolar', 'no', 'cpe', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'sg_2Umdt1yJOKWLCv1p761i555ADmMlL61k2WBPp419iH35', '', 'gepi'),
('admin1', 'admin1', 'admin1', 'M.', '55feb0f3ad4ff7c8429115581e6a86e1f68918e24dbe225c2849bfee443c0f29', 'c39cf0fbd4a0613d7d9401aff1c31c9d', '', 'no', 'administrateur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'admin1_P3T3MizfFUXPJZWg6ue55A0rwpM5C10272CUhZ6vYcUlo', '', 'gepi'),
('nono', 'nono', 'nono', 'M.', '6e9a85caa5ad9f08f588b0666d4290248bde92f709e33263a329ab9d10a58cd1', '0601cc6b5e263cf484a3c2b839fa9859', 'prof', 'no', 'professeur', 'actif', 'n', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, 'nono_455jN5GP6TnevMw7w3xI6Vbts0TYQa1xA54XgS6', '', 'gepi'),
('eloundou', 'eloundou', 'eloundou', 'M.', '4ccfdb7dc3e0bf04807cf812a7ba23d6', NULL, 'scolar1', 'no', 'professeur', 'actif', 'y', '2006-01-01 00:00:00', '', '0000-00-00 00:00:00', 0, 0, '', '', 'gepi');

-- --------------------------------------------------------

--
-- Structure de la table `vocabulaire`
--

DROP TABLE IF EXISTS `vocabulaire`;
CREATE TABLE IF NOT EXISTS `vocabulaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terme` varchar(255) NOT NULL DEFAULT '',
  `terme_corrige` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `vocabulaire`
--

INSERT INTO `vocabulaire` (`id`, `terme`, `terme_corrige`) VALUES
(1, 'jute', 'juste'),
(2, 'il peu', 'il peut'),
(3, 'elle peu', 'elle peut'),
(4, 'un peut', 'un peu'),
(5, 'trop peut', 'trop peu'),
(6, 'baise', 'baisse'),
(7, 'baisé', 'baissé'),
(8, 'baiser', 'baisser'),
(9, 'courge', 'courage'),
(10, 'camer', 'calmer'),
(11, 'camé', 'calmé'),
(12, 'came', 'calme'),
(13, 'tu est', 'tu es'),
(14, 'tu et', 'tu es'),
(15, 'il et', 'il est'),
(16, 'il es', 'il est'),
(17, 'elle et', 'elle est'),
(18, 'elle es', 'elle est');

-- --------------------------------------------------------

--
-- Structure de la table `vs_alerts_eleves`
--

DROP TABLE IF EXISTS `vs_alerts_eleves`;
CREATE TABLE IF NOT EXISTS `vs_alerts_eleves` (
  `id_alert_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_alert_eleve` varchar(100) NOT NULL,
  `date_alert_eleve` date NOT NULL,
  `groupe_alert_eleve` int(11) NOT NULL,
  `type_alert_eleve` int(11) NOT NULL,
  `nb_trouve` int(11) NOT NULL,
  `temp_insert` varchar(100) NOT NULL,
  `etat_alert_eleve` tinyint(4) NOT NULL,
  `etatpar_alert_eleve` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alert_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `vs_alerts_groupes`
--

DROP TABLE IF EXISTS `vs_alerts_groupes`;
CREATE TABLE IF NOT EXISTS `vs_alerts_groupes` (
  `id_alert_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_alert_groupe` varchar(150) NOT NULL,
  `creerpar_alert_groupe` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alert_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `vs_alerts_types`
--

DROP TABLE IF EXISTS `vs_alerts_types`;
CREATE TABLE IF NOT EXISTS `vs_alerts_types` (
  `id_alert_type` int(11) NOT NULL AUTO_INCREMENT,
  `groupe_alert_type` int(11) NOT NULL,
  `type_alert_type` varchar(10) NOT NULL,
  `specifisite_alert_type` varchar(25) NOT NULL,
  `eleve_concerne` text NOT NULL,
  `date_debut_comptage` date NOT NULL,
  `nb_comptage_limit` varchar(200) NOT NULL,
  PRIMARY KEY (`id_alert_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
