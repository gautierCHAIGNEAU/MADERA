/**
 * Etat_devis.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_etat',
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
    devis: {
      collection: "devis",
      via: "cd_etat",
      through: "suivi_etat"
    }

  }
};

