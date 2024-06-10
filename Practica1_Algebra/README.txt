MEMBRES DEL GRUP: Elena Ramón i Roger Alamañac

COM FUNCIONA:
El nostre codi és bastant intuïtiu pel que fa a l'organització, ja que hem organitzat en diferents pestanyes el codi en funció a l'element que aplica. Per exemple, tot el codi orientat als personatges que controla al jugador va a una pestanya, el codi dels enemics a un altre... Això ho hem fet així per tenir una millor organització, perquè no quedi un codi de moltíssimes línies i després no podem trobar res.

A més, quan comencem una nova "secció" de codi ho posem comentat al costat perquè es pugui entendre bé. Cal mencionar que el menú principal l'hem dividit en dues pestanyes, una centrada en el que ve a ser per seleccionar "Jugar" o per configurar els enemics i l'altre és el menú on el jugador selecciona quants enemics vol. Per cada element hem fet una funció; per exemple, pels personatges bons hem creat una funció que es diu PJS, a dins de la pestanya d'enemics hi ha les funcions del moviment dels enemics i una altra de les col·lisions...

El "setup" i el loop "Draw" estan posats a una pestanya a part (Main), on allà s'inicialitzen totes les variables i es criden totes les funcions per ordre d'execució.

DECISIONS PRESES:
Durant tot el procés de creació d'aquest joc hem hagut de prendre algunes decisions bastant importants pel que fa a l'estructura, el disseny... Una d'elles ha sigut el que s'ha mencionat anteriorment, d'estructurar cada element amb funcions, agrupant-les per un grup general per pestanyes. Pel que fa a els obstacles, es generen de forma aleatòria i tenen una forma rectangular amb les cantonades corbes, ja que visualment queda molt millor.

També hem decidit afegir petits extres que poden enriquir i dinamitzar el joc, com, ara bé, una música i una petita imatge per donar un toc característic al personatge controlat pel jugador. Cal mencionar que hem utilitzat la llibreria sound, i es requereix instal·lar-la per tal que funcioni.

COSES BONES I DOLENTES:
S'ha de dir que no hem pogut acabar del tot el joc, però estan implementades bastants de les condicions que requeria el joc, però algunes altres no acaben de funcionar del tot, com és el cas de la barra de vida, les col·lisions amb els enemics o que en seleccionar la quantitat d'enemics no acaben de sortir tots. El joc és jugable, però no acaba de complir totes les funcions. El que cal recalcar és que l'inici del joc sí que està bastant ben fet, fent que comenci el PJ sol i hagi d'anar a buscar els altres personatges perquè surtin els enemics.

REPARTICIÓ DEL CODI PER CADA PERSONA:
En general, ens hem anat complementant entre els dos, però sí que ens hem repartit el treball: el Roger s'ha encarregat més dels enemics, dels obstacles, personatges, imatges i música i l'Elena més en el disseny dels menús, els power ups i el boss final. Pel que fa a tota la resta ens ho hem anat combinant i si alguna cosa algú no li sortia l'altre l'ajudava.
