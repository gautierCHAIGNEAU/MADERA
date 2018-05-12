/**
 * ModuleController
 *
 * @description :: Server-side logic for managing modules
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	create: function(req,res){
        res.redirect("/produit/update/" + req.param("produit"));
    }
};

