# En tant que vendeur

## Je peux me connecter au site
* J'ai un compte avec des droits administrateur
* J'ai un compte avec un visuel client
* Je m'authentifie pour accéder au site avec mon email et mon mot de passe

## Je peux ajouter des articles
* Je choisis une categorie dans la liste déroulante que j'aurai défini avant la livraison du site (Tshirts, Pulls, Pantalons...).
* J'ajoute la marque de l'article
* J'ajoute le titre(ref) de l'article
* J'ajoute la couleur de l'article
* J'ajoute le prix (en chiffre) de l'article
* J'ajoute la description de l'article
* J'ajoute les photos (min 1 max 4)
* J'ajoute les tailles de l'article avec leur quantité respectives
* Je valide l'article
* Je suis redirigé sur la page de l'article (validation?)

## Je peux modifier un article
* Je me rends sur la page de l'article
* Je clique sur "éditer"
* Je peux modifier la categorie dans la liste déroulante que j'aurai défini avant la livraison du site (Tshirts, Pulls, Pantalons...).
* Je peux modifier la marque de l'article
* Je peux modifier le titre(ref) de l'article
* Je peux modifier la couleur de l'article
* Je peux modifier le prix (en chiffre) de l'article
* Je peux modifier la description de l'article
* Je peux modifier les photos (min 1 max 4)
* Je peux modifier les tailles de l'article avec leur quantité respectives
* Je peux supprimer les tailles que je n'ai plus
* Je valide l'article
* Je suis redirigé sur la page de l'article (validation?)

## Je peux supprimer un article
* Je me rends sur la page de l'article
* Je clique sur "supprimer"
* J'annule la suppression
  * Je reste sur la page de l'aricle
* Je confirme la suppression qui sera irreversible
  * Je suis redirigé à la liste de tous les articles.

## Je peux recevoir une commande
* Je suis alerté par sms/email dès que le client a payé sa commande, (articles / qté)
* L'article payé est automatiquement destocké

## Je peux gérer mes commandes
* Je me rends dans la section "commandes"
* Je vois la liste de toutes les commandes reçues
  * Elles sont classées par dates de la plus récente à la plus ancienne.
  * Je peux les filtrer en fonction de leur status (payée, confirmée, envoyée, annulée, remboursée...)
* Je peux voir le contenu de la commande  en cliquant sur "voir"
  * Les articles commandés sont listés
  * Je confirme que j'ai bien les articles, je clique sur "Je prépare la commande"
    * Le status de la commande passe à "confirmée"
    * Je prépare l'étiquette colissimo en cliquant sur "Imprimer étiquette"
    * Lorsque l'article a été expédié je clique sur "J'ai envoyé la commande", (un email sera envoyé au client)
  * Je n'ai pas les articles, je clique sur "Arg l'article est indisponible", (un email sera envoyé au client)
    * Remboursement dans Stripe

## Je peux gèrer mon stock
### Je peux voir la liste de mon stock en version bureau (ordinateur)
* Chaque article est listé alphabétiquement par catégorie, par référence, et par taille
* Je vois la quantité qu'il me reste pour chaque article
* Je peux aller sur la page de l'article
* Je peux modifier mon article
### Je peux voir la liste de mon stock version mobile
* Chaque article est listé alphabétiquement par catégorie, par référence, et par taille
* Je peux rechercher un article avec un mot clé dans la barre de recherche
* Je peux destocker un article de mon site si je l'ai vendu sur le marché en cliquant sur enlever du stock
* Je peux le remettre en stock en cas d'erreur


## Je peux voir les statistiques

### Articles
* Le nombre d'articles présents sur mon site
* Les articles les plus vendus
### Clients
* Le nombre de client
* Nombre de nouveaux clients / semaine et / mois
### Commandes
* Le nombre de commande
* Nombre de commandes / semaine et / mois
### Retours
* Le nombre de retour
* Le nombre de retour / semaine et / mois

# En tant que client
## Je suis non authentifié
* Je suis sur la page d'accueil
* Je peux voir la liste des articles proposés
* Je peux faire une recherche par catégories dans la liste déroulante (menu?)
* Je peux faire une recherche par mot clé (ref couleur matière) dans la barre de recherche
* Je peux prévisualiser un article en cliquant sur les chevrons de chaque coté de la vignette
* Je peux visualiser un article en cliquant dessus
* Je suis redirigé sur la page de l'article
* Je peux voir des photos de l'article en survolant les mignatures et je peux zoomer sur la grande photo
* Je peux voir la description, le prix, la correspondance des tailles de l'article (ajouter correspondance tailles)
* Je peux ajouter un article à mon panier en séléctionant quantité et taille, et en cliquant sur ajouter au panier
* Je suis redirigé dans mon panier
  * Je vois l'article que j'ai séléctionné.
  * Je peux modifier la quantité et mettre à jour
  * Je peux supprimer l'article de mon panier
  * Je peux continuer mes achats (ajouter d'autres articles)
  * Je peux passer commande
  * Je me dois créer un compte
    * J'entre mon nom, prénom, date de naissance, homme/femme, email, mot de passe, confirmation de mot de passe
    * Je suis redirigé au récapitulatif de la commande
  * J'ajoute mon adresse de livraison qui devient par défaut mon adresse de facturation
  * Je peux modifier mon adresse de facturation
  * Je peux revenir au récapitulatif en cliquand sur "revenir au récapitulatif de ma commande"
  * Je peux payer  en cliquant sur "payer"
  * Je peux payer en cliquant sur 'payer avec la carte bancaire'
  * Je peux entrer mon numero de CB date de validité et le crypto
  * Je peux valider
  * Je reçois un email de confirmation

## Je suis authentifié
* Je suis sur la page d'accueil
* Je peux voir la liste des articles proposés
### Je peux avoir des articles favoris
* Je peux ajouter un article à ma liste de favoris en cliquant sur le coeur gris
* Je peux supprimer un article de ma liste de favoris en cliquant sur le coeur rouge
* Je peux aller voir la liste de mes articles favoris
### Je peux faire une recherche d'articles
* Je peux faire une recherche par catégories dans la liste déroulante (menu?)
* Je peux faire une recherche par mot clé (ref couleur matière) dans la barre de recherche
* Je peux prévisualiser les photos d'un article en cliquant sur les chevrons de chaque coté de la photo
### Je peux voir un article
* Je peux visualiser un article en cliquant sur la vignette
* Je suis redirigé sur la page de l'article
* Je peux voir des photos de l'article en survolant les mignatures et je peux zoomer sur la grande photo
* Je peux voir la description, le prix, la correspondance des tailles de l'article (ajouter correspondance tailles)
### Je peux acheter un article
* Je peux ajouter un article à mon panier en séléctionant quantité et taille, et en cliquant sur ajouter au panier
* Je suis redirigé dans mon panier
  * Je vois l'article que j'ai séléctionné.
  * Je peux modifier la quantité et mettre à jour
  * Je peux supprimer l'article de mon panier
  * Je peux continuer mes achats (ajouter d'autres articles)
  * Je peux passer commande
* Je peux modifier mes adresses livraison/facturation
* Je peux revenir au récapitulatif en cliquand sur "revenir au récapitulatif de ma commande"
* Je peux payer en cliquant sur "payer"
* Je peux payer en cliquant sur 'payer avec la carte bancaire'
* Je peux entrer mon numero de CB date de validité et le crypto
* Je peux valider
* Je reçois un email de confirmation
### Je peux voir l'historique de mes commandes
* Je peux suivre les status de mes commandes dans mon compte / mes commandes
* Mes commandes sont classées de la plus récente à la plus ancienne
* Je peux voir la date à laquelle j'ai passé de ma commande
* J peux voir l'état de ma commande ( payé, confirmée, envoyée)
* Je peux voir le montant reglé (fdp inclus)
* Je peux voir le nombre d'article command"
* Je peux voir le numero de la commande
* Je peux editer ma facture

# Workflow d'une Commande selon les cas... 

### Cas 1 Les articles sont dispos 
* Le client a payé
* Le vendeur reçoit la commande
* Le vendeur prépare la commande 
* Le vendeur envoie la commande 

## Cas 2 Le client annule sa commande(hors prépa)
* Le client a payé
* Le client change d'avis
* Le client annule sa commande
* un email de confirmation est envoyé au client 
* un email prévient le vendeur 
* le vendeur rembourse le client 

## Cas 3 Un ou plusieurs articles sont indisponibles
* Le client a payé
* Le vendeur reçoit la commande
* Le vendeur séléctionne dans la liste les articles indisponibles 
* Il clique sur prévenir le client
* Un email d'explication est envoyé au client
* Le vendeur rembourse partiellement le client 
* Le vendeur envoie les articles disponibles 

## Cas 4 Aucun article n'est disponible
* Le client a payé
* Le vendeur reçoit la commande
* Le vendeur séléctionne dans la liste les articles indisponibles
* Un email d'explication est envoyé au client
* Le vendeur rembourse totalement (avec les frais de port) le client 
* Le vendeur annule la commande 





