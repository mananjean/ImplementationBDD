# SQL
Toulimo - Base de Données pour un Réseau d'Agences Immobilières 🏢 Un projet de conception et d'implémentation d'une base de données centralisée pour le réseau d'agences Toulimo, permettant de gérer les agences, employés, biens immobiliers et rendez-vous efficacement.

# Toulimo - Base de Données pour Réseau d'Agences Immobilières

Ce projet concerne la conception et l’implémentation d’une base de données pour le réseau d’agences immobilières Toulimo. L'objectif est de centraliser la gestion des agences, des ressources humaines, des biens immobiliers et des rendez-vous, en remplaçant les systèmes indépendants utilisés auparavant par chaque agence.

## Contexte du projet

Chaque agence Toulimo disposait jusqu’à présent de son propre système d’information. Après avoir interviewé l’équipe dirigeante, un cahier des charges a été établi afin de concevoir une base de données unique permettant de :

- Gérer les différentes agences réparties sur le territoire.

- Centraliser les informations sur les employés et leur affectation aux agences.

- Stocker et organiser les biens en vente et en location.

- Planifier et gérer les rendez-vous avec les clients.

## Contenu du repository

Ce repository contient deux fichiers SQL :

- scriptCreationTables.sql : Script pour la création des tables et des relations.

- scriptTestContraintes.sql : Script pour le remplissage de la base de données avec des données de test.

## Installation et Utilisation

1. Clonez ce repository :
```
git clone https://github.com/mananjean/ImplementationBDD.git
```
2. Importez les fichiers SQL dans votre base de données MySQL ou PostgreSQL :

- Exécutez la création des tables :
```
source scriptCreationTables.sql;
```
- Insérez les données de test :
```
source scriptTestContraintes.sql;
```

## Technologies utilisées

**Système de gestion de base de données (SGBD)** : Oracle SQL

**SQL** : Langage utilisé pour la conception et la gestion de la base de données

## Contributions

Les contributions sont les bienvenues ! N'hésitez pas à proposer des améliorations ou des corrections via des pull requests.

## Contact

Pour toute question ou suggestion, vous pouvez ouvrir une issue sur GitHub.
