-- Création des tables :
DROP TABLE Location;
DROP TABLE Vente;
DROP TABLE Client;
DROP TABLE Bien;
DROP TABLE Agent;
DROP TABLE Agence;

CREATE TABLE Agence (
	numAgence VARCHAR2(10)
 		CONSTRAINT pk_Agence PRIMARY KEY,
    adresse VARCHAR2(40),
	horaire VARCHAR2(30)
);

CREATE TABLE Agent (
	numAgent VARCHAR2(10)
		CONSTRAINT pk_Agent PRIMARY KEY,
	nom VARCHAR2(20)
		CONSTRAINT nn_nom NOT NULL,
	prenom VARCHAR2(20),
	salaire NUMBER(10,2)
		CONSTRAINT ck_salaire CHECK (salaire > 3534),
	estResponsable NUMBER(1)
		CONSTRAINT ck_estResponsable_boolean CHECK (estResponsable IN (0,1)),
	sonAgence VARCHAR2(10)
		CONSTRAINT fk_Agent_Agence REFERENCES Agence(numAgence)
		CONSTRAINT nn_sonAgence NOT NULL
);					

CREATE TABLE Bien(
	idBien VARCHAR2(10)
		CONSTRAINT pk_Bien PRIMARY KEY,
	adresse VARCHAR2(40)
		CONSTRAINT uq_adresse UNIQUE,
	nbPieces NUMBER(4)
		CONSTRAINT nn_nbPieces NOT NULL,
	valeur NUMBER(10,2)
		CONSTRAINT ck_valeurPositive CHECK ( valeur > 0 ),
	anneeConst NUMBER(4),
	cave NUMBER(1)
		CONSTRAINT ck_cave_boolean CHECK (cave IN (0,1)),
	parking NUMBER(1)
		CONSTRAINT ck_parking_boolean CHECK (parking IN (0,1)),
	enTravaux NUMBER(1)
		CONSTRAINT ck_enTravaux_boolean CHECK (enTravaux IN (0,1)),
	unAgent VARCHAR2(10)
		CONSTRAINT fk_bien_agent REFERENCES Agent(numAgent)
		CONSTRAINT nn_unAgent NOT NULL
);


CREATE TABLE Client(
	idClient VARCHAR2(10)
		CONSTRAINT pk_Client PRIMARY KEY,
	nomClient VARCHAR2(20)
		CONSTRAINT nn_nomClient NOT NULL,
	prenomClient VARCHAR2(10),
	email VARCHAR2(40)
		CONSTRAINT nn_email NOT NULL
		CONSTRAINT ck_emailLike CHECK (email LIKE '%_@%_.%_'),
	adresse VARCHAR2(40),
	tel VARCHAR2(15)
);

CREATE TABLE Vente(
	leBienV VARCHAR2(10)
		CONSTRAINT fk_vente_bien REFERENCES Bien(idBien),
	leClientV VARCHAR2(10)
		CONSTRAINT fk_vente_client REFERENCES Client(idClient),
	dateVente DATE,
	prix NUMBER(10,2	)
		CONSTRAINT ck_prix CHECK ( prix > 0 ),
	CONSTRAINT pk_vente PRIMARY KEY (leBienV, leClientV)
);

CREATE TABLE Location(
	leBienL VARCHAR2(20)
		CONSTRAINT fk_Location_Bien REFERENCES Bien(idBien),
	leClientL VARCHAR2(20)
		CONSTRAINT fk_Location_Client REFERENCES Client(idClient),
    dateDebut DATE,
	dateFin DATE,
	loyer NUMBER(10,2),
	CONSTRAINT pk_Location PRIMARY KEY (leBienL, leClientL),
	CONSTRAINT ck_dates CHECK (dateFin > dateDebut)
);

-- Modification des tables :
ALTER TABLE Agence ADD nbEmployes VARCHAR2(10);
ALTER TABLE Agence ADD CONSTRAINT ck_nbEmployesPositif CHECK (nbEmployes > 0);
ALTER TABLE Agence DROP CONSTRAINT ck_nbEmployesPositif;
ALTER TABLE Agence DROP COLUMN nbEmployes;
