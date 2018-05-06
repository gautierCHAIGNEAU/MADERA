/**
 * Produit_moduleController
 *
 * @description :: Server-side logic for managing produit_modules
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */



module.exports = {
	 create: function(req,res,next,data){

            var json = data[1];
            
            for(var i = 0; i < json.length; i++) {
                Produit_module.create({
                    cd_produit: data[0],
                    cd_module: json[i].cd_module.id,
                    quantite: 1
                }, 
                function(err, modules){
                    if(err){
                        return next(err);
                    }

                });
            }

	},
    
    destroy: function(req, res, next, id_produit, id_projet){
		Produit_module.destroy({cd_produit:id_produit}, function(err, prodmod){
			if(err){
				return next(err);
			}
			if(!prodmod){
				return next();
			}
            Produit.destroy(req.param('id'), function(err, produit){
                if(err){
                    return next(err);
                }
                if(!produit){
                    return next();
                }
                res.redirect("/produit/all/" + id_projet);
            });
		});
	}
};

