-- existence de la clé primaire dans la table 'Client'
INSERT INTO Client(idClient, nomClient, prenomClient, email, adresse, tel)
VALUES( NULL, 'MARTIN', 'Antoine', 'antoinemart@gmail.com', '1 rue de montpellier', '0605040404'); --(idClient = Null)
/* Message d'erreur :
ORA-01400: cannot insert NULL into ("ROOT"."CLIENT"."IDCLIENT")
https://docs.oracle.com/error-help/db/ora-01400/
*/

-- unicité de la clé candidate dans la table 'Bien' :

INSERT INTO Agence(numAgence, adresse, horaire)
VALUES('3', '3 impasse des agences', '9h05 - 12h45');

INSERT INTO Agent(numAgent, nom, prenom, salaire, estResponsable, sonAgence)
VALUES('47', 'DUPONT', 'Jacques', 4005, 1, '3');

INSERT INTO Bien(idBien, adresse, nbPieces, valeur, anneeConst, cave, parking, enTravaux, unAgent)
VALUES('1', '28 allée de Hugo', 4, 158625.99, 2020, 1, 0, 0, '47');
INSERT INTO Bien(idBien, adresse, nbPieces, valeur, anneeConst, cave, parking, enTravaux, unAgent)
VALUES('2', '28 allée de Hugo', 5, 158615.99, 2019, 0, 1, 0, '47'); --(adresse de idBien(1) = adresse de idBien(2))
/* Message d'erreur :
ORA-00001: unique constraint (ROOT.UQ_ADRESSE) violated
https://docs.oracle.com/error-help/db/ora-00001/
*/

-- Intégrité référentielle de la clé étrangère dans la table 'Bien' :
INSERT INTO Bien(idBien, adresse, nbPieces, valeur, anneeConst, cave, parking, enTravaux, unAgent)
VALUES('99', '15 rue de Vinci', 7, 99123.99, 2024, 0, 1, 0, '88'); --(Agent inexistant)
/* Message d'erreur :
ORA-02291: integrity constraint (ROOT.FK_BIEN_AGENT) violated - parent key not found
https://docs.oracle.com/error-help/db/ora-02291/
*/

-- Intégrité référentielle de la clé étrangère dans la table Agent :
INSERT INTO Agent(numAgent, nom, prenom, salaire, estResponsable, sonAgence)
VALUES('74', 'BONAPARTE', 'Pierre', 4300, 0, '1'); --(Agence inexistante)
/* Message d'erreur :
ORA-02291: integrity constraint (ROOT.FK_AGENT_AGENCE) violated - parent key not found
https://docs.oracle.com/error-help/db/ora-02291/
*/

-- CHECK de valeurs de l’attribut salaire :
INSERT INTO Agent(numAgent, nom, prenom, salaire, estResponsable, sonAgence)
VALUES('74', 'BONAPARTE', 'Pierre', 3534, 0, '3'); -- (salaire <= 3534)
/* Message d'erreur :
ORA-02290: check constraint (ROOT.CK_SALAIRE) violated
https://docs.oracle.com/error-help/db/ora-02290/
*/

-- CHECK de contrainte dateFin > dateDebut d’une location :
INSERT INTO Client(idClient, nomClient, prenomClient, email, adresse, tel)
VALUES( '1', 'MARTIN', 'Antoine', 'antoinemart@gmail.com', '1 rue de montpellier', '0605040404');

INSERT INTO Location(leBienL, leClientL, dateDebut, dateFin, loyer)
VALUES('1', '1', TO_DATE('15-01-2022','DD-MM-YYYY'), TO_DATE('20-12-2021','DD-MM-YYYY'), 600); --(dateFin < dateDebut)
/* Message d'erreur :
ORA-02290: check constraint (ROOT.CK_DATES) violated
https://docs.oracle.com/error-help/db/ora-02290/
*/

