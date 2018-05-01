/**
 * ClientController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
  
	'all': function(req, res){
		Client.find(function(err, clients){
			res.view({
				clients: clients
			});
		});
		
	},
	
	'new': function(req, res){
		res.view({
			client: null
		});
	},
	
	'update': function(req, res){
		Client.findOne(req.param('id'), function foundClient(err, client){
			res.view('client/new',{
				client: client
			});
		});
	},
	
	create: function(req,res,next){
		if(req.param('id')){
			Client.findOne(req.param('id'), function foundClient(err, client){
				if(err){
					return next(err);
				}
				if(!client){
					return next();
				}

				client.nom = req.param('nom');
				client.prenom = req.param('prenom');
				client.mail = req.param('mail');
				client.telephone = req.param('telephone');
				client.portable = req.param('portable'),
				client.adresse_numero = req.param('adresse_numero');
				client.adresse = req.param('adresse');
				client.Adresse_complementaire = req.param('Adresse_complementaire');
				client.adresse_ville = req.param('adresse_ville');
				client.adresse_codepostale = req.param('adresse_codepostale');
				
				client.save(function(error) {
					if(error) {
						return next(err);
					} else {
						res.redirect("/client/all");
					}
				});
				
			});
		}else{
			Client.create(req.params.all(), function clientCreated(err, client){
				if(err){
					return next(err);
				}
				res.redirect("/client/all");
				//res.redirect("/client/show/" + client.id);
			});
		}
		
	},
	
	show: function(req,res,next){
		Client.findOne(req.param('id'), function foundClient(err, client){
			if(err){
				return next(err);
			}
			if(!client){
				return next();
			}
			res.view({
				client: client
			});
		});
	},
	
	destroy: function(req, res, next){
		Client.destroy(req.param('id'), function clientDeleted(err, client){
			if(err){
				return next(err);
			}
			if(!client){
				return next();
			}
			res.redirect("/client/all");
		});
	}
};

