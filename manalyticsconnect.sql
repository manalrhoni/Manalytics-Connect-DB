-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 10 fév. 2026 à 19:14
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `manalyticsconnect`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `Num_Admin` int(11) NOT NULL,
  `Nom_Admin` varchar(50) DEFAULT NULL,
  `Email_Admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`Num_Admin`, `Nom_Admin`, `Email_Admin`) VALUES
(1, 'Menal Chef', 'menal@manalytics.ma');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Num_Cli` int(11) NOT NULL,
  `Raison_Soc` varchar(100) DEFAULT NULL,
  `ICE_Cli` varchar(20) DEFAULT NULL,
  `Adr_Cli` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Num_Cli`, `Raison_Soc`, `ICE_Cli`, `Adr_Cli`) VALUES
(100, 'Maroc Telecom', 'ICE123456789', 'Rabat, Maroc');

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `Cod_Comp` varchar(10) NOT NULL,
  `Lib_Comp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`Cod_Comp`, `Lib_Comp`) VALUES
('BI', 'Business Intelligence'),
('SQL', 'Base de données SQL');

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE `contrat` (
  `Ref_Contrat` varchar(20) NOT NULL,
  `Typ_Contrat` varchar(20) DEFAULT NULL,
  `Mnt_Contrat` decimal(12,2) DEFAULT NULL,
  `Num_Lot` int(11) DEFAULT NULL,
  `Num_Free` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`Ref_Contrat`, `Typ_Contrat`, `Mnt_Contrat`, `Num_Lot`, `Num_Free`) VALUES
('CTR-001', 'Forfait', 15000.00, 10, 50);

-- --------------------------------------------------------

--
-- Structure de la table `freelance`
--

CREATE TABLE `freelance` (
  `Num_Free` int(11) NOT NULL,
  `Nom_Free` varchar(50) DEFAULT NULL,
  `Prenom_Free` varchar(50) DEFAULT NULL,
  `CIN_Free` varchar(20) DEFAULT NULL,
  `TJM_Free` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `freelance`
--

INSERT INTO `freelance` (`Num_Free`, `Nom_Free`, `Prenom_Free`, `CIN_Free`, `TJM_Free`) VALUES
(50, 'Alami', 'Ahmed', 'K123456', 2500.00);

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `Num_Lot` int(11) NOT NULL,
  `Desc_Lot` varchar(255) DEFAULT NULL,
  `Priorite_Lot` varchar(20) DEFAULT NULL,
  `Avanc_Lot` int(11) DEFAULT NULL,
  `Date_Ech_Lot` date DEFAULT NULL,
  `Ref_Proj` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`Num_Lot`, `Desc_Lot`, `Priorite_Lot`, `Avanc_Lot`, `Date_Ech_Lot`, `Ref_Proj`) VALUES
(10, 'Extraction des données', 'Haute', 20, '2025-02-01', 'PRJ-2025-01');

-- --------------------------------------------------------

--
-- Structure de la table `maitriser`
--

CREATE TABLE `maitriser` (
  `Num_Free` int(11) NOT NULL,
  `Cod_Comp` varchar(10) NOT NULL,
  `Niv_Maitrise` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maitriser`
--

INSERT INTO `maitriser` (`Num_Free`, `Cod_Comp`, `Niv_Maitrise`) VALUES
(50, 'SQL', 4);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `Ref_Proj` varchar(20) NOT NULL,
  `Titre_Proj` varchar(100) DEFAULT NULL,
  `Date_Deb_P` date DEFAULT NULL,
  `Date_Fin_P` date DEFAULT NULL,
  `Statut_Proj` varchar(20) DEFAULT NULL,
  `Num_Cli` int(11) DEFAULT NULL,
  `Num_Admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`Ref_Proj`, `Titre_Proj`, `Date_Deb_P`, `Date_Fin_P`, `Statut_Proj`, `Num_Cli`, `Num_Admin`) VALUES
('PRJ-02', 'Dashboard data', '2025-02-18', NULL, 'En cours', 100, 1),
('PRJ-2025-01', 'Refonte Dashboard', '2025-01-01', '2025-06-01', 'En cours', 100, 1);

-- --------------------------------------------------------

--
-- Structure de la table `requerir`
--

CREATE TABLE `requerir` (
  `Num_Lot` int(11) NOT NULL,
  `Cod_Comp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `requerir`
--

INSERT INTO `requerir` (`Num_Lot`, `Cod_Comp`) VALUES
(10, 'SQL');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_resume_projets`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_resume_projets` (
`Ref_Proj` varchar(20)
,`Titre_Proj` varchar(100)
,`Client` varchar(100)
,`Statut_Proj` varchar(20)
,`Nombre_Taches` bigint(21)
,`Budget_Engage` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_resume_projets`
--
DROP TABLE IF EXISTS `v_resume_projets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_resume_projets`  AS SELECT `p`.`Ref_Proj` AS `Ref_Proj`, `p`.`Titre_Proj` AS `Titre_Proj`, `c`.`Raison_Soc` AS `Client`, `p`.`Statut_Proj` AS `Statut_Proj`, count(`l`.`Num_Lot`) AS `Nombre_Taches`, coalesce(sum(`ct`.`Mnt_Contrat`),0) AS `Budget_Engage` FROM (((`projet` `p` join `client` `c` on(`p`.`Num_Cli` = `c`.`Num_Cli`)) left join `lot` `l` on(`p`.`Ref_Proj` = `l`.`Ref_Proj`)) left join `contrat` `ct` on(`l`.`Num_Lot` = `ct`.`Num_Lot`)) GROUP BY `p`.`Ref_Proj`, `p`.`Titre_Proj`, `c`.`Raison_Soc`, `p`.`Statut_Proj` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Num_Admin`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Num_Cli`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`Cod_Comp`);

--
-- Index pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`Ref_Contrat`),
  ADD UNIQUE KEY `Num_Lot` (`Num_Lot`),
  ADD KEY `Num_Free` (`Num_Free`);

--
-- Index pour la table `freelance`
--
ALTER TABLE `freelance`
  ADD PRIMARY KEY (`Num_Free`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`Num_Lot`),
  ADD KEY `Ref_Proj` (`Ref_Proj`);

--
-- Index pour la table `maitriser`
--
ALTER TABLE `maitriser`
  ADD PRIMARY KEY (`Num_Free`,`Cod_Comp`),
  ADD KEY `Cod_Comp` (`Cod_Comp`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`Ref_Proj`),
  ADD KEY `Num_Cli` (`Num_Cli`),
  ADD KEY `Num_Admin` (`Num_Admin`);

--
-- Index pour la table `requerir`
--
ALTER TABLE `requerir`
  ADD PRIMARY KEY (`Num_Lot`,`Cod_Comp`),
  ADD KEY `Cod_Comp` (`Cod_Comp`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`Num_Lot`) REFERENCES `lot` (`Num_Lot`),
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`Num_Free`) REFERENCES `freelance` (`Num_Free`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`Ref_Proj`) REFERENCES `projet` (`Ref_Proj`);

--
-- Contraintes pour la table `maitriser`
--
ALTER TABLE `maitriser`
  ADD CONSTRAINT `maitriser_ibfk_1` FOREIGN KEY (`Num_Free`) REFERENCES `freelance` (`Num_Free`),
  ADD CONSTRAINT `maitriser_ibfk_2` FOREIGN KEY (`Cod_Comp`) REFERENCES `competence` (`Cod_Comp`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`Num_Cli`) REFERENCES `client` (`Num_Cli`),
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`Num_Admin`) REFERENCES `admin` (`Num_Admin`);

--
-- Contraintes pour la table `requerir`
--
ALTER TABLE `requerir`
  ADD CONSTRAINT `requerir_ibfk_1` FOREIGN KEY (`Num_Lot`) REFERENCES `lot` (`Num_Lot`),
  ADD CONSTRAINT `requerir_ibfk_2` FOREIGN KEY (`Cod_Comp`) REFERENCES `competence` (`Cod_Comp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
