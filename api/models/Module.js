/**
 * Module.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_module',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    designation: {
      type: "string"
    },
    cctp: {
      type: "string"
    },
    coupe_principe: {
      type: "string"
    },
    longueur: {
      type: "string"
    },
    hauteur: {
      type: "string"
    },
    angle_1: {
      type: "string"
    },
    angle_2: {
      type: "string"
    },
    tarif: {
      type: "string"
    },
    modeles: {
      collection: "modele",
      via: "cd_module",
      through: "modele_module"
    },
    composants: {
      collection: "composant",
      via: "cd_module",
      through: "module_composant"
    },
    produits: {
      collection: "produit",
      via: "cd_module",
      through: "produit_module"
    }

  }
};

