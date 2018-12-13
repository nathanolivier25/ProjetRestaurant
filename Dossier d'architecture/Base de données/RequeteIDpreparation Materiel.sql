SELECT Preparation.IDPreparation, Preparation.NomPreparation, Necessite.IDTache, Necessite.OrdreTache, Necessite.IDIngredients, Tache.NomTache, Tache.DureeTache, Utilise.IDMateriel, Materiel.NomMateriel, Materiel.Type, Materiel.EtatMateriel FROM Materiel 
RIGHT JOIN Utilise ON Materiel.IDMateriel = Utilise.IDMateriel
RIGHT JOIN Tache ON Utilise.IDTache = Tache.IDTache
RIGHT JOIN Necessite ON Tache.IDTache = Necessite.IDTache
RIGHT JOIN Preparation ON Necessite.IDPreparation = Preparation.IDPreparation
WHERE Preparation.IDPreparation = 10
ORDER BY Necessite.OrdreTache