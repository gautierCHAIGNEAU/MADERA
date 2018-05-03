/**
 * ProjetController
 *
 * @description :: Server-side logic for managing projets
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	'all': function(req, res, next){
            if(req.param('recherche') && req.param('radios')){
                var recherche = req.param('recherche');
                if(req.param('radios') == 'client'){
                    Projet.find().populate('cd_client').exec(function(err, allprojets){
                        if(err){
                            return next(err);
                        }
                        
                        var projets = [];
                        for(var i = 0; i < allprojets.length; i++){
                            if(((allprojets[i].cd_client.nom).toLowerCase()).indexOf(recherche.toLowerCase()) > - 1){
                                projets.push(allprojets[i]);
                            }
                        }
                        if(projets.length == 0){
                            projets = null;
                        }
                        res.view({
                            projets: projets
                        })
                    });
                }else if(req.param('radios') == 'projet'){
                    Projet.find({titre:{contains: recherche}}).populate('cd_client').exec(function(err, projets){
                        if(err){
                            return next(err);
                        }
                        res.view({
                            projets: projets
                        });
                    });
                }
                
            }else{
                 Projet.find().populate('cd_client').exec(function(err, projets){
                     if(err){
                         return next(err);
                     }
                     if(!projets){
                         return next();
                     }
                     res.view({
                         projets: projets
                     });
                 });
            }

	},
    
    'new': function(req, res){
		res.view({
			projet: null
		});
	},
	
	'update': function(req, res){
		Projet.findOne(req.param('id'), function(err, projet){
			res.view('projet/new',{
				projet: projet
			});
		});
	},
    
    create: function(req,res,next){
		if(req.param('id')){
   
			Projet.findOne(req.param('id'), function(err, projet){
				if(err){
					return next(err);
				}
				if(!projet){
					return next();
				}

				projet.titre = req.param('nom');

				projet.date_creation = projet.date_creation.getFullYear() + "-" + (projet.date_creation.getMonth() + 1) + "-" + projet.date_creation.getDate();
                
				projet.save(function(error) {
					if(error) {
						return next(error);
					} else {
						res.redirect("/projet/all");
					}
				});
				
			});
		}else{
			Projet.create(req.params.all(), function(err, projet){
				if(err){
					return next(err);
				}
				res.redirect("/projet/all");
			});
		}
		
	},
    
    destroy: function(req, res, next){
		Projet.destroy(req.param('id'), function(err, projet){
			if(err){
				return next(err);
			}
			if(!projet){
				return next();
			}
			res.redirect("/projet/all");
		});
	}
};

