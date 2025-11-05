

* Travaillez avec le menu radial de ox_lib ou ox_target
* Les véhicules persistent lorsqu'un joueur se déconnecte, lorsque le véhicule se reconnecte il continuera au même endroit.
* Partagez des véhicules avec des collègues, y compris une liste pour gérer l'accès partagé au véhicule.
* Garage pour travail indépendant.
* Générez une clé lors de la sortie du véhicule du garage et supprimez-la lors du retour au garage.
* 3 types de garages : "air", "auto" et "bateau".
* Système de fourrière et points de récupération des véhicules.
* Le kilométrage du véhicule est stocké dans la base de données et peut être consulté dans le garage.
* Garage.RadialCopyCoords : menu radial pour copier les coordonnées et créer facilement des garages. (Utilisez-le uniquement sur votre serveur de développement !)
* Commande pour ajouter un véhicule à la base de données en tant que propriétaire.
* Permet aux véhicules qui se trouvent à l'extérieur du garage et dont l'entité n'est pas présente dans le monde d'être envoyés directement à la fourrière.

# Commandes : 

* **/impound** - Avec cette commande, vous pouvez mettre en fourrière un véhicule. 
* **/givecar** - Le véhicule dans lequel vous vous trouvez sera enregistré dans la base de données et deviendra votre propriété. (ADMIN)


# Rajouter c'est Items dans : Ox inventory / data / Items.lua 

['carkeys'] = {
	label = 'Clé Vehicules',
	weight = 5,
	stack = true
},

['ganzua'] = {
	label = 'Outils de Crochetages',
	weight = 25,
	stack = true,
	client = {
		export = 'LeDjo_Garage.LockPick'
	}
},

['alicates'] = {
	label = 'Pince Coupante',
	weight = 50,
	stack = true,
	client = {
		export = 'LeDjo_Garage.HotWire'
	}
},
['plate'] = {
	label = 'Plaque',
	weight = 500,
	stack = true,
	client = {
		export = 'LeDjo_Garage.SetMatricula'
	}
},


# Dependences : 
 - ox_lib  -  https://github.com/overextended/ox_lib/releases  
 - ox_inventory  -  https://github.com/overextended/ox_inventory/releases  
 - ox_target  -  https://github.com/overextended/ox_target/releases  

# Oublier pas de rajouter les images fournies dans votre Ox_inventory / web / images 
