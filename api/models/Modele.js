/**
 * Modele.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_modele',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    nom: {
      type: "string"
    },
    description: {
      type: "string"
    },
    nbre_etage: {
      type: "string"
    },
    lien_brochure: {
      type: "string"
    },
    cd_gamme: {
      model: "gamme"
    },
    pieces: {
      collection: "piece",
      via: "cd_modele",
      through: "modele_piece"
    },
    modules: {
      collection: "module",
      via: "cd_modele",
      through: "modele_module"
    }

  }
};

