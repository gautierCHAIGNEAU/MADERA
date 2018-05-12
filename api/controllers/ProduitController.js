/**
 * ProduitController
 *
 * @description :: Server-side logic for managing produits
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
var Produit_moduleController = require('./Produit_moduleController');
var fs = require('fs');
var pdf = require('html-pdf');
//var html = fs.readFileSync('./test/businesscard.html', 'utf8');
var options = { format: 'Letter' };

module.exports = {
    
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

	},
    
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
            if(req.param('id')){
                 Module.findOne(req.param('id'),function(err, module){
                    res.view({
                         produit: produit,
                         module: module
                     });
                 });
            }else{
                res.view({
                     produit: produit,
                     module: null
                 });
            }
             
         });
        
    },
    
    destroy: function(req, res, next){
        Produit_moduleController.destroy(req,res,next,req.param('id'), req.query.projet);
		
	},
    
    'devis': function(req, res, next){
        Projet.findOne(req.param('id')).populate("cd_client").exec(function(err, projet){
            if(err){
                return next(err);
            }
            Produit.find({cd_projet: req.param('id')}).populate("cd_gamme").exec(function(err, produits){
                if(err){
                    return next(err);
                }
                Produit_module.find().populate("cd_module").exec(function(err, produits_module){
                   if(err){
                        return next(err);
                    } 
                    Composant.find().exec(function(err, composants){
                       if(err){
                            return next(err);
                        } 
                        Module_composant.find().populate("cd_composant").exec(function(err, modules_composant){
                           if(err){
                                return next(err);
                            }
                            var html = "";
                            html += "<html><body><h2 style='text-align:center'>Devis Quantitatif et Estimatif</h2>";
                            html += "<h4>Projet</h4>";
                            html += "Référence: <i style='color:blue'>" + projet.id + "</i><br/>";
                            html += "Projet: <i style='color:blue'>" + projet.titre + "</i><br/>";
                            var date = new Date(projet.date_creation);
                            html += "Date: <i style='color:blue'>" + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + "</i><br/>";
                            html += "<h4>Client</h4>";
                            html += "Nom: <i style='color:blue'>" + projet.cd_client.nom + "</i><br/>";
                            html += "Prenom: <i style='color:blue'>" + projet.cd_client.prenom + "</i><br/>";
                            html += "Mail: <i style='color:blue'>" + projet.cd_client.mail + "</i><br/>";
                            html += "Tel. fixe: <i style='color:blue'>" + projet.cd_client.telephone + "</i><br/>";
                            html += "Tel. portable: <i style='color:blue'>" + projet.cd_client.portable + "</i><br/>";
                            html += "Adresse: <i style='color:blue'>" + projet.cd_client.adresse_numero + ", " + projet.cd_client.adresse + " " + projet.cd_client.adresse_codepostale + " " + projet.cd_client.adresse_ville + "</i><br/>";
                            html += "<h4>Produits</h4>";
                            var tarif = 0;
                            for(var i = 0; i < produits.length; i++){
                                html += "Produit: <i style='color:blue'>" + produits[i].note + "</i><br/>";
                                html += "CCTP: <i style='color:blue'>Lorem Ipsum</i><br/>";
                                for(var u = 0; u < composants.length; u++){
                                    switch(composants[u].id){
                                        case produits[i].cd_gamme.finition_exterieur:
                                             html += "Finition exterieur: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.finition_interieur:
                                             html += "Finition interieur: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.isolant:
                                             html += "Isolation: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.couverture:
                                             html += "Couverture: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                    }
                                }
                                idProduit = produits[i].id;
                                html += "Modules<br/>";
                                for(var u = 0; u < produits_module.length; u++){
                                    if(produits_module[u].cd_produit == produits[i].id){
                                        var tarifmodule = 0;
                                        html += "<i style='color:blue'>" + produits_module[u].cd_module.designation + "</i>";
                                        var cptcompos = 0;
                                         for(var n = 0; n < modules_composant.length; n++){
                                             if(modules_composant[n].cd_module == produits_module[u].cd_module.id){
                                                 cptcompos += parseInt(modules_composant[n].quantite);
                                                 tarifmodule += ((parseInt(modules_composant[n].cd_composant.tarif)) * (parseInt(modules_composant[n].quantite)));
                                                 
                                             }
                                         }
                                        tarif += tarifmodule;
                                        html += " (" + cptcompos + " composants): " + tarifmodule + " € <br/>";
                                    }
                                }
                                html += "<br/>";
                            }
                            html += "<h3>Tarif: " + tarif + " €</h3>";
                            pdf.create(html).toStream((err, stream) => {
                                if (err) return res.end(err.stack)
                                res.setHeader('Content-type', 'application/pdf')
                                stream.pipe(res)
                             });
                        })
                        
                    })
                })
                    
                
                
                
            })
            
         })
       
        
    },
    
    
    'dossier': function(req, res, next){
        Projet.findOne(req.param('id')).populate("cd_client").exec(function(err, projet){
            if(err){
                return next(err);
            }
            Produit.find({cd_projet: req.param('id')}).populate("cd_gamme").exec(function(err, produits){
                if(err){
                    return next(err);
                }
                Produit_module.find().populate("cd_module").exec(function(err, produits_module){
                   if(err){
                        return next(err);
                    } 
                    Composant.find().exec(function(err, composants){
                       if(err){
                            return next(err);
                        } 
                        Module_composant.find().populate("cd_composant").exec(function(err, modules_composant){
                           if(err){
                                return next(err);
                            }
                            var html = "";
                            html += "<html><body><h2 style='text-align:center'>Dossier Technique</h2>";
                            html += "<h4>Projet</h4>";
                            html += "Référence: <i style='color:blue'>" + projet.id + "</i><br/>";
                            html += "Projet: <i style='color:blue'>" + projet.titre + "</i><br/>";
                            var date = new Date(projet.date_creation);
                            html += "Date: <i style='color:blue'>" + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear() + "</i><br/>";
                            html += "<h4>Produits</h4>";
                            for(var i = 0; i < produits.length; i++){
                                html += "Produit: <i style='color:blue'>" + produits[i].note + "</i><br/>";
                                html += "CCTP: <i style='color:blue'>Lorem Ipsum</i><br/>";
                                for(var u = 0; u < composants.length; u++){
                                    switch(composants[u].id){
                                        case produits[i].cd_gamme.finition_exterieur:
                                             html += "Finition exterieur: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.finition_interieur:
                                             html += "Finition interieur: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.isolant:
                                             html += "Isolation: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                        case produits[i].cd_gamme.couverture:
                                             html += "Couverture: <i style='color:blue'>" + composants[u].designation + "</i><br/>";
                                            break;
                                    }
                                }
                                idProduit = produits[i].id;
                                html += "Modules<br/>";
                                for(var u = 0; u < produits_module.length; u++){
                                    if(produits_module[u].cd_produit == produits[i].id){
                                        html += "&nbsp;&nbsp;<i style='color:blue'>" + produits_module[u].cd_module.designation + "</i><br/>";
                                         html += "&nbsp;&nbsp;&nbsp;&nbsp;Composants<br/>";
                                        var cptcompos = 0;
                                         for(var n = 0; n < modules_composant.length; n++){
                                             if(modules_composant[n].cd_module == produits_module[u].cd_module.id){
                                                 html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style='color:blue'>" + modules_composant[n].cd_composant.designation + "</i> Quantité: " + modules_composant[n].quantite + "<br/>";
                                             }
                                         }
                                    }
                                }
                                html += "<br/>";
                            }
                            pdf.create(html).toStream((err, stream) => {
                                if (err) return res.end(err.stack)
                                res.setHeader('Content-type', 'application/pdf')
                                stream.pipe(res)
                             });
                        })
                        
                    })
                })
                    
                
                
                
            })
            
         })
       
        
    }

};

