/**
 * Composant.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_composant',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    designation: {
      type: "string"
    },
    caracteristique: {
      type: "string"
    },
    reference_fournisseur: {
      type: "string"
    },
    tarif: {
      type: "string"
    },
    cd_famille_composant: {
      model: "famille_composant"
    },
    fournisseurs: {
      collection: "fournisseur",
      via: "cd_composant",
      through: "fournisseur_composant"
    },
    taxes: {
      collection: "taxe",
      via: "cd_composant",
      through: "composant_taxe"
    },
    unites: {
      collection: "unite_mesure",
      via: "cd_composant",
      through: "composant_unite"
    },
    modules: {
      collection: "module",
      via: "cd_composant",
      through: "module_composant"
    }

  }
};

