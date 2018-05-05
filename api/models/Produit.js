/**
 * Produit.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_produit',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    note: {
      type: "string"
    },
    nbr_etage: {
      type: "string"
    },
    cd_gamme: {
      model: "gamme"
    },
    cd_projet: {
      model: "projet"
    },
    cd_devis: {
      model: "devis"
    },
    modules: {
      collection: "module",
      via: "cd_produit",
      through: "produit_module"
    },
    pieces: {
      collection: "piece",
      via: "cd_produit",
      through: "produit_piece"
    }

  }
};

