/**
 * Produit_module.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  id: false,
  attributes: {
    quantite: {
      type: "string"
    },
    cd_module: {
      model: "module"
    },
    cd_produit: {
      model: "produit"
    }

  }
};

