/**
 * ProduitController
 *
 * @description :: Server-side logic for managing produits
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var Produit_moduleController = require('./Produit_moduleController');

module.exports = {
    
	'all': function(req, res, next){

          Produit.find({cd_projet: req.param('id')}, function(err, produits){
              if(err){
                  return next(err);
              }
              if(!produits){
                  return next();
              }
              Projet.findOne(req.param('id'), function(err, projet){
                  if(err){
                      return next(err);
                  }
                  if(!projet){
                      return next();
                  }
                  res.view({
                      produits: produits,
                      projet: projet
                  });
              });
              
          });

	},
    
     'new': function(req, res, next){
        var projet = req.param('id');
        Gamme.find().populate("isolant").populate("couverture").populate("finition_exterieur").populate("finition_interieur").exec(function(err, gammes){
            if(err){
                return next(err);
            }
            if(!gammes){
                return next();
            }
            gammes.sort(function(a,b) {
                if (a.nom > b.nom) return 1;
                if (a.nom < b.nom) return -1;
                return 0
            })
            Modele.find(function(err, modeles){
                if(err){
                    return next(err);
                }
                if(!modeles){
                    return next();
                }
                modeles.sort(function(a,b) {
                    if (a.nom > b.nom) return 1;
                    if (a.nom < b.nom) return -1;
                    return 0
                })
                res.view({
                    gammes: gammes,
                    modeles: modeles,
                    projet: projet
                });

            });
        });
		
	},
    
    create: function(req,res,next){
            Modele.findOne(req.param('cd_modele')).exec(function(err, modele){
                if(err){
                    return next(err);
                }
                if(!modele){
                    return next();
                }
                Modele_module.find({cd_modele: req.param('cd_modele')}).populate('cd_module').exec(function(err, modules){
                    if(err){
                        return next(err);
                    }
                    if(!modules){
                        return next();
                    }
                    Produit.create({
                        note: req.param('note'),
                        cd_gamme: req.param('cd_gamme'),
                        cd_projet: req.param('cd_projet'),
                        nbr_etage: modele.nbre_etage,
                        plan: modele.nom + "Plan.jpg"
                    }, 
                    function(err, produit){
                        if(err){
                            return next(err);
                        }
                        var data = [produit.id, modules];
                        Produit_moduleController.create(req,res,next,data);
                        res.redirect("/produit/all/" + req.param('cd_projet'));
                    });
                });
                
                
            });

	},
    
    update: function(req,res,next){

        Produit.findOne(req.param('id')).populate("cd_gamme").exec(function(err, produit){
            if(err){
                return next(err);
            }
            if(!produit){
                return next();
            }
            Composant.find({cd_famille_composant:3}).exec(function(err, finitions_ext){
                if(err){
                    return next(err);
                }
                Composant.find({cd_famille_composant:4}).exec(function(err, finitions_int){
                    if(err){
                        return next(err);
                    }
                    Composant.find({cd_famille_composant:2}).exec(function(err, isolations){
                        if(err){
                            return next(err);
                        }
                        Composant.find({cd_famille_composant:5}).exec(function(err, couvertures){
                            if(err){
                                return next(err);
                            }
                            Produit_module.find({cd_produit:req.param('id')}).populate("cd_module").exec(function(err, modules){
                                if(err){
                                    return next(err);
                                }
                                modules.sort(function(a,b) {
                                    if (a.cd_module.designation > b.cd_module.designation) return 1;
                                    if (a.cd_module.designation < b.cd_module.designation) return -1;
                                    return 0
                                })
                                res.view({
                                    produit: produit,
                                    finitions_ext: finitions_ext,
                                    finitions_int: finitions_int,
                                    isolations: isolations,
                                    couvertures: couvertures,
                                    modules: modules
                                });
                            });
                            
                        });
                        
                    });

                });

            });
    
			
		});
		
		
	},
    
    'module': function(req,res,next){
         Produit.findOne(req.query.produit).populate("cd_gamme").exec(function(err, produit){
            if(err){
                return next(err);
            }
            if(!produit){
                return next();
            }
             res.view({
                 produit: produit,
                 module: null
             });
         });
        
    },
    
    destroy: function(req, res, next){
        Produit_moduleController.destroy(req,res,next,req.param('id'), req.query.projet);
		
	}

};

