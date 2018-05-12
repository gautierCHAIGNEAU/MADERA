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
    
    'new': function(req, res, next){
        Client.find(function(err, clients){
            if(err){
                return next(err);
            }
            if(!clients){
                return next();
            }
            clients.sort(function(a,b) {
                if (a.nom > b.nom) return 1;
                if (a.nom < b.nom) return -1;
                return 0
            })
            res.view({
                projet: null,
                client: null,
                clients: clients
            });
        });
		
	},
	
	'update': function(req, res){
		Projet.findOne(req.param('id')).populate("cd_client").exec(function(err, projet){
            if(err){
                return next(err);
            }
            if(!projet){
                return next();
            }
             Client.find(function(err, clients){
                if(err){
                    return next(err);
                }
                if(!clients){
                    return next();
                }
                clients.sort(function(a,b) {
                    if (a.nom > b.nom) return 1;
                    if (a.nom < b.nom) return -1;
                    return 0
                })
                res.view('projet/new',{
                    projet: projet,
                    client: projet.cd_client,
                    clients: clients
                });
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

				projet.titre = req.param('titre');
                projet.cd_client = req.param('cd_client');

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
            var now = new Date();
            var date = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
			Projet.create({
                titre: req.param('titre'),
                cd_client: req.param('cd_client'),
                date_creation: date
            }, 
            function(err, projet){
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
	},
    
    'show': function(req, res, next){

          Produit.findOne(req.param('id')).populate('cd_projet').exec(function(err, produit){
              if(err){
                  return next(err);
              }
              if(!produit){
                  return next();
              }
              Projet.findOne(produit.cd_projet.id).populate('cd_client').exec(function(err, projet){
                   console.log(produit);
                  console.log(projet);
                    res.view({
                        projet: projet,
                        produit: produit
                    });
              
              });
             
          });

	}
};

