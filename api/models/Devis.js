/**
 * Devis.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_devis',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    titre: {
      type: "string"
    },
    remise_tarifaire: {
      type: "string"
    },
    total: {
      type: "string"
    },
    cd_projet: {
      model: "projet"
    },
    cd_produit: {
      model: "produit"
    },
    etats: {
      collection: "etat_devis",
      via: "cd_devis",
      through: "suivi_etat"
    }

  }
};

