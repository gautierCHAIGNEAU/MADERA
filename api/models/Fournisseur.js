/**
 * Fournisseur.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_fournisseur',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    raison_social: {
      type: "string"
    },
    mail: {
      type: "string"
    },
    telephone: {
      type: "string"
    },
    portable: {
      type: "string"
    },
    adresse_numeros: {
      type: "string"
    },
    adresse: {
      type: "string"
    },
    adresse_complementaire: {
      type: "string"
    },
    adresse_ville: {
      type: "string"
    },
    adresse_codepostale: {
      type: "string"
    },
    composants: {
      collection: "composant",
      via: "cd_fournisseur",
      through: "fournisseur_composant"
    }

  }
};

