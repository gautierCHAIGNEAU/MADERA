/**
 * Gamme.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_gamme',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    finition_exterieur: {
      model: "composant"
    },
    finition_interieur: {
       model: "composant"
    },
    isolant: {
       model: "composant"
    },
    couverture: {
       model: "composant"
    },
    qualite_huisserie: {
      type: "string"
    },
    nom: {
      type: "string"
    }
  }
};

